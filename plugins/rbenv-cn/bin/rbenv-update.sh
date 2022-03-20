#!/usr/bin/env bash

echo "rbenv-cn> Upgrade rbenv from RubyKids mirror"
echo ""

git -C "$(rbenv root)" pull 

echo ""

echo "rbenv-cn> Upgrade ruby-build from official Gitee mirror"
echo ""
git -C "$(rbenv root)"/plugins/ruby-build pull 

echo ""
echo "rbenv-cn> 更新rbenv与ruby-build完成!"
