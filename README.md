## 介绍

详情参考 [Ruby China的帖子](https://ruby-china.org/topics/40693)

`rbenv` (包含 `ruby-build`)国内安装脚本,保证不需要任何外网,依然可以使用最新版本的Ruby. 已在本地和国内服务器上测试。支持Bash, Zsh 暂不支持Fish, PowerShell.

镜像提示：

1. rbenv最低两周一次手动更新，此是否更新几乎不影响使用
2. ruby-build已由Gitee官方管理(查看[最新状态](https://gitee.com/mirrors/ruby-build)),每天更新,这是管理Ruby版本的真正仓库,所以不用担心更新不及时

`ruby-build` 并不检查编译环境，需要手动先安装好。请先查看下方的编译依赖。
[编译依赖](https://github.com/rbenv/ruby-build/wiki#suggested-build-environment)

## 使用方法

```bash
# 除了rbenv, 额外可以调用三个命令 
# 1. `rbenv cninstall` 
# 2. `rbenv update`
# 3. `rbenv sudo`

# 当有新Ruby版本出现时,使用rbenv update来同时更新 rbenv 和 ruby-build 插件
rbenv update

# 查看支持的Ruby版本
rbenv install -l 或 -L 

# 此命令自动从Ruby China提供的镜像上下载某指定版本的Ruby并接着运行编译等过程
# 该命令用来替换常见的 rbenv install 3.0.0-preview2
rbenv cninstall 3.0.0-preview2

# 设置全局使用 3.1.0 版本
rbenv global 3.1.0

# 生成 .ruby-version 文件，设置在本目录下使用 3.1.0 版本(会覆盖全局设置)
rbenv local 3.1.0

# sudo rails s -p 81 等需要更高权限的操作无法执行, 这本是RVM和rbenv共同的问题
# 后来rbenv默认添加了以下子命令，来替换 sudo 即:
rbenv sudo rails s -p 81

```

<br>

使用前后对比如图:
![screenshot](./screenshot.png)

## 一键安装
```shell
bash -c "$(curl -fsSL https://gitee.com/RubyKids/rbenv-cn/raw/main/install.sh)"
```

## 一键卸载
```shell
bash -c "$(curl -fsSL https://gitee.com/RubyKids/rbenv-cn/raw/main/uninstall.sh)"
```

## Gem换源
```bash
gem source -r https://rubygems.org/ 
gem source -a https://gems.ruby-china.com 

# Bundler change source
bundle config 'mirror.https://rubygems.org' 'https://gems.ruby-china.com' 
```

<br>
