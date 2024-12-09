# conda

conda: python环境管理工具

## 安装

### windows

下载安装包

- [官网](https://www.anaconda.com/products/distribution)
- [清华镜像](https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/)

> 安装路径不要有中文

配置国内镜像

- `conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/`

更新

- `conda update conda`，更新 `conda`
- `conda update anaconda`，更新 `anaconda`

### linux

下载安装包

- [官网](https://www.anaconda.com/products/distribution)
- [清华镜像](https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/)

换源

1. Linux `sudo vim ~/.condarc`
   输入以下内容

   ```shell
   channels:
       - defaults
   show_channel_urls: true
   channel_alias: https://mirrors.tuna.tsinghua.edu.cn/anaconda
   default_channels:
       - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
       - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free
       - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
       - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/pro
       - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2
   custom_channels:
       conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
       msys2: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
       bioconda: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
       menpo: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
       pytorch: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
       simpleitk: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
   ```

## 常见命令

1. 查看版本

   ```shell
   conda -V
   conda --version
   ```

2. 查看帮助

   ```shell
   conda -h
   conda --help
   ```

3. 查看已安装的环境

   ```shell
    conda env list
   ```

4. 创建环境
   - 创建指定版本的环境

   ```shell
   conda create -n env_name python=x.x
   ```

   - 创建指定包的环境

   ```shell
   conda create -n env_name package_name
   ```

5. 激活环境

   ```shell
   conda activate env_name
   ```

6. 退出环境

   ```shell
   conda deactivate
   ```

7. 删除环境

   ```shell
   conda remove -n env_name --all
   ```

8. 导出环境配置

   ```shell
   conda env export > environment.yml
   ```

9. 导入环境配置

   ```shell
   conda env create -f environment.yml
   ```

# 疑难杂症

1. powershell 无法激活 conda 虚拟环境
   - 打开 `powershell`
   - 输入 `conda init powershell`
   - 重启 `powershell`
