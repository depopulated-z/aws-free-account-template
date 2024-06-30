#!/bin/sh

set -uo errexit

export SERVER_NAME="aws_server"

mkdir -p .ssh

echo "... creating ${SERVER_NAME} key pair without password"
ssh-keygen -t rsa -b 4096 -C "spacetravelidle.maintainer@gmail.com" -f "./.ssh/${SERVER_NAME}" -q -N ""


