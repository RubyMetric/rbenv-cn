#!/usr/bin/env bash
# ------------------------------------------------------
# File          : install.sh
# Authors       : ccmywish <ccmywish@qq.com>
# Created on    : <2020-12-10>
# Last modified : <2023-05-01>
#
# install:
#
#            rbenv-cn installer script
# ------------------------------------------------------

set -e

RBENV_CN_VERSION="0.3.3"

# Generated from https://ascii-generator.site/t/
# using  slant (more compact fixed)
# others we can use: larry3d, smslant, standard, starwars, stop, stforek
cat <<"RBENV-CN"
          __
   _____ / /_   ___   ____  _   __      _____ ____
  / ___// __ \ / _ \ / __ \| | / /____ / ___// __ \
 / /   / /_/ //  __// / / /| |/ //___// /__ / / / /
/_/   /_.___/ \___//_/ /_/ |___/      \___//_/ /_/

RBENV-CN

cat <<PLUGIN_INFO
Works as a rbenv plugin:

  Name:      rbenv-cn
  Version:   ${RBENV_CN_VERSION}
  Author:    ccmywish
  Bug track: https://gitee.com/RubyMetric/rbenv-cn/issues
  Thanks:    Ruby China, UpYun CDN and Gitee

PLUGIN_INFO


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

echo_colored "rbenv-cn> Pulling 'rbenv' from official Gitee 'mirrors_rbenv' ..."
git clone -q https://gitee.com/mirrors_rbenv/rbenv "$HOME/.rbenv"

echo_colored "rbenv-cn> Pulling 'ruby-build' from official Gitee 'mirrors' ..."
git clone -q https://gitee.com/mirrors/ruby-build.git "$HOME/.rbenv/plugins/ruby-build"

echo_colored "rbenv-cn> Pulling 'rbenv-cn' from 'RubyMetric' as a plugin ..."
git clone -q https://gitee.com/RubyMetric/rbenv-cn.git "$HOME/.rbenv/plugins/rbenv-cn"

echo_colored "rbenv-cn> 添加rbenv命令至环境变量(Bash,Zsh)"
echo -e "\n# rbenv config " >> ~/.bashrc
echo -e "\n# rbenv config " >> ~/.zshrc

# 必须要这样，否则下面的 rbenv init - 会首先找不到命令
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
#export PATH="$HOME/.rbenv/bin:$PATH"


# 改用RUBY_BUILD_MIRROR_PACKAGE_URL后，会与此起冲突，所以务必取消
# echo "=> 使用Ruby China镜像"
# echo "export RUBY_BUILD_MIRROR_URL=https://cache.ruby-china.com" >> ~/.bashrc
# echo "export RUBY_BUILD_MIRROR_URL=https://cache.ruby-china.com" >> ~/.zshrc


# 自动添加，而不是需要用户手动输入rbenv init
echo "eval \"\$(rbenv init -)\"" >> ~/.bashrc
echo "eval \"\$(rbenv init -)\"" >> ~/.zshrc
echo_colored "rbenv-cn> 安装完成!"


echo_colored "rbenv-cn> 请您重启终端或使用 \`export PATH=\"\$HOME/.rbenv/bin:\$PATH\"\` 立即在本终端生效"

echo_colored "rbenv-cn> 在安装Ruby前请确保您的系统已经安装了编译所需的所有依赖:"
echo_colored "=> https://github.com/rbenv/ruby-build/wiki#suggested-build-environment"
echo
