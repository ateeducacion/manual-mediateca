# Manual de usuario de la Mediateca

Control de versiones del **Manual de usuario del servicio de Mediateca** (*Guía para responsables y editores de contenidos*), mantenido en Markdown y publicado en PDF.

## Estructura

| Ruta | Contenido |
| --- | --- |
| `manual/capitulos/` | Texto fuente del manual, un fichero por capítulo (`NN-nombre.md`, se unen en orden de nombre) |
| `manual/media/` | Capturas de pantalla de las figuras |
| `manual/assets/` | Logotipos de la portada |
| `manual/original-v1.1.docx` | Documento Word original (v1.1), solo como referencia histórica |
| `templates/` | Portada, cabeceras/pies LaTeX y filtro Lua para los pies de figura |
| `scripts/build.sh` | Genera el PDF con pandoc + XeLaTeX |
| `version.env` | Versión y fecha que aparecen en la portada y el pie de página |
| `dist/` | Salida local del PDF (no se versiona; el PDF oficial se publica en las *releases*) |
| `CHANGELOG.md` | Historial de versiones |
| `REVISION.md` | Informe de revisión ortográfica, gramatical y de coherencia |

## Generar el PDF

Genera el PDF en `dist/` (ignorado por git). Requisitos: `pandoc` (>= 3.1), `xelatex` (TeX Live con `latex-extra` y `texlive-lang-spanish` para la separación silábica en español) y la fuente Liberation Sans.

```sh
make pdf        # -> dist/manual-mediateca-v<VERSION>.pdf
```

## Pipeline

El workflow [`build-pdf.yml`](.github/workflows/build-pdf.yml) genera el PDF en cada *push* y *pull request*
(artefacto `manual-mediateca-pdf`), y además:

- **Merge a `main`**: sustituye la *pre-release* [`latest`](../../releases/tag/latest) por el PDF recién generado
  (versión de trabajo, no oficial).
- **Etiqueta `vX.Y`**: comprueba que coincide con `VERSION` de `version.env`, genera el PDF y lo adjunta a la
  *release* `vX.Y` (la crea si no existe; si se creó desde la web de GitHub, solo añade el PDF).

## Cómo editar

1. Crea una rama y modifica el capítulo correspondiente en `manual/capitulos/`. Las imágenes se enlazan como
   `../media/imageN.png`.
2. Si cambia la versión, actualiza `version.env` y `CHANGELOG.md`.
3. Abre una *pull request*; el pipeline comprobará que el PDF se genera.
4. Para publicar: actualiza `version.env` a `X.Y` en `main` y después `git tag vX.Y && git push origin vX.Y`
   (o crea la *release* `vX.Y` desde la web de GitHub).

Convenciones: tratamiento de «usted», comillas simples `'...'` para nombres de elementos de la interfaz, y figuras numeradas
correlativamente (`**Figura N:**`) en orden de aparición.
