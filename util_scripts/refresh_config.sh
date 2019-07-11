#!/bin/bash

function refresh_config {
    cd $XDG_CONFIG_HOME
    git pull origin master
    source sourceme.sh
    cd -
}
