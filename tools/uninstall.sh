#!/usr/bin/env bash
# ------------------------------------------------------
# File          : uninstall.sh
# Authors       : ccmywish <ccmywish@qq.com>
# Created on    : <2020-12-10>
# Last modified : <2022-03-20>
#
# uninstall:
#
#   rbenv-cn uninstaller script
#
# ------------------------------------------------------

set -e

cat <<"RBENV-CN"
          __                                             
   _____ / /_   ___   ____  _   __      _____ ____ 
  / ___// __ \ / _ \ / __ \| | / /____ / ___// __ \
 / /   / /_/ //  __// / / /| |/ //___// /__ / / / /
/_/   /_.___/ \___//_/ /_/ |___/      \___//_/ /_/ 
                                                           
RBENV-CN

# Set colored output for TTY
if [ -t 1 ]; then
  color="\e[1;32m"
  reset="\e[0m"
else
  color=""
  reset=""
fi

echo_colored() {
  printf "${color}%s${reset}\n" "$1"
}



echo_colored "rbenv-cn> 删除~/.rbenv"
rm -rf $HOME/.rbenv

echo_colored "rbenv-cn> 删除相关环境变量"
sed -i '/rbenv config/d' "${HOME}/.bashrc"
sed -i '/.rbenv\/bin:/d' "${HOME}/.bashrc"
#sed -i '/export RUBY_BUILD_MIRROR_URL=https/d' "${HOME}/.bashrc"
sed -i '/eval \"\$(rbenv init -)\"/d' "${HOME}/.bashrc"

sed -i '/rbenv config/d' "${HOME}/.zshrc"
sed -i '/.rbenv\/bin:/d' "${HOME}/.zshrc"
#sed -i '/export RUBY_BUILD_MIRROR_URL=https/d' "${HOME}/.zshrc"
sed -i '/eval \"\$(rbenv init -)\"/d' "${HOME}/.zshrc"

echo_colored "rbenv-cn> 卸载完成!"
