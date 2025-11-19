# Docker image of httping

[![GitHub Super-Linter](https://github.com/bretfisher/httping-docker/workflows/Lint%20Code%20Base/badge.svg)](https://github.com/marketplace/actions/super-linter)
![Build and Push Image](https://github.com/bretfisher/httping-docker/actions/workflows/call-docker-build.yaml/badge.svg?branch=main)

This container image is stored on docker hub: [bretfisher/httping](https://hub.docker.com/r/bretfisher/httping/) and in this GitHub repositories packages.

NOTE: This is based on the original httping project,
which has since been removed from GitHub.
I maintain a copy of the 2.5 version in the `source` directory.

## Basic example at docker CLI

run a HTTPS ping against google every second until you hit ctrl-c or stop/kill the container

```bash
docker run --rm gcr.io/the-helper-bees/httping https://www.google.com
```

## Better example

ping ever 100ms, use GET not HEAD, show status codes, use pretty colors

```bash
docker run --rm gcr.io/the-helper-bees/httping -i .1 -G -s -Y https://www.google.com
```

## THB: Ping a Django backend on a GCP VM
```bash
docker run --network core-infra -it --rm gcr.io/the-helper-bees/httping -i .1 -GsY \
    --no-host-header \
    --header "Host: localhost" \
    dha_sandbox_django:5000/ping
```

## License

This repository and Dockerfile are MIT licensed.
All upstream software including httping are licensed by their owners.
