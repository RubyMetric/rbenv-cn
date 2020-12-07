#!/bin/bash
set -e

homebrew=
type -p brew >/dev/null && homebrew=1

try_bash_extension() {
  if [ -x src/configure ]; then
    src/configure && make -C src || {
      echo "Optional bash extension failed to build, but things will still work normally."
    }
  fi
}

if ! type -p git >/dev/null; then
  git() {
    echo "Error: git is required to proceed. Please install git and try again." >&2
    exit 1
  }
fi

http() {
  local url="$1"
  if type -p curl >/dev/null; then
    curl -fsSL "$url"
  elif type -p wget >/dev/null; then
    wget -q "$url" -O-
  else
    echo "Error: couldn't download file. No \`curl' or \`wget' found." >&2
    return 1
  fi
}

rbenv="$(command -v rbenv ~/.rbenv/bin/rbenv | head -1)"

if [ -n "$rbenv" ]; then
  echo "rbenv already seems installed in \`$rbenv'."
  cd "${rbenv%/*}"

  if [ -x ./brew ]; then
    echo "Trying to update with Homebrew..."
    brew update >/dev/null
    if [ "$(./rbenv --version)" < "1.0.0" ] && brew list rbenv | grep -q rbenv/HEAD; then
      brew uninstall rbenv
      brew install rbenv --without-ruby-build
    else
      brew upgrade rbenv
    fi
  elif git remote -v 2>/dev/null | grep -q rbenv; then
    echo "Trying to update with git..."
    git pull --tags origin master
    cd ..
    try_bash_extension
  fi
else
  if [ -n "$homebrew" ]; then
    echo "Installing rbenv with Homebrew..."
    brew update
    brew install rbenv --without-ruby-build
    rbenv="$(brew --prefix)/bin/rbenv"
  else
    echo "Installing rbenv with git..."
    mkdir -p ~/.rbenv
    cd ~/.rbenv
    git init
    git remote add -f -t master origin https://gitee.com/RubyKids/rbenv-official.git
    git checkout -b master origin/master
    try_bash_extension
    rbenv=~/.rbenv/bin/rbenv

    if [ ! -e versions ] && [ -w /opt/rubies ]; then
      ln -s /opt/rubies versions
    fi
  fi
fi

rbenv_root="$("$rbenv" root)"
ruby_build="$(command -v "$rbenv_root"/plugins/*/bin/rbenv-install rbenv-install | head -1)"

echo
if [ -n "$ruby_build" ]; then
  echo "\`rbenv install' command already available in \`$ruby_build'."
  cd "${ruby_build%/*}"

  if [ -x ./brew ]; then
    echo "Trying to update with Homebrew..."
    brew update >/dev/null
    brew upgrade ruby-build
  elif git remote -v 2>/dev/null | grep -q ruby-build; then
    echo "Trying to update with git..."
    git pull origin master
  fi
else
  if [ -n "$homebrew" ]; then
    echo "Installing ruby-build with Homebrew..."
    brew update
    brew install ruby-build
  else
    echo "Installing ruby-build with git..."
    mkdir -p "${rbenv_root}/plugins"
    git clone https://gitee.com/mirrors/ruby-build "${rbenv_root}/plugins/ruby-build"
  fi
fi

# Enable caching of rbenv-install downloads
mkdir -p "${rbenv_root}/cache"

echo
echo "正在验证是否正确安装..."
http https://gitee.com/RubyKids/rbenv-cn/raw/master/doctor.sh | "$BASH"

echo
echo "安装完成!"

i=0
if [ -x ~/.rbenv/bin ]; then
  echo "$((++i)). 请确保 \`~/.rbenv/bin' 被添加至环境变量"
fi
echo "$((++i)). 运行 \`rbenv init' 来查看如何为你的Shell配置环境变量"


echo -e "\n# rbenv mirror " >> ~/.bashrc
echo "export RUBY_BUILD_MIRROR_URL=https://cache.ruby-china.com" >> ~/.bashrc

echo -e "\n# rbenv mirror " >> ~/.zshrc
echo "export RUBY_BUILD_MIRROR_URL=https://cache.ruby-china.com" >> ~/.zshrc

#TODO: PowerShell

#TODO: Fish