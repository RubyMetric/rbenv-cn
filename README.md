<div align="center">

# rbenv-cn

在国内网络环境下的类`Unix`系统上编译，安装，管理多版本`Ruby`

无需使用任何外网环境（目前只支持`CRuby`, 而`mruby`,`JRuby`等不支持）

</div>

## 功能

支持`Bash`,`Zsh`，暂不支持`Fish`,`PowerShell`.

1. 作为`rbenv` (包含`ruby-build`) 的国内一键安装与卸载脚本，安装仅需4秒
2. `rbenv-cn`作为`rbenv`的一个标准插件，包含4个命令，功能为使用国内镜像
3. `rbenv-cn` 解决的是 `Ruby` 自身的国内下载问题，而 `rubygems` 包的国内下载问题，可阅读最下方手动进行换源，或通过 [RubyMetric/chsrc] 全平台通用多软件自动测速换源

> **如果您长时间使用本项目，请考虑捐赠 (本页最下方)**

<br>

## 镜像说明

1. `rbenv` 由Gitee官方管理，每天更新。查看[最新状态](https://gitee.com/mirrors_rbenv/rbenv)

2. `ruby-build` 由Gitee官方管理，每天更新，这是管理Ruby版本的真正仓库，所以不用担心更新不及时。查看[最新状态](https://gitee.com/mirrors/ruby-build)

3. `ruby-build` 构建CRuby的过程使用的是 [Ruby China 社区](https://ruby-china.org/) 提供的镜像 [https://cache.ruby-china.com/](https://cache.ruby-china.com/)

<br>

## 截图

- `rbenv-cn` 安装过程,如图所示仅需4秒。

![`rbenv-cn` 安装过程](./image/install.png)

<br>

- `rbenv cninstall <version>` 安装Ruby过程

![`rbenv cninstall` 安装Ruby过程](./image/cninstall.png)

<br>

## 安装

如果你已经安装`Ruby`，可以简单地直接通过`gem`命令来安装
```bash
# 安装此 gem
gem install rbenv-cn

# 安装
rbenv-cn install

# 卸载
rbenv-cn uninstall
```

若没有，则可以通过下面的安装脚本一键安装/卸载
```shell
# 安装
bash -c "$(curl -fsSL https://gitee.com/RubyMetric/rbenv-cn/raw/main/tool/install.sh)"

# 卸载
bash -c "$(curl -fsSL https://gitee.com/RubyMetric/rbenv-cn/raw/main/tool/uninstall.sh)"
```

<br>

如果发现异常，可以使用以下两种方式检查:
```bash
rbenv doctor
# 或
curl -fsSL https://gitee.com/RubyMetric/rbenv-cn/raw/main/bin/rbenv-doctor | bash
```

<br>

## 使用

`ruby-build` 并不检查编译环境，需要手动先安装好。请先查看下方的编译依赖。
[查看编译依赖](https://github.com/rbenv/ruby-build/wiki#suggested-build-environment)

```bash
# 在rbenv的基础上，可以调用三个子命令
# 1. `rbenv cninstall`
# 2. `rbenv update`
# 3. `rbenv sudo`

# 当有新Ruby版本出现时, 使用rbenv update来同时更新
# rbenv 以及 ruby-build, rbenv-cn 在内的所有插件
rbenv update

# 查看支持的Ruby版本
rbenv cninstall -l 或 -L

# 此命令自动从Ruby China提供的镜像上下载某指定版本的Ruby并接着运行编译等过程
# 该命令用来替换常见的 rbenv install 3.4.0-preview1
rbenv cninstall 3.4.0-preview1

# 设置全局使用 3.3.0 版本
rbenv global 3.3.0

# 生成 .ruby-version 文件，设置在本目录下使用 3.3.0 版本(会覆盖全局设置)
rbenv local 3.3.0

# sudo rails s -p 81 等需要更高权限的操作无法执行, 这是RVM和rbenv共同的问题
# 因此需要使用以下命令来替换 sudo 即:
rbenv sudo rails s -p 81

```

<br>

## Gem换源

推荐使用C语言编写的全平台通用多软件换源工具 [RubyMetric/chsrc]

![chsrc](https://gitee.com/RubyMetric/chsrc/raw/main/image/example.png)

`chsrc` 将测速挑选最快镜像站，并自动执行下述命令：

```bash
gem source -r https://rubygems.org/
gem source -a https://gems.ruby-china.com
bundle config 'mirror.https://rubygems.org' 'https://gems.ruby-china.com'
```

<br>

[RubyMetric]: https://gitee.com/RubyMetric
[RubyMetric/chsrc]: https://gitee.com/RubyMetric/chsrc
