#!/bin/bash

echo "Setting up bash scripts"
ln -sf ~/.shell/profile.sh ~/.profile
ln -sf ~/.shell/profile.sh ~/.bash_profile
ln -sf ~/.shell/bashrc.sh ~/.bashrc
ln -sf ~/.shell/inputrc ~/.inputrc

echo "Setting up git configs scripts"
ln -sf ~/.shell/confs/gitconfig ~/.gitconfig
ln -sf ~/.shell/confs/gitignore_global ~/.gitignore_global

echo "Setting up ssh config"
mkdir -p ~/.ssh
ln -sf ~/.shell/confs/ssh_config ~/.ssh/config

echo "Setting up Slate"
ln -sf ~/.shell/confs/slate ~/.slate

