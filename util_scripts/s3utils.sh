#!/bin/bash

function s3head() {
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

function s3cat {
    s3cmd get "$1" - | zcat -f
}

function s3less {
    s3cmd get "$1" - | zcat -f | less
}

function s3size {
    aws s3 ls --summarize --human-readable "$1" | grep "Total Size:"
}

alias s3ls='s3cmd ls --human-readable'
alias s3get='s3cmd get'
alias s3put='s3cmd put'
