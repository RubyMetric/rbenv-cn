#!/usr/bin/env bash
# ------------------------------------------------------
# File          : rbenv-cninstall.sh
# Authors       : ccmywish <ccmywish@qq.com>
# Created on    : <2020-12-07>
# Last modified : <2022-03-20>
#
# rbenv-cninstall:
#
#   rbenv cninstall x.x.x
#  
#   Install a Ruby version via Ruby China cache
# ------------------------------------------------------

#
# Link example:
#
#   https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.bz2
#   https://cache.ruby-china.com/pub//ruby/2.6/ruby-2.6.0.tar.bz2
#

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
  
  echo "rbenv-cn> 设置下载链接: $RUBY_BUILD_MIRROR_PACKAGE_URL"
} 



if [ -z $1 ]; then
  echo "=> 缺少Ruby版本作为参数!"
  echo "=> Usage:" 
  echo "   rbenv cninstall <version>"
  echo ""
  echo "=> Example:"
  echo "   rbenv cninstall 3.1.1"
else
  if [ -f $DEFINITION ]; then
    echo "rbenv-cn> 选中Ruby版本: $(basename $DEFINITION)"
    set_package_url $DEFINITION
    rbenv install $(basename $DEFINITION)
  else
    echo "rbenv-cn> 该版本Ruby不存在,请使用rbenv install -L 查看全部支持的版本"
    rbenv install -l
  fi
fi

