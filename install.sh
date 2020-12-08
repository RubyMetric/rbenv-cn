#!/bin/bash
set -e

echo "=> Git clone rbenv"
git clone -q https://gitee.com/RubyKids/rbenv-official.git "$HOME/.rbenv"

echo "=> 尝试编译动态Bash扩展来加速rbenv. 若失败不要担心，rbenv仍然可以正常工作"
cd ~/.rbenv && src/configure > /dev/null && make -C src > /dev/null

echo "=> Git clone ruby-build"
git clone -q https://gitee.com/mirrors/ruby-build.git "$HOME/.rbenv/plugins/ruby-build"

echo "=> 添加rbenv命令至环境变量(Bash,Zsh)"
echo -e "\n# rbenv config " >> ~/.bashrc
echo -e "\n# rbenv config " >> ~/.zshrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
export PATH="$HOME/.rbenv/bin:$PATH"

echo "=> 使用Ruby China镜像"
echo "export RUBY_BUILD_MIRROR_URL=https://cache.ruby-china.com" >> ~/.bashrc
echo "export RUBY_BUILD_MIRROR_URL=https://cache.ruby-china.com" >> ~/.zshrc

echo "=> 安装完成!"
echo "=> 最后请您手动使用 rbenv init 按照提示初始化(即把~/.rbenv/shims加入环境变量)"
echo 