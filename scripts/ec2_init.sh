#!/bin/bash

yum update -y
yum install -y docker

docker container run -d --rm -p 127.0.0.1:3000:3000 smgestupa/blog-post-maker