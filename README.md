# TexLive multi-arch with Italian language

This image was built to use with CI/CD LaTeX testing and deploying pipeline, on an x86\_64 machine; the image 
itself is based on Debian slim, and it uses `bash`. Moreover, the mountpoint for the compiler's workspace is 
under the `/workspace` folder (you should mount there the volume containing your sources)

Also, the Docker Images for ARMv7, AARCH64 and x86\_X64 platforms are automatically built from this repository, and available from [Docker Hub](https://hub.docker.com/r/procsiab/texlive-it)

## Building with Dockerfile

The Dockerfile is written to allow cross-architecture builds, using QEMU's user-static package: to build the image on x86 for another platform do the following:

- be sure to install `qemu-user-static` if you need to run the container on an architecture different from the local one;
- to build the container for *aarch64*, run `cp $(which qemu-aarch64-static) .`;
- run the build process with `docker build -t myregistry/texlive-rpi-it:arm64 .`.

If you want to use a target architecture different from ARM 64 bit, just change the Dockerfile according to the needed _qemu-static-*_ binary file, and copy it into the repo directory as shown above. Also, remember to specify the correct base image at the banning of the Dockerfile.

### Configure TexLive

You can change the installation candidates by editing the *texlive.profile* file, including adding or removing languages (by default Italian will be installed).

### Tags and architectures

- `latest-armv7`: ARMv7 32 bit arch.
- `latest-aarch64`: ARM 64 bit arch.
- `latest-amd64`: x86 64 bit arch.

Change the tag when you pull from the registry, e.g. `docker pull procsiab/texlive-it:latest-aarch64`
