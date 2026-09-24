-- ============================================================
--  COPIA DE SEGURIDAD DE LA CARTA — Dairus Rosario
--  Generada automáticamente el 24/9/2026, 06:29:27
--  30 secciones · 176 productos
--
--  PARA VOLVER ATRÁS:
--  Supabase → SQL Editor → New query → pegar todo → Run.
--  ⚠️  Reemplaza la carta que haya en ese momento.
-- ============================================================

begin;

delete from public.products;
delete from public.categories;

-- 1. Cafetería
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('c01ec70b-0a5a-4dde-a321-b4912f4a6479', 'Cafetería', '', 1, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1788574561019.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Espresso', 'Shot de café', 2000::numeric, '', 1, true),
  ('Americano', 'Doble shot de café, agua caliente', null, '', 2, true),
  ('Pocillo', 'Americano, cortado, lágrima', 2000, '', 3, true),
  ('Jarrita', 'Americano, cortado, lágrima', 2500, '', 4, true),
  ('Latte/Café con leche', 'Shot de café, leche texturizada', 3500, '', 5, true),
  ('Lágrima doble', 'Leche texturizada, ½ shot de café', 3500, '', 6, true),
  ('Flat White/Cortado doble', 'Doble shot de café, leche texturizada', 3500, '', 7, true),
  ('Té/Mate cocido', 'Con o sin leche', 2500, '', 8, true),
  ('Remo', 'Leche texturizada, barrita de chocolate', 4500, '', 9, true)
) as v(name, descr, price, nota, ord, vis);

-- 2. Especialidad
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('06ed7588-d422-4288-be2d-f4c845646ef2', 'Especialidad', '', 2, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1789096145418.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Capuccino de pistacho', 'Shot de café, ½ oz syrup pistacho, leche texturizada', 4500::numeric, '', 1, true),
  ('Capuccino tricolor', 'Leche texturizada, café, cacao y canela', 4500, '', 2, true),
  ('Caramel Machiatto', 'Doble shot de café, ½ oz de syrup de caramelo, leche texturizada', 4500, '', 3, true),
  ('Cookie Coffee', '2 shot de café, espuma de leche', 6000, '', 4, true),
  ('Cookie Cup Afogatto', 'Vasito de galletitas de vainilla y baño de chocolate, relleno de helado de americana o vainilla, shot de café', 8000, '', 5, true),
  ('Mokaccino', 'Shot de café, ½ oz chocolate, leche texturizada', 4500, '', 6, true),
  ('Vainilla Latte', 'Shot de café, ½ oz syrup de vainilla, leche texturizada', 4500, '', 7, true)
) as v(name, descr, price, nota, ord, vis);

-- 3. Iced Coffe
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('186d1490-e55a-4338-a8ab-66620480c11d', 'Iced Coffe', '', 3, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1789096885104.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Iced Americano', 'Doble shot de espresso, agua / hielo', 5500::numeric, '', 1, true),
  ('Iced Caramel Machiatto', 'Shot de espresso, ¼ oz syrup de caramelo, leche / hielo', 5500, '', 2, true),
  ('Iced Flat White', 'Doble shot de espresso, leche / hielo', 5500, '', 3, true),
  ('Iced Latte', 'Shot de espresso, leche / hielo', 5500, '', 4, true),
  ('Iced Pistacho', 'Shot de espresso, ½ oz syrup pistacho, leche / hielo', 5500, '', 5, true)
) as v(name, descr, price, nota, ord, vis);

-- 4. Sándwiches calientes
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('9fdb560f-0aae-4c4b-926c-651869760fdd', 'Sándwiches calientes', '', 4, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1789095220032.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Calentito', 'Pan de campo, manteca, jamón y queso', null::numeric, '', 1, true),
  ('Carlitos/Tostado', '', 9000, '', 2, true),
  ('Carlitos especial', '', 13000, '', 3, true),
  ('Carlitos pollo', '', 15000, '', 4, true),
  ('Dairus', 'Carne vacuna desmechada a las finas hierbas c/cebolla y queso gratinado, en pan de lomo c/semillas', 18000, '', 5, true)
) as v(name, descr, price, nota, ord, vis);

