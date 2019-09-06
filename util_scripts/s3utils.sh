#!/bin/bash

function shead() {
    NUM_LINES=10
    while test $# -gt 0; do
        case $1 in 
            -h|--help)
                echo "s3head [-n NUM] <S3_FILE_PATH>"
                return
                ;;
            -n)
                shift
                if test $# -gt 0; then
                    export NUM_LINES=$1
                else
                    echo "Number of lines not specified"
                    return
                fi
                shift
                ;;
            *)
                break
                ;;
        esac
    done
    if [[ -z "$1" ]]; then
        echo "S3 file path is not specified"
        return
    fi
    s3cmd get "$1" - | zcat -f | head -n "$NUM_LINES"
}

function scat {
    s3cmd get "$1" - | zcat -f
}

function sless {
    s3cmd get "$1" - | zcat -f | less
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
