#!/bin/sh
# Quiet LaTeX build.
#
# Compiles the main .tex with latexmk and prints only a short summary --- exit
# status, the warnings that actually matter (undefined refs/citations, errors,
# badly overfull boxes), and the page count. The full log stays in <main>.log.
# Use this instead of calling latexmk/pdflatex directly so tool output stays
# small.
#
# Usage: ./build.sh [main-tex-file]
#   With no argument it uses main.tex if present, otherwise the single .tex in
#   this directory that contains \documentclass.
cd "$(dirname "$0")" || exit 1

main=$1
if [ -z "$main" ]; then
  if [ -f main.tex ]; then
    main=main.tex
  else
    main=$(grep -lE '^[[:space:]]*\\documentclass' ./*.tex 2>/dev/null | head -1)
  fi
fi
if [ -z "$main" ] || [ ! -f "$main" ]; then
  echo "build.sh: no main .tex found (pass one as an argument)" >&2
  exit 2
fi
base=${main%.tex}

log=$(mktemp)
latexmk -pdf -silent -interaction=nonstopmode "$main" >"$log" 2>&1
status=$?
echo "=== latexmk $main exit $status ==="
grep -iE "warning: (citation|reference)[^']*undefined|undefined (control sequence|reference|citation)|^! |multiply defined|overfull \\\\hbox \([0-9]{3,}" "$log" \
  | sort -u | head -40
printf -- "--- %s undefined-mentions, %s overfull-boxes ---\n" \
  "$(grep -ci undefined "$log")" "$(grep -ciE 'overfull' "$log")"
# Page count / output line lives in <main>.log under -silent, not on stdout.
grep -hE "Output written on" "$log" "$base.log" 2>/dev/null | tail -1
rm -f "$log"
exit $status