-- 5. Sándwiches fríos
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('05ba652f-29c1-4011-94af-cf9929acde49', 'Sándwiches fríos', 'Pan de campo', 5, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1788577653198.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Atún', '', 5000::numeric, '', 1, true),
  ('Carne desmechada', '', null, '', 2, true),
  ('Chipá de jamón y queso', '', null, '', 3, true),
  ('Pollo', '', null, '', 4, true),
  ('Primavera', '', 4500, '', 5, true),
  ('Primavera (Miga)', '', null, '', 6, true),
  ('Vegetariano', '', null, '', 7, true)
) as v(name, descr, price, nota, ord, vis);

-- 6. Focaccias
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('6328258a-f7dc-4635-9af2-fa4094de1137', 'Focaccias', '', 6, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1789097834482.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Amor', 'Mortadela c/pistacho, queso Pategras c/manteca', null::numeric, '', 1, true),
  ('Campo', 'Salamín picado grueso y queso Pategras c/manteca', null, '', 2, true),
  ('Mediterránea', 'Jamón crudo, queso Patregras, rúcula, tomates cherrys, lluvia de Parmesano c/manteca y oliva', null, '', 3, true),
  ('Romántica', 'Escabeche de verduras, queso Tybo c/manteca', null, '', 4, true)
) as v(name, descr, price, nota, ord, vis);

-- 7. Croissants
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('c05c378a-0482-4589-91c4-681182d9567f', 'Croissants', '', 7, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1788578503635.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Dulce de leche', '', 4000::numeric, '', 1, true),
  ('Nutella', '', 10000, '', 2, true),
  ('Pastelera', '', 4000, '', 3, true),
  ('Salado c/jamón y queso', '', 6000, '', 4, true),
  ('Promo: croissant mediterranea', 'Crudo rúcula manteca queso 🧀 🧀 cherry', 8000, '', 5, true),
  ('Croissant XXL jamón y queso', '', 13000, '', 6, true),
  ('Croissant 1040', 'Croissant XL, dos hamburguesas XL, lechuga, tomate, jamón, queso y dos huevos. Acompañado con papas $15.000', 22000, 'Para compartir', 7, true)
) as v(name, descr, price, nota, ord, vis);

-- 8. Cuchariables Rosario
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('46eccbb1-43e0-4bfe-bb37-d8b13dcb758d', 'Cuchariables Rosario', '', 8, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1790253915070.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Cheescake Rosario', 'Galletitas vainillas chees cake y frutos rojos', null::numeric, '', 1, true),
  ('Chocotorta Rosario', 'Chocolinas y chocotorta', 6000, '', 2, true),
  ('Oreo Rosario', 'Galletitas oreo dulce de leche y crema oreo', 6000, '', 3, true)
) as v(name, descr, price, nota, ord, vis);

-- 9. Waffles
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('c0440f1a-41e9-4d47-879f-9956e33d0f17', 'Waffles', '', 9, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1788579546316.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Choco Oreo', '', 7000::numeric, '', 1, true),
  ('Dulce de leche y banana', '', 7000, '', 2, true),
  ('Frutilla y chantilly', '', 7000, '', 3, true),
  ('Helado americana, frutos rojos y salsa de caramelo', '', 7000, '', 4, true)
) as v(name, descr, price, nota, ord, vis);

-- 10. Tortas (individuales)
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('53b88b24-25ad-49cd-a65e-b9834884825b', 'Tortas (individuales)', '', 10, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1789097047265.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Baby quaker', '', 8000::numeric, '', 1, true),
  ('Brownie', 'Dulce de leche, chantilly o merengue y frutas o golosinas', 7000, '', 2, true),
  ('Chesse cake', '', 8000, '', 3, true),
  ('Chocotorta - Choco Oreo', '', 7500, '', 4, true),
  ('Crumble manzana', '', 6000, '', 5, true),
  ('Lima Key', '', 7500, '', 6, true),
  ('Tarta frutal / frutilla', '', 7500, '', 7, true),
  ('Tiramisú', '', 7000, '', 8, true),
  ('Tres chocolates', '', 8000, '', 9, true)
) as v(name, descr, price, nota, ord, vis);

