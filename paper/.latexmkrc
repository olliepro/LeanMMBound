# latexmk configuration --- installed into a project as `.latexmkrc`.

# Running bare `latexmk` builds the main file. Change if yours isn't main.tex.
@default_files = ('main.tex');
$pdf_mode = 1;

# Always run bibtex when the .aux has citations, and treat the .bbl as a
# regenerable artifact. Without this, a newly added \cite{} may not resolve on
# a normal build (it would need a manual `bibtex main`).
$bibtex_use = 2;
