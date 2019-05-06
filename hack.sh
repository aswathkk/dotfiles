#!/bin/bash

# Life Saver script !!!!!!!!!!
# Its hard to install new version of my favourite tools in our server.
# I've to build from source to install it. Its time consuming.
# This script will save my life by installing my favourite tools in server !
# This will copy the installed binaries from other machine

KEY=""
SERVER=""
USER="centos"

if [ -z "$KEY" ] || [ -z "$SERVER"]; then
    echo "Fill the \$KEY and \$SERVER and re-run $0"
    exit 1
fi

scp -i $KEY $USER@$SERVER:/usr/local/bin/mosh /usr/local/bin/mosh
scp -i $KEY $USER@$SERVER:/usr/local/bin/mosh-client /usr/local/bin/mosh-client
scp -i $KEY $USER@$SERVER:/usr/local/bin/mosh-server /usr/local/bin/mosh-server
scp -i $KEY $USER@$SERVER:/usr/bin/tmux /usr/bin/tmux

scp -i $KEY $USER@$SERVER:/usr/lib64/libprotobuf.so.8.0.0 /usr/lib64/libprotobuf.so.8.0.0
ln -s /usr/lib64/libprotobuf.so.8.0.0 /usr/lib64/libprotobuf.so
ln -s /usr/lib64/libprotobuf.so.8.0.0 /usr/lib64/libprotobuf.so.8

