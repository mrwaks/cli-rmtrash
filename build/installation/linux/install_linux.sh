#!/usr/bin/env bash

OS=`uname`

checkOS() {
    [ $OS = "Linux" ] && return 0 || echo -e "\1b[31mYou are trying to run a macos version install, please try again with the target version of your system\x1b[0m" && exit 1
}

createRmTrash() {
    `cd && mkdir .RMTRASH`
}

symlinkRmTrash() {
    if [ -e "/usr/local/bin" ]
    then
        PWD=`pwd`
        ln -s "$PWD/src/v_linux/rmTrash_vlinux.sh" "/usr/local/bin/rmtrash"
    fi
}

symlinkEmptyTrash() {
    if [ -e "/usr/local/bin" ]
    then
        PWD=`pwd`
        ln -s "$PWD/src/v_linux/emptyRmTrash_vlinux.sh" "/usr/local/bin/emptyrmtrash"
    fi
}

builtRmTrash() {
    symlinkRmTrash && symlinkEmptyTrash && createRmTrash
}

checkOS && builtRmTrash && echo -e "\x1b[32mRmtrash successfully installed\x1b[0m" && exit 0 || echo -e "\x1b[31mRmtrash installation encountered a problem, please try again\x1b[0m" && exit 1