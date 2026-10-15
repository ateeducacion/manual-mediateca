#!/usr/bin/env bash
# Genera dist/manual-mediateca-v<VERSION>.pdf a partir de manual/manual-mediateca.md
set -euo pipefail
export LANG=C.UTF-8 LC_ALL=C.UTF-8
cd "$(dirname "$0")/.."

# shellcheck source=/dev/null
source version.env
mkdir -p build dist
printf '\\newcommand{\\manualversion}{%s}\n\\newcommand{\\manualdate}{%s}\n' "$VERSION" "$DATE" > build/version.tex

OUT="dist/manual-mediateca-v${VERSION}.pdf"

pandoc manual/manual-mediateca.md \
  --from commonmark_x \
  --pdf-engine=xelatex \
  --resource-path=.:manual \
  --lua-filter=templates/figures.lua \
  --include-in-header=templates/header.tex \
  --include-before-body=templates/cover.tex \
  --toc --toc-depth=3 \
  --metadata title-meta="Manual de usuario - Servicio de Mediateca" \
  --metadata lang=es-ES \
  --metadata toc-title="Índice de contenidos" \
  --variable mainfont="Liberation Sans" \
  --variable geometry="margin=2.2cm" \
  --variable fontsize=11pt \
  --variable colorlinks=true \
  --variable linkcolor=black \
  --variable urlcolor=blue \
  --output "$OUT"

echo "Generado: $OUT"
