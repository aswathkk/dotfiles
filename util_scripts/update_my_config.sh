#!/bin/bash

function update_my_config() {
    cd $XDG_CONFIG_HOME
    git pull origin master
    cd -
    source $XDG_CONFIG_HOME/sourceme.sh
}
