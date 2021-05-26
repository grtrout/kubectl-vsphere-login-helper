#!/usr/bin/env bash
# install.sh (for vsphere login helper)
# Author: Greg Trout | grtrout@gmail.com

KVL_DIR="$HOME/kvl"
mkdir -p $KVL_DIR
cp kvl-shell-automation.sh $KVL_DIR
cp vsphere-login.sh $KVL_DIR 

printf "\n# Kubectl vSphere Login\n. $KVL_DIR/kvl-shell-automation.sh\n" >> "$HOME/.bashrc"
printf 'export PATH=$PATH:' >> "$HOME/.bashrc"
printf "$KVL_DIR\n\n" >> "$HOME/.bashrc"
