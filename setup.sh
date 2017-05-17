#!/bin/bash
ln -sf ~/.shell/profile.sh ~/.profile
ln -sf ~/.shell/profile.sh ~/.bash_profile
ln -sf ~/.shell/bashrc.sh ~/.bashrc
ln -sf ~/.shell/inputrc ~/.inputrc

ln -sf ~/.shell/confs/git/gitconfig ~/.gitconfig
ln -sf ~/.shell/confs/git/gitignore_global ~/.gitignore_global

mkdir -p ~/.ssh
ln -sf ~/.shell/confs/ssh/ssh_config ~/.ssh/config
if [[ "$OSTYPE" == "darwin"* ]]; then
	ln -sf ~/.shell/confs/ssh/ssh_config_osx ~/.ssh/os_config
else
	ln -sf ~/.shell/confs/ssh/ssh_config_linux ~/.ssh/os_config
fi

mkdir -p ~/.gnupg/
ln -sf ~/.shell/confs/gpg/gpg.conf ~/.gnupg/gpg.conf
ln -sf ~/.shell/confs/gpg/gpg-agent.conf ~/.gnupg/gpg-agent.conf

ln -sf ~/.shell/confs/slate ~/.slate

mkdir -p ~/Library/Application\ Support/Code/User
ln -sf ~/.shell/confs/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -sf ~/.shell/confs/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json


