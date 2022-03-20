# rbenv-cn

`rbenv-cn` 帮助您在任何类Unix系统上编译，安装任何版本的Ruby(包括CRuby, mruby, JRuby等). 它是作为`rbenv`的一个插件来工作的，它同时也是`rbenv`(包含`ruby-build`)的国内一键安装/卸载脚本，保证不需要任何外网，依然可以使用最新版本的Ruby. `rbenv-cn`安装仅需4秒。

详情参考 
- [v0.1 rbenv-cn from Ruby China](https://ruby-china.org/topics/40693)
- [v0.2 rbenv-cn from Ruby China](https://ruby-china.org/topics/40693)

<br>

## 功能

支持Bash, Zsh暂不支持Fish, PowerShell. 若您有新的想法，或发现了存在的问题，或可改善的地方(比如对新Shell的支持，其他插件的补充)，甚至，若您想要参与开发与日常维护，请您在[issues](https://gitee.com/RubyKids/rbenv-cn/issues) 处反馈，并请阅读[CONTRIBUTING.md](./CONTRIBUTING.md)

**镜像说明:**

1. rbenv最低两周一次手动更新，此是否更新几乎不影响使用
2. ruby-build已由Gitee官方管理(查看[最新状态](https://gitee.com/mirrors/ruby-build)),每天更新,这是管理Ruby版本的真正仓库,所以不用担心更新不及时

<br>

## 截图

- `rbenv-cn` 安装过程,如图所示仅需4秒。

![`rbenv-cn` 安装过程](./images/install.png)

<br>

- `rbenv cninstall <version>` 安装Ruby过程

![`rbenv cninstall` 安装Ruby过程](./images/cninstall.png)

<br>

### 测试状态

- [Linux各发行版测试](https://gitee.com/RubyKids/rbenv-cn/issues/I4YNS9)
- [macOS测试](https://gitee.com/RubyKids/rbenv-cn/issues/I4YNSI)
- [WSL测试](https://gitee.com/RubyKids/rbenv-cn/issues/I4YNS1)
- [国内服务器测试](https://gitee.com/RubyKids/rbenv-cn/issues/I4YNSO)

需要您帮助测试反馈情况，若您长时间使用`rbenv-cn`，请考虑成为维护者，谢谢。

<br>

## 使用

`ruby-build` 并不检查编译环境，需要手动先安装好。请先查看下方的编译依赖。
[编译依赖](https://github.com/rbenv/ruby-build/wiki#suggested-build-environment)

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
# 该命令用来替换常见的 rbenv install 3.0.0-preview2
rbenv cninstall 3.0.0-preview2

# 设置全局使用 3.1.0 版本
rbenv global 3.1.0

# 生成 .ruby-version 文件，设置在本目录下使用 3.1.0 版本(会覆盖全局设置)
rbenv local 3.1.0

# sudo rails s -p 81 等需要更高权限的操作无法执行, 这是RVM和rbenv共同的问题
# 因此需要使用以下命令来替换 sudo 即:
rbenv sudo rails s -p 81

```

<br>

## 安装

一键安装
```shell
bash -c "$(curl -fsSL https://gitee.com/RubyKids/rbenv-cn/raw/main/tools/install.sh)"
```

一键卸载
```shell
bash -c "$(curl -fsSL https://gitee.com/RubyKids/rbenv-cn/raw/main/tools/uninstall.sh)"
```

<br>

若您已经开始使用`rbenv-cn v0.1` (2022/3/20以前)，则需要先卸载之前的版本(使用下面的脚本)，事实上继续沿用`v0.1`依旧可以正常工作。
```shell
bash -c "$(curl -fsSL https://gitee.com/RubyKids/rbenv-cn/raw/main/tools/v0.1-uninstall.sh)"
```

<br>

上述安装过程一般不会有问题，如果您发现异常，可以使用以下两种方式检查:
```bash
rbenv doctor 
# 或 
curl -fsSL https://gitee.com/RubyKids/rbenv-cn/raw/main/bin/rbenv-doctor | bash
```

<br>

## Gem换源
```bash
gem source -r https://rubygems.org/ 
gem source -a https://gems.ruby-china.com 

# Bundler change source
bundle config 'mirror.https://rubygems.org' 'https://gems.ruby-china.com' 
```

<br>
