#!/bin/bash

function shead {                                                                                                                               
    s3_path=${@:$#}
    params=${@:1:$# - 1}
    s3cmd get $s3_path - | zcat -f | head $params
}

function scat {
    s3_path=${@:$#}
    params=${@:1:$# - 1}
    s3cmd get $s3_path - | zcat -f | cat $params
}

function sless {
    s3_path=${@:$#}
    params=${@:1:$# - 1}
    s3cmd get $s3_path - | zcat -f | less $params
}

function ssize {
    aws s3 ls --summarize --human-readable --recursive "$1" | grep "Total Size:"
}

function sgettag {
    bucket=$(echo "$1" | cut -d '/' -f3)
    key=${1:${#bucket}+6}
    aws s3api get-object-tagging --bucket "$bucket" --key "$key"
}

alias sls='s3cmd ls --human-readable'
alias sget='s3cmd get'
alias sput='s3cmd put'
