# Análisis de Datos del Menú de un Restaurante

## Descripción del Proyecto

Este proyecto se enfoca en analizar las ventas y el rendimiento del menú de un restaurante utilizando datos de dos tablas: menu_items y order_details. Se realizaron diversas consultas SQL para responder preguntas clave que ayudarán a tomar decisiones informadas sobre el lanzamiento de un nuevo menú.

## Estructura del Proyecto

### Tablas Utilizadas
- menu_items: Contiene información sobre los artículos del menú, como menu_item_id, item_name, category, y price.
- order_details: Contiene detalles sobre los pedidos realizados, como order_details_id, order_id, order_date, order_time, y item_id.

### Consultas Realizadas

1. Exploración de la tabla menu_items:
- Número de artículos en el menú: 32 artículos
- Artículo más caro y menos caro: El artículo más barato es de $5.00 y el más caro de $19.95 
- Cantidad de platos de una categoría específica (Americanos): 6 platos
- Precio promedio de los platos: $13.29

2. Exploración de la tabla order_details:
- Total de pedidos únicos: 5,370 pedidos
- Pedidos con mayor número de artículos: 440,2675,3472,4305 y 443
- Fechas del primer y último pedido: 01 de enero del 2023 fue el primer pedido Y 31 de marzo del 2023, el último pedido registrado.
- Pedidos realizados en un rango de fechas específico ('2023-01-01' y '2023-01-05'): 308 pedidos.

3. Análisis adicional utilizando un LEFT JOIN entre order_details y menu_items:
- Artículos más vendidos: Se identificaron los 5 artículos más vendidos, los cuales fueron: Hamburguesa, Edemames, Bowl Coreano de Res, Hamburguesa de queso y Papas a la francesa.
- Días de la semana con más ventas: Se analizó el comportamiento de ventas según el día de la semana, siendo los días lunes y viernes con mayores ventas.
- Precio promedio por categoría: Se calculó el precio promedio por categoría, excluyendo valores nulos. Italiana (16.78), Asiatica (13.46), Mexicana (11.82) y Americana (10.33)
- Artículos menos vendidos: Se identificaron los 5 artículos menos vendidos, excluyendo valores nulos. Los cuales fueron Tacos de pollo, Potstickers, Lasaña de queso, Tacos de Carne y Quesadillas de queso.
- Ventas de artículos más caros: Se evaluó el rendimiento del artícul más caro en el menú. El cual fueron los Camarones Scampi de $19.95 con 239 ventas.

4. Puntos Clave para el Nuevo Menú

- Promocionar los artículos más vendidos: Estos artículos han demostrado ser los favoritos de los clientes y deberían ser destacados en el nuevo menú.
- Optimización de las ventas según el día de la semana: Los días con mayor volumen de ventas podrían beneficiarse de promociones o eventos especiales.
- Ajuste de precios basado en la categoría: El análisis del precio promedio por categoría puede guiar la estrategia de precios del nuevo menú.
- Revisión de artículos menos populares: Los artículos menos vendidos podrían ser revisados o eliminados del nuevo menú.
- Evaluación de artículos premium: Los artículos más caros deben ser analizados para determinar si necesitan una estrategia de marketing especial.
