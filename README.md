# Text Extraction Comparison

## Getting started

1. Create a virtual environment: `python -m venv venv`
2. `make brew` on MacOS with [Homebrew](https://brew.sh) or `make apt-get` on Linux
3. `make bootstrap`

## Devcontainer

The [.devcontainer](.devcontainer) is a WIP.

## GROBID

To start the GROBID service run `docker compose up grobid` in a shell. For ARM64 machines, see
[On ARM64 machines (i.e. Mac M-series)](#on-arm64-machines-ie-mac-m-series).

### On ARM64 machines (i.e. Mac M-series)

1. `cd docker && make grobid`
2. `docker compose up grobid`

Please note that the ARM64 supported docker image uses CRF models instead of deep learning models
supported by tensorflow! See [Docker on macOS arm64 #1089](https://github.com/kermitt2/grobid/issues/1089).
