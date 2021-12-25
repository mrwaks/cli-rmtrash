#!/usr/bin/env bash

OS=`uname`

TRASH_CONTENT=`cd ~/.RMTRASH && ls -A`

shopt -s nocasematch;

# HELPER:

helper() {
    echo -e "\x1b[4mHelp:\x1b[0m\n\nCommands:\n\nemptyrmtrash  To empty the rmtrash with confirmation\n\nemptyrmtrash -y  To empty the rmtrash trash without confirmation\n\nemptyrmtrash shred | -shred | --shred  To shred all items in rmtrash with confirmation\n\nemptyrmtrash shred -y | -shred -y | --shred -y  To shred all items in rmtrash without confirmation"
}

# VERSION:

version() {
    echo "1.0.0"
}

# QUESTIONS:

questionEmpty() {
    while [ -z $ANSWER ]; do read -p "Are you sure to empty the rmtrash ? (Y/n) " ANSWER; if [[ "y" =~ $ANSWER ]]; then return 0; elif [[ "n" =~ $ANSWER ]]; then return 1; else return 2; fi; done
}

questionShred() {
    while [ -e $ANSWER ]; do read -p "Are you sure you shred the rmtrash ? (Y/n) " ANSWER; if [[ "y" =~ $ANSWER ]]; then return 0; elif [[ "n" =~ $ANSWER ]]; then return 1; else return 2; fi; done
}

# PROGRAMS STEPS:

checkOS() {
    [ $OS = "Linux" ] && return 0 || echo "Os not compatible" && exit 1
}

checkContentTrash() {
    [ ${#TRASH_CONTENT} -eq 0 ] && echo "rmtrash empty" && exit 1
}

emptyTrash() {
    for ITEM in $TRASH_CONTENT; do cd ~/.RMTRASH && rm -rf "$ITEM"; done
}

shredIt() {
    find ~/.RMTRASH -type f -exec shred -n 12 -z -u {} +;
}

checkOS

if [ $? -eq 0 ]
then
    if [ "$1" = "-h" ] || [ "$1" = "--help" ] || [ "$1" = "-help" ]
    then
        helper
    elif [ "$1" = "-v" ] || [ "$1" = "--version" ]
    then
        version
    elif [ "$1" = "-y" ]
    then
        checkContentTrash ||
        emptyTrash && echo "rmtrash successfully emptied" && exit 0
    elif [ "$1" = "--shred" ] && [ "$2" = "-y" ] || [ "$1" = "-shred" ] && [ "$2" = "-y" ] || [ "$1" = "shred" ] && [ "$2" = "-y" ]
    then
        checkContentTrash ||
        shredIt && echo "rmtrash successfully shreded" && exit 0
    elif [ "$1" = "--shred" ] || [ "$1" = "-shred" ] || [ "$1" = "shred" ]
    then
        checkContentTrash ||
        questionShred
        case $? in
            0)
                shredIt && emptyTrash && echo "rmtrash successfully shreded" && exit 0
                ;;
            1)
                echo "Cancelation"
                ;;
            *)
                echo "Invalid answer"
        esac
    elif [ $# -eq 0 ]
    then
        checkContentTrash ||
        questionEmpty
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
    elif [ "$1" != "-h" ] || [ "$1" != "-help" ] || [ "$1" != "--help" ] || [ "$1" != "-v" ] || [ "$1" != "--version" ] || [ "$1" != "shred" ] || [ "$1" != "-shred" ] || [ "$1" != "--shred" ]
    then
        echo -e "emptyrmtrash: bad operand\nTry 'emptyrmtrash --help' for more information."
    fi
fi