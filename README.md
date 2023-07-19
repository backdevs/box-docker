<div align="center">

# Still [`box-project/box`](https://github.com/box-project/box), but dockerized! :whale:

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/backdevs/box-docker/docker-image.yml?label=Docker%20CI)
![Latest Docker version tag](https://img.shields.io/docker/v/backdevs/box?label=latest&sort=semver)
 
</div>

## Prerequisites
* [Docker](https://docs.docker.com/get-docker/) `^20.10`

## Basic Usage

```shell
docker run -it --rm -v $(pwd):/app backdevs/box:latest compile
```
This will mount the current working directory to the `/app` directory inside the container and run `box compile` inside that directory.

For more advanced configuration options, please refer to the official [`box` configuration](https://github.com/box-project/box/blob/main/doc/configuration.md#configuration) documentation.

## Build

```bash
docker build \
  --build-arg BOX_VERSION=4.3.8 \
  --build-arg COMPOSER_VERSION=2.5.5 \
  --tag backdevs/box:4.3.8 \
  --tag backdevs/box:latest \
  .
```
