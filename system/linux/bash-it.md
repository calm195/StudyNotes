# Bash-it

Bash-it是一个社区驱动的Bash配置框架，可以配置和管理Bash shell的各种插件、主题和自动补全功能。它旨在简化Bash的使用体验，使用户能够更高效地工作。

## 安装

首先，确保你已经安装了Git和Bash。然后，按照以下步骤安装Bash-it：

```bash
# 克隆Bash-it仓库
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it

# 运行安装脚本
~/.bash_it/install.sh
```

## 使用

安装完成后，你可以使用以下命令来启用或禁用插件和别名：

```bash
# 启用插件
bash-it enable plugin <plugin_name>
# 禁用插件
bash-it disable plugin <plugin_name>

# 启用别名
bash-it enable alias <alias_name>
# 禁用别名
bash-it disable alias <alias_name>
```

操作组件后，记得重新加载Bash配置：

```bash
bash-it reload
```


