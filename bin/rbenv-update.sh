#!/usr/bin/env bash
# ------------------------------------------------------
# File          : rbenv-update.sh
# Authors       : ccmywish <ccmywish@qq.com>
#                 Konstantin Haase <github@rkh.im>
# Created on    : <2020-12-09>
# Last modified : <2022-03-20>
#
# rbenv-update:
#
#   Update 3 parts:
#     1. rbenv from RubyKis mirror 
#     2. ruby-build from official Gitee mirror
#     3. rbenv-cn plugins
# ------------------------------------------------------

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


is_git_repo() {
  command git remote -v 2>/dev/null 
}

plugin_update() {
  if is_git_repo; then
    print_colored "rbenv-cn> 更新 $1 ..."
    git pull --no-rebase --ff
  else
    print_colored "rbenv-cn> 跳过 $1; 不是一个Git仓库"
  fi
}

echo_colored "rbenv-cn> 从gitee.com/RubyKids镜像更新rbenv"
git -C $RBENV_ROOT pull 

echo_colored "rbenv-cn> 从Gitee mirror官方镜像更新ruby-build"
git -C "$RBENV_ROOT"/plugins/ruby-build pull 
echo

# If no match, just remove the word, rather than see it as a file called *
shopt -s nullglob
for plugin in "$RBENV_ROOT"/plugins/*; do
  pushd "$plugin" >/dev/null
  plugin_update "$(basename "$plugin")"
  popd >/dev/null
done
shopt -u nullglob

echo_colored "rbenv-cn> 1.rbenv 2.ruby-build 3.rbenv-cn 4.其他插件 全部更新完成!"
