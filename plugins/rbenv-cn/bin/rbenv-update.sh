#!/usr/bin/env bash
# ------------------------------------------------------
# File          : rbenv-update.sh
# Authors       : ccmywish <ccmywish@qq.com>
# Created on    : <2020-12-09>
# Last modified : <2022-03-20>
#
# rbenv-update:
#
#   Update 3 parts:
#     1. rbenv from RubyKis mirror 
#     2. ruby-build from official Gitee mirror
#     3. rbenv-cn plugins
# ------------------------------------------------------

echo "rbenv-cn> Upgrade rbenv from RubyKids mirror"
echo ""

git -C "$(rbenv root)" pull 

echo ""

echo "rbenv-cn> Upgrade ruby-build from official Gitee mirror"
echo ""
git -C "$(rbenv root)"/plugins/ruby-build pull 

echo ""
echo "rbenv-cn> 更新rbenv与ruby-build完成!"