-- 11. Tortas (porciones)
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('90001afc-6cc4-461a-91b0-f181771371cc', 'Tortas (porciones)', '', 11, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1789097169811.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Brownie Ferrero', '', 10000::numeric, '', 1, true),
  ('Budín de limón y arándanos', '', 5500, '', 2, true),
  ('Dairus', 'Torta de vainilla, rellenos ganache de choco blanco con f. Rojos y ganache de pistachio', 9500, '', 3, true),
  ('Lemon Pie', '', 7000, '', 4, true),
  ('Matilda', '', 8500, '', 5, true),
  ('Red velvet', '', 8500, '', 6, true),
  ('Ricota', '', 4500, '', 7, true)
) as v(name, descr, price, nota, ord, vis);

-- 12. Cookies
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('142d5a9c-95fc-4d09-9c57-3f0f828dac17', 'Cookies', '', 12, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1788578223922.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Brownie', '', 4500::numeric, '', 1, true),
  ('Chispitas/Rockets', '', 4000, '', 2, true),
  ('Limón', '', 4500, '', 3, true),
  ('Marroc', '', 5000, '', 4, true),
  ('Nutella', '', 5000, '', 5, true),
  ('Pistachio', '', 5000, '', 6, true),
  ('Red Velvet', '', 5000, '', 7, true)
) as v(name, descr, price, nota, ord, vis);

-- 13. Donas
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('aabd9d8f-68d0-46df-8479-67bf8b44ac07', 'Donas', '', 13, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1789097241742.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Clásicas', '', 3500::numeric, '', 1, true),
  ('Coron', 'Frutillas y chantilly', 6000, '', 2, true),
  ('Dairus', 'Rellena con Nutella, baño de chocolate con cubos de brownie y Ferrero en el centro', 9000, '', 3, true),
  ('Pista', 'Bañada con choco saborizado, rellena con crema de pistacho y lluvia de pistacho', 9000, '', 4, true),
  ('Rellenas de dulce de leche', '', 4000, '', 5, true)
) as v(name, descr, price, nota, ord, vis);

-- 14. Fritos
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('526cdf35-e291-4f78-9b4f-bdf2d687b345', 'Fritos', '', 14, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1789100891388.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Churro', '', 1000::numeric, '', 1, true),
  ('Churro acompan̈ado', 'Dulce de leche o pastelera', 1200, '', 2, true),
  ('Churro oreo', '', 1200, '', 3, true),
  ('Minis', 'Mini churros con tres dip, dulce de leche, pastelera y Nutella opcional con almíbar', 15000, '', 4, true),
  ('Pastelitos criollos', '', 1500, '', 5, true),
  ('Tortas fritas', '', 500, '', 6, true)
) as v(name, descr, price, nota, ord, vis);

-- 15. Panadería
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('bbc8e402-33e7-4fc9-b224-ce08f961f65e', 'Panadería', '', 15, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1788577324647.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Medialunas, facturas, bizcochos', '', 1200::numeric, '', 1, true),
  ('Chipá', '', 1200, '', 2, true),
  ('Chocolatoso', '', 3000, '', 3, true)
) as v(name, descr, price, nota, ord, vis);

-- 16. Brunch
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('7ff8d9f1-20ee-4059-9608-70a27f9c813c', 'Brunch', '', 16, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1788579166827.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Brunch Dairus', '2 alfajorcitos de maicena, 1 brownie, 1 cheese cake, 1 dona coron, 2 chipá, 1 focaccia a elección, 2 tazones y 2 vasos de limonada o jugo', 57000::numeric, 'Para 2 personas', 1, true)
) as v(name, descr, price, nota, ord, vis);

-- 17. Desayunos
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('29d30163-4fe3-4856-b798-fb0e57f9e093', 'Desayunos', '', 17, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1789097344940.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Clásico', 'Infusión con 2 medias lunas / facturas', 4500::numeric, '', 1, true),
  ('Tostadas', 'Infusión con 2 tostadas con mermelada y queso crema / dulce de leche / manteca', 6000, '', 2, true),
  ('Tostón', 'Infusión con 1 tostón con huevos revueltos, 2 fetas de jamón cocido y 2 de queso, yogurt y granolas', 9500, '', 3, true),
  ('Avocado', 'Infusión con 2 huevos revueltos, palta, tomates cherry y semillas', 9500, '', 4, true),
  ('Rosarino', 'Infusión con ½ tostado / carlito', 9000, '', 5, true),
  ('Proteico', 'Infusión con un tostón, 2 huevos revueltos, 2 fetas de panceta a la plancha, 2 fetas de queso, mix frutos secos', 10000, '', 6, true),
  ('Saludable', 'Yogurt con granolas, frutas, dips de miel, exprimido / licuado', 10000, '', 7, true),
  ('Campestre', 'Infusión en tazón de 750cc de café filtrado, pan flauta c/manteca y rodajas de salamín, jugo exprimido', 14000, '', 8, true),
  ('Tostón del garden', 'Tostada crujiente base, queso untable sobre un colchón de rúcula, trozos de roquefort y pera con una infusión', 15000, '', 9, true)
) as v(name, descr, price, nota, ord, vis);

