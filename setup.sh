#!/bin/bash

ln -sf ~/.shell/profile.sh ~/.profile
ln -sf ~/.shell/profile.sh ~/.bash_profile
ln -sf ~/.shell/bashrc.sh ~/.bashrc
ln -sf ~/.shell/inputrc ~/.inputrc
mkdir -p ~/.ssh
ln -sf ~/.shell/ssh_config ~/.ssh/config
