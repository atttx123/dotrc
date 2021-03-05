#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
declare -a arr=("ackrc" "gitconfig" "gitignore_global" "zshrc")

for a in "${arr[@]}"
do
    ln -sf $IDR/$a ~/.$a
done