-- 18. Bebidas sin alcohol
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('8a651ff6-4dae-434f-9595-5c567828af7e', 'Bebidas sin alcohol', '', 18, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1789101655106.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Agua sin y con gas', '', 3500::numeric, '', 1, true),
  ('Exprimido', 'Natural de naranja', 5000, '', 2, true),
  ('Gaseosas', '', 4000, '', 3, true),
  ('Jarra Frutal', 'Hielo, seven up, frutillas, limón, naranja, arándanos y hoja de menta', 18000, '', 4, true),
  ('Licuado con agua', 'Banana, frutilla, durazno', 4000, '', 5, true),
  ('Licuado con leche', 'Banana, frutilla, durazno', 6500, '', 6, true),
  ('Limonada', 'Jugo de limón, almíbar simple, soda, menta y jengibre', 4000, '', 7, true),
  ('Limonada', 'Jugo de limón, almíbar simple, soda, jengibre y flores de jamaica', 12000, '1 Lt.', 8, true),
  ('Milkshake', '', 7000, '', 9, true),
  ('Pomelada', 'Jugo de pomelo, almíbar simple, soda, menta y albahaca', 4000, '', 10, true),
  ('Pomelada', 'Jugo de pomelo, almíbar simple, soda, menta y albahaca', 12000, '1 Lt.', 11, true),
  ('Shootines', '', 6000, '', 12, true)
) as v(name, descr, price, nota, ord, vis);

-- 19. Hamburguesas/Lomos
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('da84f5f6-cba4-4bcb-8537-4121d5554c31', 'Hamburguesas/Lomos', '', 19, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1789098145586.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Hamburguesa especial', 'Hamburguesa, jamón, queso, lechuga, tomate y huevo en pan de papas acompañado con papas', 15000::numeric, '', 1, true),
  ('La estrella de la noche', 'Donas glaseada, hamburguesas Xl, queso chedar en feta,3 tiras bacon  y 8 churros de papas', 20000, 'Opcional 2 hamburguesas', 2, true),
  ('Lomito del garden', 'Pan de lomo, jamón, queso, lechuga, tomate, huevo y lomo tiernizado acompañado con churros de papas', 23000, '', 3, true)
) as v(name, descr, price, nota, ord, vis);

-- 20. Pizzas
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('e5424797-d38b-4dd2-880b-216fd5471cb1', 'Pizzas', '', 20, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1789098526514.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Ananá', 'Tomate, muzzarella, rúcula, peras, roquefort y nuez', 22000::numeric, 'Entera', 1, true),
  ('Ananá', 'Tomate, muzzarella, jamón, ananá y azúcar rubia', 15000, '½ pizza', 2, true),
  ('Cantimpalo', '', 22000, 'Entera', 3, true),
  ('Cantimpalo', '', 12000, '½ pizza', 4, true),
  ('Especial', '', 20000, 'Entera', 5, true),
  ('Especial', '', 11000, '½ pizza', 6, true),
  ('La bomba del garden', 'Tomate, muzzarella, colchón de rúcula, peras, acompan̈ado con trozos de roquefort y detalles de nueces mariposas', 25000, 'Entera', 7, true),
  ('Mariscos', '', 35000, 'Entera', 8, true),
  ('Mariscos', '', 18000, '½ pizza', 9, true),
  ('Muzzarella', '', 15000, 'Entera', 10, true),
  ('Muzzarella', '', 9000, '½ pizza', 11, true),
  ('Napolitana', '', 20000, 'Entera', 12, true),
  ('Napolitana', '', 12000, '½ pizza', 13, true)
) as v(name, descr, price, nota, ord, vis);

