# TexLive multi-arch with Italian language

[![Container Build](https://github.com/Procsiab/texlive-it/actions/workflows/build-container-publish-dockerhub.yaml/badge.svg)](https://github.com/Procsiab/texlive-it/actions/workflows/build-container-publish-dockerhub.yaml)

![Docker Image Version (latest by date)](https://img.shields.io/docker/v/procsiab/texlive-it?label=Latest%20tag%20pushed%20on%20Docker%20Hub)

#### Description

This image was built to be used with a LaTeX testing and deploying pipeline, on an x86\_64 machine; the image 
itself is based on Debian slim, and it uses `bash`. Moreover, the mount point for the compiler's workspace is 
under the `/workspace` folder (you should mount there the volume containing your LaTeX sources)

Also, the container images for ARMv7, AARCH64 and x86\_64 platforms are automatically built from this repository, and available from [Docker Hub](https://hub.docker.com/r/procsiab/texlive-it)

## Building with Containerfile

The Containerfile is written to allow cross-architecture builds, using QEMU's user-static package: to build the image on x86 for another platform do the following:

- be sure to install `qemu-user-static` if you need to run the container on an architecture different from the local one;
- run the build process with `podman build -f Containerfile.aarch64 -t myregistry/texlive-it:v1.0-aarch64 .`

### Configure TexLive

You can change the installation candidate packages by editing the *texlive.profile* file, including adding or removing languages (by default Italian will be installed).

Using the file `packages.txt` you can provide additional package names to be downloaded using the `tlmgr` package manager, when building the container image.

## Compiling documents from the container

1. Change directory to your soruce code root;
2. run the following command:
```bash
podman run --rm -it -v $(pwd):/workdir:z procsiab/texlive-it:v1.5-amd64 bash
```
3. to output a PDF, from the prompt inside the container, invoke the compiler as follows:
```bash
latexmk -quiet -pdf -pdflatex="pdflatex -interaction=nonstopmode"
```
