#!/usr/bin/env bash
# ------------------------------------------------------
# File          : install.sh
# Authors       : ccmywish <ccmywish@qq.com>
# Created on    : <2020-12-10>
# Last modified : <2022-03-20>
#
# install:
#
#   rbenv-cn installer script
#
# ------------------------------------------------------

set -e

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

# Generated from https://ascii-generator.site/t/ 
# using  slant (more compact fixed) 
# others we can use: larry3d, smslant, standard, starwars, stop, stforek
cat <<"RBENV-CN"
          __                                             
   _____ / /_   ___   ____  _   __        _____ ____ 
  / ___// __ \ / _ \ / __ \| | / /______ / ___// __ \
 / /   / /_/ //  __// / / /| |/ //_____// /__ / / / /
/_/   /_.___/ \___//_/ /_/ |___/        \___//_/ /_/ 
                                                           

RBENV-CN



echo_colored "rbenv-cn> 从gitee.com/RubyKids镜像拉取rbenv"
git clone -q https://gitee.com/RubyKids/rbenv-official.git "$HOME/.rbenv"

echo_colored "rbenv-cn> 尝试编译动态Bash扩展来加速rbenv. 若失败不要担心，rbenv仍然可以正常工作"
cd ~/.rbenv && src/configure > /dev/null && make -C src > /dev/null

echo_colored "rbenv-cn> 从Gitee mirror官方镜像拉取ruby-build"
git clone -q https://gitee.com/mirrors/ruby-build.git "$HOME/.rbenv/plugins/ruby-build"

echo_colored "rbenv-cn> 添加rbenv命令至环境变量(Bash,Zsh)"
echo -e "\n# rbenv config " >> ~/.bashrc
echo -e "\n# rbenv config " >> ~/.zshrc
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
echo 