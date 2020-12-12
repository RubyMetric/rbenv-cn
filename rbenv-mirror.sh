#!/usr/bin/env bash

# EXAMPLE
# https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.bz2
# https://cache.ruby-china.com/pub//ruby/2.6/ruby-2.6.0.tar.bz2


RUBY_BUILD_DIR=$HOME/.rbenv/plugins/ruby-build
DEFINITIONS_DIR=$RUBY_BUILD_DIR/share/ruby-build
DEFINITION="$DEFINITIONS_DIR/$1"

set_package_url() {
  local original_url
  local tarball_url
  local mirror_tarball_url

  original_url=$(awk '/cache.ruby-lang.org/ {print $3}' $1)

  tarball_url=${original_url%#*}

  mirror_tarball_url=${tarball_url/ruby-lang.org/ruby-china.com}
  mirror_tarball_url=${mirror_tarball_url:1}
  
  export RUBY_BUILD_MIRROR_PACKAGE_URL=$mirror_tarball_url
  
  echo "=> 已设置下载链接: $RUBY_BUILD_MIRROR_PACKAGE_URL"
} 



if [ -z $1 ]; then
  echo "=> 缺少Ruby版本参数!"
  echo "=> Usage:" 
  echo "   rbenv-mirror <version>"
  echo ""
  echo "=> Example:"
  echo "   rbenv-mirror  2.7.2"
else
  if [ -f $DEFINITION ]; then
    echo "=> 选中Ruby版本: $(basename $DEFINITION)"
    set_package_url $DEFINITION
    rbenv install $(basename $DEFINITION)
  else
    echo "=> 该版本Ruby不存在,请使用rbenv install -L 查看全部支持的版本"
    rbenv install -l
  fi
fi

