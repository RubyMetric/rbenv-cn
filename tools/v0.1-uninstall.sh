#!/usr/bin/env bash

echo "=> This is the 0.1 version rbenv-cn uninstaller!"
echo

echo "=> 删除~/.rbenv"
rm -rf $HOME/.rbenv

echo "=> 删除相关环境变量"
sed -i '/rbenv config/d' "${HOME}/.bashrc"
sed -i '/.rbenv\/bin:/d' "${HOME}/.bashrc"
sed -i '/export RUBY_BUILD_MIRROR_URL=https/d' "${HOME}/.bashrc"
sed -i '/eval \"\$(rbenv init -)\"/d' "${HOME}/.bashrc"

sed -i '/rbenv config/d' "${HOME}/.zshrc"
sed -i '/.rbenv\/bin:/d' "${HOME}/.zshrc"
sed -i '/export RUBY_BUILD_MIRROR_URL=https/d' "${HOME}/.zshrc"
sed -i '/eval \"\$(rbenv init -)\"/d' "${HOME}/.zshrc"

echo "=> 删除rbenv-update"
sudo rm  /usr/local/bin/rbenv-update
echo "=> 删除rbenv-mirror"
sudo rm  /usr/local/bin/rbenv-mirror
echo "=> 卸载完成!"