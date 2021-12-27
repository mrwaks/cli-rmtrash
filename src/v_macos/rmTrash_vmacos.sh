#!/usr/bin/env bash

ITEMS=$@
TRASH_CONTENT=`cd ~/.RMTRASH && ls -A`
OS=`uname`

RANDOM=$((1 + RANDOM % 50))

DAY=`date +%d`
MONTH=`date +%m`
YEAR=`date +%y`
DATE="$DAY-$MONTH-$YEAR"

HOUR=`date +%H`
MINUTE=`date +%M`
SECOND=`date +%S`
TIME="$HOUR:$MINUTE:$SECOND"

BIS="$DATE-$TIME-id$RANDOM"

# HELPER:

helper() {
    echo -e "\x1b[4mHelp:\x1b[0m\n\nCommands:\n\nrmtrash [...files/directory] - To place one or more items in the rmtrash bin\n\nrmtrash ls - To view the contents in the rmtrash bin"
}

# VERSION:

version() {
    echo "v1.1.1"
}

# PROGRAMS STEPS:

checkOS() {
    [ $OS = "Darwin" ] && return 0 || echo "Os not compatible" && exit 1
}

checkItemsExists() {
    for ITEM in $ITEMS; do [ -e $ITEM ] && ITEMS_TO_DELETE+="$ITEM " || echo "rmtrash: $ITEM: no such file or directory"; done
}

checkItemsExistInTrash() {
    for ITEM in $ITEMS_TO_DELETE; do [ -e ~/.RMTRASH/$ITEM ] && mv "$ITEM" "$ITEM-$BIS" && VALID_ITEMS+="$ITEM-$BIS " || VALID_ITEMS+="$ITEM "; done
}

rmTrash() {
    for ITEM in $VALID_ITEMS; do mv "$ITEM" ~/.RMTRASH; done
}

rmTrashList() {
    if [ ${#TRASH_CONTENT} -eq 0 ]; then echo "rmtrash empty"; else echo -e "\x1b[4mrmtrash content:\x1b[0m\n$TRASH_CONTENT"; fi
}

checkOS

if [ $? -eq 0 ]
then
    if [ $# -eq 0 ]
    then
        echo -e "rmtrash: missing operand\nTry 'rmtrash --help' for more information."
    elif [ "$1" = "ls" ]
    then
        rmTrashList
    elif [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$1" = "-help" ]
    then
        helper
    elif [ "$1" = "--version" ] || [ "$1" = "-v" ]
    then
        version
    else
        checkItemsExists
        checkItemsExistInTrash
        rmTrash
    fi
fi