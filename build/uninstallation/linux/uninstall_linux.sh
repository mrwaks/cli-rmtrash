#!/usr/bin/env bash

OS=`uname`

checkOS() {
    [ $OS = "Darwin" ] && return 0 || echo -e "\1b[31mYou are trying to run a macos version uninstall, please try again with the target version of your system\x1b[0m" && exit 1
}

removeRmTrash() {
    `cd && rm -rf .RMTRASH`
}

unsymlinkRmTrash() {
    if [ -e "/usr/local/bin/rmtrash" ]
    then
        rm "/usr/local/bin/rmtrash"
    fi
}

unsymlinkEmptyRmTrash() {
    if [ -e "/usr/local/bin/emptyrmtrash" ]
    then
        rm "/usr/local/bin/emptyrmtrash"
    fi
}

debuiltRmTrash() {
    removeRmTrash && unsymlinkRmTrash && unsymlinkEmptyRmTrash
}

checkOS && debuiltRmTrash && echo -e "\x1b[32mRmtrash successfully uninstalled\x1b[0m" && exit 0 || echo -e "\x1b[31mRmtrash uninstallation encountered a problem, please try again\x1b[0m" && exit 1