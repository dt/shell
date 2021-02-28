export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export TZ=UTC

export PATH=~/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/local/sbin:$PATH

for i in ~/.shell/lang.d/*; do
  source $i
done

for i in ~/.shell/tools.d/*; do
  source $i
done
