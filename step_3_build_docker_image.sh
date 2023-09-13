#!/bin/bash
set -ex
docker build -t debug:latest .
docker run --rm -p 8080:80 -it debug:latest
