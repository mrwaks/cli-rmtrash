#!/usr/bin/env bash

OS=`uname`

checkOS() {
    [ $OS = "Linux" ] && return 0 || echo -e "\1b[31mYou are trying to run a linux version update, please try again with the target version of your system\x1b[0m" && exit 1
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

createRmTrash() {
    `cd && mkdir .RMTRASH`
}

symlinkRmTrash() {
    if [ -e "/usr/local/bin" ]
    then
        PWD=`pwd`
        ln -s "$PWD/src/v_macos/rmTrash_vmacos.sh" "/usr/local/bin/rmtrash"
    fi
}

symlinkEmptyTrash() {
    if [ -e "/usr/local/bin" ]
    then
        PWD=`pwd`
        ln -s "$PWD/src/v_macos/emptyRmTrash_vmacos.sh" "/usr/local/bin/emptyrmtrash"
    fi
}

debuiltRmTrash() {
    removeRmTrash && unsymlinkRmTrash && unsymlinkEmptyRmTrash
}

builtRmTrash() {
    symlinkRmTrash && symlinkEmptyTrash && createRmTrash
}

checkOS && debuiltRmTrash && builtRmTrash && echo -e "\x1b[32mRmtrash successfully updated" && exit 0 || echo -e "\x1b[31mRmtrash updating encountered a problem, please try again\x1b[0m" && exit 1