---
title: "Docker使用指南"
description: "Images"
pubDate: "2026-01-18"
---

# Docker使用指南

**Images** 

**Containers** 

**Save images**

Usage: docker save [OPTIONS] IMAGE [IMAGE...]



Save one or more images to a tar archive (streamed to STDOUT by default)



Aliases:

 docker image save, docker save

———

Options:

 -o, --output string  Write to a file, instead of STDOUT

———

**Load images**



Usage: docker load [OPTIONS]



Load an image from a tar archive or STDIN



Aliases:

 docker image load, docker load



Options:

 -i, --input string  Read from tar archive file, instead of STDIN

 -q, --quiet      Suppress the load output

**Docker exec**

Usage: docker exec [OPTIONS] CONTAINER COMMAND [ARG...]



Execute a command in a running container

Aliases:

 docker container exec, docker exec

Options:

 -d, --detach        Detached mode: run command in the background

​    --detach-keys string  Override the key sequence for detaching a

​               container

 -e, --env list       Set environment variables

​    --env-file list     Read in a file of environment variables

 -i, --interactive      Keep STDIN open even if not attached

​    --privileged      Give extended privileges to the command

 -t, --tty          Allocate a pseudo-TTY

 -u, --user string      Username or UID (format:

​               "<name|uid>[:<group|gid>]")

 -w, --workdir string    Working directory inside the container