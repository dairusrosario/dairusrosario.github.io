/* Service worker de la carta.
   Estrategia: SIEMPRE primero la red. La caché es sólo un salvavidas para
   cuando no hay señal, así un precio actualizado nunca queda viejo.
   Las llamadas a Supabase y a los CDN no se tocan: van derecho a la red. */

const CACHE = "carta-v2";
const SHELL = [
  "./",
  "./index.html",
  "./manifest.json",
  "./icons/icon-192.png",
  "./icons/icon-512.png",
  "./icons/apple-touch-icon.png",
  "./icons/favicon-32.png"
];

self.addEventListener("install", (e) => {
  e.waitUntil(
    caches.open(CACHE)
      // uno por uno y tolerante: si falta un archivo, la instalación no se cae
      .then((c) => Promise.all(SHELL.map((u) => c.add(u).catch(() => null))))
      .then(() => self.skipWaiting())
  );
});

self.addEventListener("activate", (e) => {
  e.waitUntil(
    caches.keys()
      .then((keys) => Promise.all(keys.filter((k) => k !== CACHE).map((k) => caches.delete(k))))
      .then(() => self.clients.claim())
  );
});

/* Las imágenes del depósito de Supabase llevan la fecha en el nombre
   (seccion-1788574561019.jpg), así que una dirección nunca cambia de
   contenido: cambiar la foto crea otra dirección. Por eso acá sí se puede
   guardar para siempre, y el cliente que vuelve al bar no las vuelve a
   descargar. Con 17 fotos de sección más las de producto, esto es la
   diferencia entre entrar o no en el plan gratuito. */
const ES_FOTO = /\/storage\/v1\/object\/public\//;

self.addEventListener("fetch", (e) => {
  const req = e.request;
  if (req.method !== "GET") return;

  const url = new URL(req.url);

  if (ES_FOTO.test(url.pathname)) {
    e.respondWith(
      caches.open(CACHE).then((c) =>
        c.match(req).then((hit) =>
          hit || fetch(req).then((res) => {
            if (res && (res.ok || res.type === "opaque")) c.put(req, res.clone());
            return res;
          })))
        .catch(() => fetch(req))
    );
    return;
  }

  if (url.origin !== self.location.origin) return; // Supabase (datos), fuentes, CDN

  e.respondWith(
    fetch(req)
      .then((res) => {
        if (res && res.ok) {
          const copy = res.clone();
          caches.open(CACHE).then((c) => c.put(req, copy));
        }
        return res;
      })
      .catch(() =>
        caches.match(req).then((hit) =>
          hit || (req.mode === "navigate" ? caches.match("./index.html") : undefined)
        )
      )
  );
});
