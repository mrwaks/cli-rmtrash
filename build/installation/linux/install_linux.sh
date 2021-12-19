#!/usr/bin/env bash

# If you have an installation problem, refer to the built_rescue directory

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
    symlinkRmTrash && symlinkEmptyTrash && createRmTrash && echo -e "\033[32mRmtrash successfully installed\033[0m"
}

builtRmTrash