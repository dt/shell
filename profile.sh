export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# Check for updates to the shell scripts
if [[ -d ~/.shell/.git ]]; then
  (cd ~/.shell && git pull 2> /dev/null > /dev/null &)
fi

source ~/.bashrc
