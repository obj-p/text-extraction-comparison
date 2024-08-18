# Text Extraction Comparison

## Getting started

1. Create a virtual environment: `python -m venv venv`
2. `make brew` on MacOS with [Homebrew](https://brew.sh) or `make apt-get` on Linux
3. `make bootstrap`

## Devcontainer

The [.devcontainer](.devcontainer) is a WIP.

## GROBID

To start the GROBID service run `make grobid-run` in a shell (runs with `docker compose`). For ARM64 machines, see
[On ARM64 machines (i.e. Mac M-series)](#on-arm64-machines-ie-mac-m-series).

### On ARM64 machines (i.e. Mac M-series)

Ensure that the current `JAVA_HOME` is set to [OpenJDK 17](https://openjdk.org/projects/jdk/17/). On arm64 machines,
`make grobid && make grobid-run` will run GROBID from source.
