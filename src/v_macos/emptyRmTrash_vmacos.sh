#!/usr/bin/env bash

OS=`uname`

TRASH_CONTENT=`cd ~/.RMTRASH && ls -A`

shopt -s nocasematch;

# HELPER:

helper() {
    echo -e "\x1b[4mHelp:\x1b[0m\n\nCommands:\n\n  emtrash        To empty the rmtrash with confirmation\n\n  emtrash -y     To empty the rmtrash trash without confirmation"
}

# VERSION:

version() {
    echo "1.0.0"
}

# PROGRAMS STEPS:

checkOS() {
    [ $OS = "Darwin" ] && return 0 || echo "Os not compatible" && exit 1
}

checkContentTrash() {
    [ ${#TRASH_CONTENT} -eq 0 ] && echo "rmtrash empty" && exit 1
}

question() {
    while [ -z $ANSWER ]; do read -p "Are you sure to empty the rmtrash ? (Y/n) " ANSWER; if [[ "y" =~ $ANSWER ]]; then return 0; elif [[ "n" =~ $ANSWER ]]; then return 1; else return 2; fi; done
}

emptyTrash() {
    for ITEM in $TRASH_CONTENT; do cd ~/.RMTRASH && rm -r "$ITEM"; done
}

if [ "$1" = "-h" ] || [ "$1" = "--help" ]
then
    checkOS &&
    helper
elif [ "$1" = "-v" ] || [ "$1" = "--version" ]
then
    checkOS &&
    version
elif [ "$1" = "-y" ]
then
    checkOS &&
    checkContentTrash ||
    emptyTrash
elif [ $# -eq 0 ]
then
    checkOS &&
    checkContentTrash ||
    question
    case $? in
        0)
            emptyTrash && echo "rmtrash successfully emptied"
            ;;
        1)
            echo "Cancelation"
            ;;
        *)
            echo "Invalid answer"
            ;;
    esac
fi