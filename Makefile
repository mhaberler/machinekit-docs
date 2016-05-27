# see http://www.cmcrossroads.com/ask-mr-make/6535-tracing-rule-execution-in-gnu-make
# to trace make execution of make in more detail:
#     make VV=1
ifeq ("$(origin VV)", "command line")
    OLD_SHELL := $(SHELL)
    SHELL = $(warning Building $@$(if $<, (from $<))$(if $?, ($? newer)))$(OLD_SHELL)
endif

TOPDIR:= $(shell pwd)
SRCDIR:= $(TOPDIR)/src
PYTHON:=/usr/bin/python

# Delete the default suffix rules
.SUFFIXES:
.PHONY: all

all:
	scripts/index-gen.sh man1 'HAL Utilities and GUIs'
	scripts/index-gen.sh man3 'RTAPI and HAL Functions'
	scripts/index-gen.sh man9 'HAL Components'
	scripts/filenums

# all asciidoc documents in this repo
ASCIIDOC := $(shell find docs -name '*.asciidoc')
# corresponding .links files
LINKS := $(patsubst %.asciidoc, %.links, $(ASCIIDOC))

%.links:	%.asciidoc
	asciidoc -f $(SRCDIR)//attribute-colon.conf -a "scriptdir=$(SRCDIR)/" -d book -o- -b docbook $< | xsltproc $(SRCDIR)/links.xslt - > $@

links: $(LINKS) $(TOPDIR)/xref.links


xref.links: $(LINKS)
	$(PYTHON) $(SRCDIR)/links_db_gen.py tmp/ $^ > $@

#all: xref.links

