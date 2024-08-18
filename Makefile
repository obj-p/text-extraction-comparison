BUILDDIR       := build
GROBID_VERSION := 0.8.0
IPYKERNEL_NAME := text-extraction-comparison
PROJECT_ROOT   := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
PYTHON         ?= venv/bin/python # Assumes that a venv is created, python -m venv venv

ifeq ($(shell uname -s), Linux)
	include Linux.mk
else ifeq ($(OS), Darwin)
	include Darwin.mk
endif

ifeq ($(shell uname -m), arm64)
	include arm64.mk
else
	include other-arch.mk
endif

.PHONY: bootstrap
bootstrap:
	$(MAKE) pre-commit
	$(MAKE) jupyterlab
	$(MAKE) requirements
	$(MAKE) jupyterlab
	$(MAKE) ipykernel

.PHONY: builddir
builddir:
	mkdir -p $(BUILDDIR)

.PHONY: clean
clean:
	rm -rf $(BUILDDIR)

.PHONY: pre-commit
pre-commit:
	@pipx install pre-commit
	@pre-commit install

.PHONY:
grobid: builddir
	@cd $(BUILDDIR) && curl -LO https://github.com/kermitt2/grobid/archive/$(GROBID_VERSION).zip \
		&& unzip -o $(GROBID_VERSION).zip \
		&& mv grobid-$(GROBID_VERSION) grobid

.PHONY: ipykernel
ipykernel:
	@$(PYTHON) -m ipykernel install --user --display-name $(PROJECT_ROOT) --name $(IPYKERNEL_NAME)

.PHONY: jupyterlab
jupyterlab:
	@pipx install jupyterlab --include-deps

.PHONY: requirements
requirements:
	@$(PYTHON) -m pip install --upgrade pip && $(PYTHON) -m pip install -r requirements.txt

.PHONY: uninstall-ipykernel
uninstall-ipykernel:
	@jupyter kernelspec uninstall $(IPYKERNEL_NAME)
