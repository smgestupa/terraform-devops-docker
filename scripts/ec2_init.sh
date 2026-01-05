#!/bin/bash

yum update -y
yum install -y docker

# The EC2 instance will be using t4g.nano, with an arm64 architecture;
# It is best to have a container that can be ran on arm64 or simply build
# an existing one with `docker build --platform linux/arm64 <username>/<image>:arm64`
docker container run -d --rm -p 80:3000 smgestupa/blog-post-maker:arm64 npm run dev -- --host