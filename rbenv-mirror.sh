#!/usr/bin/env bash

# EXAMPLE
# https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.bz2
# https://cache.ruby-china.com/pub//ruby/2.6/ruby-2.6.0.tar.bz2


RUBY_BUILD_DIR=$HOME/.rbenv/plugins/ruby-build
DEFINITIONS_DIR=$RUBY_BUILD_DIR/share/ruby-build
DEFINITION="$DEFINITIONS_DIR/$1"

set_package_url() {
  ORIGINAL_URL=$(awk '/cache.ruby-lang.org/ {print $3}' $DEFINITION)
  TARBALL_URL=${ORIGINAL_URL%#*}
  MIRROR_TARBALL_URL=${TARBALL_URL/ruby-lang.org/ruby-china.com}
  MIRROR_TARBALL_URL=${MIRROR_TARBALL_URL:1}
  export RUBY_BUILD_MIRROR_PACKAGE_URL=$MIRROR_TARBALL_URL
  echo "=> 已设置下载链接: $MIRROR_TARBALL_URL"
} 

set_package_url_nil () {
  export RUBY_BUILD_MIRROR_PACKAGE_URL=
}


if [ -z $1 ]; then
  echo "=> 已设置为默认不使用镜像"
else
  if [ -f $DEFINITION ]; then
    echo "=> 选中Ruby版本: $(basename $DEFINITION)"
    set_package_url
  else
    echo "=> 该版本Ruby不存在，默认不使用镜像"
    set_package_url_nil
  fi
fi

