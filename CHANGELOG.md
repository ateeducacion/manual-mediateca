# Historial de cambios

## [1.2] - 19/10/2026

### Contenido

- Nuevo campo obligatorio 'Restricción de descarga' \[dcterms:accessRights\] en la plantilla 'Ficha_Mediateca' (secciones 3.3 y 4.1.1).
- Nueva sección 4.2.1 sobre cómo controla ese campo los botones de descarga, enlace e incrustación de los archivos,
  sus límites en materia de protección de datos y la necesidad de contar siempre con los consentimientos,
  en especial en las imágenes de menores.

### Maquetación y fuentes

- Portada ajustada al diseño del manual original.
- Separación silábica en español en el PDF.
- El texto fuente se divide en un fichero por capítulo (`manual/capitulos/`) y los logotipos de la portada
  pasan a `manual/assets/` con nombres descriptivos.
- El PDF de `main` se publica en la *pre-release* `latest` y el de cada versión en su *release*.

## [1.1] - 21/07/2026

- Migración del manual desde Word (`.docx`) a Markdown, con generación de PDF mediante pandoc.
- Revisión ortográfica, gramatical y de coherencia (detalle en [REVISION.md](REVISION.md)).
