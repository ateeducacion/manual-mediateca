# Manual de usuario de la Mediateca

Control de versiones del **Manual de usuario del servicio de Mediateca** (*Guía para responsables y editores de contenidos*), mantenido en Markdown y publicado en PDF.

## Estructura

| Ruta | Contenido |
| --- | --- |
| `manual/manual-mediateca.md` | Texto fuente del manual (GitHub Flavored Markdown) |
| `manual/media/` | Capturas y logotipos |
| `manual/original-v1.1.docx` | Documento Word original (v1.1), solo como referencia histórica |
| `templates/` | Portada, cabeceras/pies LaTeX y filtro Lua para los pies de figura |
| `scripts/build.sh` | Genera el PDF con pandoc + XeLaTeX |
| `version.env` | Versión y fecha que aparecen en la portada y el pie de página |
| `dist/` | Salida local del PDF (no se versiona; el PDF oficial se publica en las *releases*) |
| `CHANGELOG.md` | Historial de versiones |
| `REVISION.md` | Informe de revisión ortográfica, gramatical y de coherencia |

## Generar el PDF

Genera el PDF en `dist/` (ignorado por git). Requisitos: `pandoc` (>= 3.1), `xelatex` (TeX Live con `latex-extra`) y la fuente Liberation Sans.

```sh
make pdf        # -> dist/manual-mediateca-v<VERSION>.pdf
```

## Pipeline

El workflow [`build-pdf.yml`](.github/workflows/build-pdf.yml) genera el PDF en cada *push* y *pull request*
(artefacto `manual-mediateca-pdf`). Al subir una etiqueta `vX.Y` se publica además una *release* con el PDF adjunto.

## Cómo editar

1. Crea una rama y modifica `manual/manual-mediateca.md`.
2. Si cambia la versión, actualiza `version.env` y `CHANGELOG.md`.
3. Abre una *pull request*; el pipeline comprobará que el PDF se genera.
4. Para publicar: `git tag vX.Y && git push origin vX.Y`.

Convenciones: tratamiento de «usted», comillas simples `'...'` para nombres de elementos de la interfaz, y figuras numeradas
correlativamente (`**Figura N:**`) en orden de aparición.
