# Copias de seguridad de la carta

Los dos archivos de esta carpeta los escribe sola, todos los días a las 6 de
la mañana, la tarea `.github/workflows/copia-diaria.yml`. Sólo se guardan
cuando algo cambió, así que si pasan días sin novedades no vas a ver commits
nuevos: no está rota, es que la carta está igual.

- **`carta.json`** — la copia que lee el panel.
- **`carta.sql`** — la copia para pegar en Supabase.

## Volver a una versión anterior

**Si el panel abre** (lo normal): Administración → Copias → Restaurar.
Necesitás el archivo `.json` en tu computadora. Para bajar el del día que
quieras, abrí `carta.json` acá en GitHub, tocá **History**, elegí la fecha,
entrá a esa versión y usá **Raw** para descargarla.

**Si el panel no abre**: abrí `carta.sql` de la misma forma, copiá todo el
contenido y pegalo en Supabase → SQL Editor → New query → Run.

En los dos casos se reemplaza la carta que haya en ese momento.

## Las fotos

No están adentro de estos archivos. Viven en el depósito de Supabase y la
copia guarda la dirección de cada una, junto con el identificador interno de
su sección. Mientras no las borres de Supabase, al restaurar vuelven solas.

## Correr la copia ahora mismo

Pestaña **Actions** del repositorio → *Copia diaria de la carta* →
**Run workflow**.

## Si deja de correr

GitHub apaga las tareas programadas de un repositorio público cuando pasan
60 días sin actividad, y avisa por mail. Se vuelve a encender desde Actions
con un clic. Conviene mirar de vez en cuando que la última corrida esté en
verde.
