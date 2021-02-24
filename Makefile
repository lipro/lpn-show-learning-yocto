# Minimal makefile for Sphinx documentation
#

# avoid uggly issues with online images, warning was:
# WARNING: Could not fetch remote image:
# [time data '...' does not match format '...']
LANG=
export LANG
LC_TIME=
export LC_TIME

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?= -t $@ -W --keep-going
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = source
BUILDDIR      = build

DECKTAPEOPTS  ?= --load-pause 100 --size 1200x875 --slides 1-10
DECKTAPE      ?= decktape

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
	@echo "Supplements:"
	@echo "  revealjs    to make Reveal.js HTML presentation (if enabled)"
	@echo "  revealjspdf to export PDF from Reveal.js presentation (if enabled)"
	@echo "  spelling    to run spelling checker (if enabled)"

.PHONY: help Makefile

revealjspdf: revealjs
	@$(DECKTAPE) reveal $(DECKTAPEOPTS) \
	  "file://$(PWD)/$(BUILDDIR)/revealjs/index.html?altMode=2" \
	  "$(BUILDDIR)/revealjs/index.pdf"

.PHONY: revealjspdf

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
