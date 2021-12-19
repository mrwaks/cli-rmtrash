#!/usr/bin/env bash

# If you have an installation problem, refer to the debuilt_rescue directory

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
    removeRmTrash && unsymlinkRmTrash && unsymlinkEmptyRmTrash && echo -e "\033[32mRmtrash successfully uninstalled\033[0m"
}

debuiltRmTrash