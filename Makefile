IPYKERNEL_NAME := text-extraction-comparison
OS             := $(shell uname -s)
PROJECT_ROOT   := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
PYTHON         ?= venv/bin/python # Assumes that a venv is created, python -m venv venv

ifeq ($(OS), Linux)
	include Linux.mk
else ifeq ($(OS), Darwin)
	include Darwin.mk
endif

.PHONY: bootstrap
bootstrap:
	$(MAKE) pre-commit
	$(MAKE) jupyterlab
	$(MAKE) requirements
	$(MAKE) jupyterlab
	$(MAKE) ipykernel

.PHONY: pre-commit
pre-commit:
	@pipx install pre-commit
	@pre-commit install

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
