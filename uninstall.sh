rm -rf $HOME/.rbenv

sed -i '/rbenv config/d' "${HOME}/.bashrc"
sed -i '/.rbenv\/bin:/d' "${HOME}/.bashrc"
sed -i '/export RUBY_BUILD_MIRROR_URL=https/d' "${HOME}/.bashrc"

sed -i '/rbenv config/d' "${HOME}/.zshrc"
sed -i '/.rbenv\/bin:/d' "${HOME}/.zshrc"
sed -i '/export RUBY_BUILD_MIRROR_URL=https/d' "${HOME}/.zshrc"

echo "=> 卸载完成!"