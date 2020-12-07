#!/bin/bash
set -e

echo "=> 安装rbenv"
git clone https://gitee.com/RubyKids/rbenv-official.git "$HOME/.rbenv"

echo "=> 尝试编译动态Bash扩展来加速rbenv. 若失败不要担心，rbenv仍然可以正常工作"
cd ~/.rbenv && src/configure && make -C src

echo "=> 安装rbenv插件ruby-build"
git clone https://gitee.com/mirrors/ruby-build.git "$HOME/.rbenv/plugins/ruby-build"

echo "=> 添加环境变量"
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc

echo "=> 若您是Fish用户，请使用:"
echo 'set -Ux fish_user_paths $HOME/.rbenv/bin $fish_user_paths'


echo "=> 使用Ruby China镜像"
echo -e "\n# rbenv mirror " >> ~/.bashrc
echo "export RUBY_BUILD_MIRROR_URL=https://cache.ruby-china.com" >> ~/.bashrc

echo -e "\n# rbenv mirror " >> ~/.zshrc
echo "export RUBY_BUILD_MIRROR_URL=https://cache.ruby-china.com" >> ~/.zshrc

#TODO: PowerShell

#TODO: Fish


echo "=> 请您手动运行"
echo "~/.rbenv/bin/rbenv init"


echo "=> 安装完成!"
echo 