# 安装

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

# 卸载

```bash
uninstall_oh_my_zsh
```

# 配置

```bash
vim ~/.zshrc
```

1. 修改主题

    ```bash
    ZSH_THEME="agnoster"
    ```

    > powerlevel10k

2. 修改插件

    ```bash
    plugins=(
            git
            autojump
            zsh-autosuggestions
            zsh-syntax-highlighting
    )
    ```

    1. `autojump`：目录跳转
        安装 autojump

        ```
        brew install autojump
        ```

        使用 autojump
        > - `j`：跳转到指定目录
        > - `j -purge`：删除不存在的路径
        > - `j -stat`：查看路径统计 x
    2. `zsh-autosuggestions`：命令自动补全
        安装 zsh-autosuggestions

        ```bash
        brew install zsh-autosuggestions
        ```

        修改配置文件

        ```bash
        vim ~/.zshrc
        ```

        添加一行

        ```bash
        source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
        ```

        > 注意：`/opt/homebrew` 是 `brew` 的安装目录
    3. `zsh-syntax-highlighting`：命令语法高亮
        安装 zsh-syntax-highlighting

        ```bash
        brew install zsh-syntax-highlighting
        ```

        修改配置文件

        ```bash
        vim ~/.zshrc
        ```

        添加一行

        ```bash
        source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        ```

             > 注意：`/opt/homebrew` 是 `brew` 的安装目录
3. 生效配置

    ```bash
    source ~/.zshrc
    ```