-- 21. Tablas
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('8c15a364-2626-4bac-bdd9-2a514bd6b9b4', 'Tablas', '', 21, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1789098602468.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Picada', 'Tortilla de papas, salamin, queso en cubos y olivas', 25000::numeric, 'Para 2 personas', 1, true),
  ('Picada fiambre', 'Tres tipos de queso, jamón cocido, jamón crudo, mortadela, salamín, olivas verdes y negras.', 50000, '', 2, true),
  ('Tabla de mar', 'Rabas, cornalitos, 3 langostinos, dos brochet de camarones con panceta y papas fritas', 60000, 'Para 3 personas', 3, true),
  ('Tabla de rebozados', 'rabas, bastones de muzza, nuggets de pollo, milanesa, suprema, alitas de pollo, olivas y pickles, todo sobre un colchón de papas fritas', 70000, 'Comen 4. Pican 5', 4, true)
) as v(name, descr, price, nota, ord, vis);

-- 22. Para picar en el garden
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('4d364f60-c0ab-467e-ba40-0c5358c4b3b9', 'Para picar en el garden', '', 22, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1789098892523.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Alitas de pollo', 'Alitas de pollo rebozadas', 10000::numeric, '', 1, true),
  ('Bastones de muzarella', '', 20000, '', 2, true),
  ('Rabas', '', 25000, '', 3, true),
  ('Rebozados', '4 Bastones de muzzarella papas tiras de rebozados de carne y pollo y 2 empanadas y 2 vasos de vermut', 50000, 'Para 2 personas', 4, true)
) as v(name, descr, price, nota, ord, vis);

-- 23. Copetín
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('cf82aa5a-0866-470b-9471-f0ca6bdbd61b', 'Copetín', '', 23, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1789099271530.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Dados de queso saborizados', '', 5000::numeric, '', 1, true),
  ('Maní', '', 3000, '', 2, true),
  ('Olivas', '', 3500, '', 3, true),
  ('Palitos', '', 2500, '', 4, true),
  ('Papas copetín', '', 3000, '', 5, true),
  ('Papas de la casa', 'Papas con panceta, huevo y verdeo', 15000, '', 6, true),
  ('Cheddar', '', 3000, 'Adicional', 7, true)
) as v(name, descr, price, nota, ord, vis);

-- 24. Menú infantil
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('c19a7eff-a68b-4368-9750-4c1554f17883', 'Menú infantil', '', 24, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1789099891270.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Infantil', '8 nuggets con papas fritas', 12000::numeric, '', 1, true)
) as v(name, descr, price, nota, ord, vis);

-- 25. Tragos
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('6636147b-6d19-4bdc-ab54-730f983f3097', 'Tragos', '', 25, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1789099979196.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Aperol Spritz', 'Aperol, champagne, soda y gajos de naranja', 7500::numeric, 'Vermut', 1, true),
  ('Caramel Ice', 'Helado de americano, caramel y Nutella', 8000, '', 2, true),
  ('Cynar Julep', 'Cynar, gaseosa pomelo, menta y azúcar', 7500, 'Vermut', 3, true),
  ('Daiquiri', 'Ron, frutas naturales, limón y azúcar', 7500, '', 4, true),
  ('Fernet Branca', 'Fernet Branca y Coca Cola', 7500, 'Vermut', 5, true),
  ('Ferroviario', 'Fernet, soda, Carpano Rosso', 7500, 'Vermut', 6, true),
  ('Gancia', 'Gancia y Sprite', 7500, 'Vermut', 7, true),
  ('Garibaldi', 'Campari y exprimido de naranja', 7500, 'Vermut', 8, true),
  ('Gin Citric', 'Gin, tónica y gajos de cítricos', 7500, '', 9, true),
  ('Gin Frutos Rojos', 'Gin, tónica, frutos rojos y flor de Jamaica', 8000, '', 10, true),
  ('Gin Tonic', 'Gin, tónica y gajos de limón', 7500, '', 11, true),
  ('Lemon Champ', '', 7500, '', 12, true),
  ('Negroni', 'Cinzano Rosso, gin y Campari', 7500, 'Vermut', 13, true),
  ('Rosarino', 'Amargo Obrero y gaseosa pomelo', 7500, 'Vermut', 14, true)
) as v(name, descr, price, nota, ord, vis);

