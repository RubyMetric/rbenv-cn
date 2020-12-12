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
#export PATH="$HOME/.rbenv/bin:$PATH"


echo "=> 使用Ruby China镜像"
echo "export RUBY_BUILD_MIRROR_URL=https://cache.ruby-china.com" >> ~/.bashrc
echo "export RUBY_BUILD_MIRROR_URL=https://cache.ruby-china.com" >> ~/.zshrc

echo "=> 安装rbenv-update,升级更新请使用该命令"
curl -fsSL https://gitee.com/RubyKids/rbenv-cn/raw/master/rbenv-update.sh -o rbenv-update.sh
chmod +x ./rbenv-update.sh
sudo mv ./rbenv-update.sh /usr/local/bin/rbenv-update


# 自动添加，而不是需要用户手动输入rbenv init
echo "eval \"\$(rbenv init -)\"" >> ~/.bashrc
echo "eval \"\$(rbenv init -)\"" >> ~/.zshrc
echo "=> 安装完成!"


echo "=> 请您重启终端或使用 \`export PATH=\"\$HOME/.rbenv/bin:\$PATH\"\` 立即在本终端生效"
echo 