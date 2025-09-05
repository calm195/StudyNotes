# install in mac

记录在mac的安装方式与初始化过程

## homebrew4.6.8 - mysql8.0

1. 通过命令`brew install mysql@8.0`安装

2. 按照安装完成后的提示修改环境变量`vim ~/.zshrc`

    > 如果遗失信息可以通过`brew --prefix mysql`查看

    ```sh
    # 以我的为例
    export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"
    export LDFLAGS="-L/opt/homebrew/opt/mysql@8.0/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/mysql@8.0/include"
    export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql@8.0/lib/pkgconfig"
    ```

    最后记得`source ~/.zshrc`

3. 启动服务`brew services start mysql@8.0`
4. 进行安全配置，按提示来就行：`mysql_secure_installation`