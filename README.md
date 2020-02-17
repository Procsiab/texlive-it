# TexLive for ARMv7 (32bit) and ARM 64bit with Italian language

![Docker Pulls](https://img.shields.io/docker/pulls/procsiab/texlive-rpi-it.svg)
![Docker Stars](https://img.shields.io/docker/stars/procsiab/texlive-rpi-it.svg)
![GitHub last commit (branch)](https://img.shields.io/github/last-commit/Procsiab/texlive-rpi-it/master.svg)

This image was built to use with CI/CD LaTeX testing and deploying pipeline, on an x86_64 machine; the image 
itself is based on Debian slim, and it uses `bash`. Moreover, the mountpoint for the compiler's workspace is under 
the `/workspace` folder (you should mount there the volume containing your sources)

Docker Hub reporitory:
https://hub.docker.com/r/procsiab/texlive-rpi-it

## Building with Dockerfile

The Dockerfile is written to allow cross-architecture builds, using QEMU's user-static package: to build the image on x86 for another platform do the following:

- be sure to install `qemu-user-static` if you need to run the container on an architecture different from the local one;
- to build the container for *aarch64*, run `cp $(which qemu-aarch64-static) .`;
- run the build process with `docker build -t myregistry/texlive-rpi-it:arm64 .`.

If you want to use a target architecture different from ARM 64 bit, just change the Dockerfile according to the needed _qemu-static-*_ binary file, and copy it into the repo directory as shown above. Also, remember to specify the correct base image at the beinning of the Dockerfile.

### Tags and architectures

- `arm32`: ARMv7 32 bit arch.
- `arm64`: ARM 64 bit arch.

Change the tag when you pull from the registry, e.g. `docker pull procsiab/texlive-rpi-it:arm64`
