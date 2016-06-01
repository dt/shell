#!/bin/bash
ln -sf ~/.shell/profile.sh ~/.profile
ln -sf ~/.shell/profile.sh ~/.bash_profile
ln -sf ~/.shell/bashrc.sh ~/.bashrc
ln -sf ~/.shell/inputrc ~/.inputrc

ln -sf ~/.shell/confs/gitconfig ~/.gitconfig
ln -sf ~/.shell/confs/gitignore_global ~/.gitignore_global

mkdir -p ~/.ssh
ln -sf ~/.shell/confs/ssh_config ~/.ssh/config

ln -sf ~/.shell/confs/slate ~/.slate

