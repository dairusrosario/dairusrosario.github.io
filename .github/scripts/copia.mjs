/* ============================================================
   Copia de seguridad de la carta de Dairus Rosario.

   Le pide los datos a Supabase y escribe dos archivos en copias/:
     carta.json  → el mismo formato que descarga el panel, así que
                   se puede restaurar desde Administración → Copias.
     carta.sql   → para pegar en Supabase → SQL Editor si algún día
                   el panel no abre.

   Corre sola todos los días desde .github/workflows/copia-diaria.yml.
   ============================================================ */

import { writeFile, mkdir } from "node:fs/promises";
import path from "node:path";

const URL_BASE = (process.env.SUPABASE_URL || "").replace(/\/+$/, "");
const CLAVE = process.env.SUPABASE_KEY || "";
const DESTINO = process.env.DESTINO || "copias";

/* ---------- leer ---------- */

async function pedir(tabla, consulta) {
  const url = `${URL_BASE}/rest/v1/${tabla}?${consulta}`;
  const res = await fetch(url, {
    headers: { apikey: CLAVE, Authorization: `Bearer ${CLAVE}` }
  });
  if (!res.ok) {
    throw new Error(`${tabla}: ${res.status} ${res.statusText} — ${await res.text()}`);
  }
  return res.json();
}

export async function leerTodo() {
  const [settings, categories, products] = await Promise.all([
    pedir("settings", "select=*&id=eq.1"),
    pedir("categories", "select=*&order=sort_order"),
    pedir("products", "select=*&order=sort_order")
  ]);
  return {
    settings: (settings && settings[0]) || {},
    categories: categories || [],
    products: products || []
  };
}

/* ---------- armar el .sql ---------- */
// Mismas reglas que el botón Copias del panel, para que las dos
// copias sean intercambiables.

const VOLATILES = /_at$/;                    // created_at / updated_at los pone la base
const txt = (v) => (v == null ? "null" : "'" + String(v).replace(/'/g, "''") + "'");
const num = (v) => (v == null || v === "" ? "null" : String(Number(v)));
const bool = (v) => (v ? "true" : "false");
const val = (v) =>
  v === null || v === undefined ? "null" :
  typeof v === "number" ? String(v) :
  typeof v === "boolean" ? bool(v) : txt(v);

export function armarSql(data, cuando) {
  const L = [];
  L.push("-- ============================================================");
  L.push("--  COPIA DE SEGURIDAD DE LA CARTA — " + (data.settings.bar_name || "Carta"));
  L.push("--  Generada automáticamente el " + cuando);
  L.push("--  " + data.categories.length + " secciones · " + data.products.length + " productos");
  L.push("--");
  L.push("--  PARA VOLVER ATRÁS:");
  L.push("--  Supabase → SQL Editor → New query → pegar todo → Run.");
  L.push("--  ⚠️  Reemplaza la carta que haya en ese momento.");
  L.push("-- ============================================================");
  L.push("");
  L.push("begin;");
  L.push("");
  L.push("delete from public.products;");
  L.push("delete from public.categories;");
  L.push("");

  data.categories.forEach((c, i) => {
    const items = data.products
      .filter((p) => p.category_id === c.id)
      .sort((a, b) => (a.sort_order || 0) - (b.sort_order || 0));
    L.push("-- " + (i + 1) + ". " + c.name);
    L.push("with c as (");
    L.push("  insert into public.categories (id, name, description, sort_order, visible, image_url)");
    L.push("  values (" + [
      txt(c.id), txt(c.name), txt(c.description || ""),
      Number(c.sort_order) || 0, bool(c.visible), txt(c.image_url)
    ].join(", ") + ") returning id");
    L.push(")");
    if (!items.length) {
      L.push("select count(*) from c;");
    } else {
      L.push("insert into public.products (category_id, name, description, price, price_note, sort_order, visible, sold_out, featured)");
      L.push("select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis, v.agot, v.dest from c, (values");
      L.push(items.map((p, j) => "  (" + [
        txt(p.name),
        txt(p.description || ""),
        num(p.price) + (j === 0 ? "::numeric" : ""),
        txt(p.price_note || ""),
        Number(p.sort_order) || 0,
        bool(p.visible),
        bool(p.sold_out),
        bool(p.featured)
      ].join(", ") + ")").join(",\n"));
      L.push(") as v(name, descr, price, nota, ord, vis, agot, dest);");
    }
    L.push("");
  });

  const campos = Object.keys(data.settings)
    .filter((k) => k !== "id" && !VOLATILES.test(k))
    .map((k) => "  " + k + " = " + val(data.settings[k]));
  if (campos.length) {
    L.push("-- nombre, colores, logo, fondo, horarios y contactos");
    L.push("update public.settings set");
    L.push(campos.join(",\n"));
    L.push("where id = 1;");
    L.push("");
  }
  L.push("commit;");
  L.push("");
  return L.join("\n");
}

/* ---------- armar el .json ---------- */
// Sin la fecha adentro: si el contenido no cambió, el archivo queda
// idéntico y la tarea no hace un commit al pedo. La fecha real de
// cada copia la guarda el historial de GitHub.

export function armarJson(data) {
  return JSON.stringify({
    formato: "carta-bar",
    version: 1,
    origen: "copia automática diaria",
    bar: data.settings.bar_name || "",
    settings: data.settings,
    categories: data.categories,
    products: data.products
  }, null, 2) + "\n";
}

/* ---------- principal ---------- */

export async function generar(data, destino) {
  const cuando = new Date().toLocaleString("es-AR", { timeZone: "America/Argentina/Buenos_Aires" });
  await mkdir(destino, { recursive: true });
  await writeFile(path.join(destino, "carta.json"), armarJson(data));
  await writeFile(path.join(destino, "carta.sql"), armarSql(data, cuando));
  return {
    secciones: data.categories.length,
    productos: data.products.length,
    sinPrecio: data.products.filter((p) => p.price == null).length
  };
}

const esPrincipal = process.argv[1] && import.meta.url.endsWith(path.basename(process.argv[1]));
if (esPrincipal) {
  if (!URL_BASE || !CLAVE) {
    console.error("Faltan SUPABASE_URL o SUPABASE_KEY.");
    process.exit(1);
  }
  try {
    const data = await leerTodo();
    if (!data.categories.length) {
      // Una carta vacía casi siempre es un error de lectura, no una carta
      // vacía de verdad. Antes que pisar la copia buena, cortamos.
      console.error("La base devolvió 0 secciones. No piso la copia anterior.");
      process.exit(1);
    }
    const r = await generar(data, DESTINO);
    console.log(`Copia lista: ${r.secciones} secciones, ${r.productos} productos` +
                (r.sinPrecio ? `, ${r.sinPrecio} sin precio` : ""));
  } catch (err) {
    console.error("No se pudo generar la copia:", err.message);
    process.exit(1);
  }
}
