# TexLive for ARMv7 (32bit) with Italian language

![Docker Pulls](https://img.shields.io/docker/pulls/procsiab/texlive-rpi-it.svg)
![Docker Stars](https://img.shields.io/docker/stars/procsiab/texlive-rpi-it.svg)
![GitHub last commit (branch)](https://img.shields.io/github/last-commit/Procsiab/texlive-rpi-it/master.svg)

This image was built to use with CI/CD LaTeX testing and deploying pipeline, on a RaspberryPi; the image itself is based on a "slim" version of Debian, and it uses `bash`.
Moreover, the mountpoint for the compiler's wordspace is under the `/workspace` folder (you should mount there the volume containing your sources)

Docker Hub reporitory:
https://hub.docker.com/r/procsiab/texlive-rpi-it