-- 26. Whiskys
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('080b2727-2c7f-407c-afeb-923ae8c745bf', 'Whiskys', '', 26, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1789100182078.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Chivas Regal', '', 7000::numeric, '', 1, true),
  ('Jameson', '', 7500, '', 2, true),
  ('Johnnie Walker Red Label', '', 7000, '', 3, true)
) as v(name, descr, price, nota, ord, vis);

-- 27. Jarras
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('5b440d24-1c5c-42d3-bde5-b9114573d05d', 'Jarras', '', 27, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1789100379082.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Lemon Champ', '', 25000::numeric, '', 1, true),
  ('Sangría', 'Vino de la casa, Sprite, rodajas de naranja, exprimido y azúcar', 13000, '1 Lt. Para compartir', 2, true)
) as v(name, descr, price, nota, ord, vis);

-- 28. Vinos
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('2dc4e497-6de8-4a6a-b3e7-c4d724e66fd7', 'Vinos', '', 28, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1789100442658.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Bournett IG Chardonnay', '', 10000::numeric, '', 1, true),
  ('Bournett Malbec', '', 10000, '', 2, true),
  ('Bournett Malbec Rose', '', 10000, '', 3, true),
  ('Bournett RS', '', 22000, '', 4, true),
  ('Prestige Pinot Noir', '', 16000, '', 5, true),
  ('Santa Julia Chenin Blanco Dulce', '', 11000, '', 6, true)
) as v(name, descr, price, nota, ord, vis);

-- 29. Espumantes
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('58a7fd69-3ea1-4f70-8630-494481d02902', 'Espumantes', '', 29, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1789102136911.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Salentein', '', 22000::numeric, '', 1, true),
  ('Sidra 1888', '', 9800, '', 2, true)
) as v(name, descr, price, nota, ord, vis);

-- 30. Cervezas
with c as (
  insert into public.categories (id, name, description, sort_order, visible, image_url)
  values ('fd8b5e28-1024-4e34-be6e-c50b4e7a0e15', 'Cervezas', '', 30, true, 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/seccion-1789100599914.jpg') returning id
)
insert into public.products (category_id, name, description, price, price_note, sort_order, visible)
select c.id, v.name, v.descr, v.price, v.nota, v.ord, v.vis from c, (values
  ('Amstel 1 Lt.', '', 9000::numeric, '', 1, true),
  ('Heineken 0 330 cc', '', 6500, '', 2, true),
  ('Heineken 1 Lt.', '', 12000, '', 3, true),
  ('Heineken 330 cc', '', 6500, '', 4, true),
  ('Imperial Especiales 1 Lt.', '', 11000, '', 5, true),
  ('Imperial Golden 1 Lt.', '', 11000, '', 6, true),
  ('Porroncito 340 cc', '', 6500, '', 7, true)
) as v(name, descr, price, nota, ord, vis);

-- nombre, colores, logo, fondo, horarios y contactos
update public.settings set
  bar_name = 'Dairus Rosario',
  tagline = 'Viví la experiencia',
  logo_url = 'https://kkvtsodkmkxxmklsdlru.supabase.co/storage/v1/object/public/carta/logo-1789441648989.jpg',
  bg_url = null,
  bg_dim = 0.5,
  accent = '#2ab49c',
  font = 'serif',
  currency_symbol = '$',
  footer_text = 'Abierto de lunes a viernes, de 7 a 20 hs. Fines de semana y feriados, de 8 a 13 y de 16 a 20 hs.',
  theme = 'claro',
  sec_alpha = 0.5,
  whatsapp = '+54 9 341 339-0659',
  instagram = 'dairus.rosario',
  facebook = 'dairus.rosario',
  direccion = 'Rueda 1040, Rosario',
  mapa_url = 'https://www.google.com/maps/place/Rueda+1040,+S2001+Rosario,+Santa+Fe/@-32.9710023,-60.6434725,17z/data=!3m1!4b1!4m6!3m5!1s0x95b7aba43140ed11:0x716be98d501ce6b5!8m2!3d-32.9710023!4d-60.6434725!16s%2Fg%2F11k4hk0y2v'
where id = 1;

commit;
