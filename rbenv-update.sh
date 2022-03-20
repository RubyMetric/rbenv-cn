#!/usr/bin/env bash

echo "=> Upgrade rbenv from RubyKids mirror"
git -C "$(rbenv root)" pull 

echo ""

echo "=> Upgrade ruby-build from official Gitee mirror"
git -C "$(rbenv root)"/plugins/ruby-build pull 

echo "rbenv-cn> 更新rbenv与ruby-build完成!"
