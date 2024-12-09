# powershell准备

```powershell
# 允许运行Install-Module脚本
set-executionpolicy remotesigned

# 更新最新版本的PSReadLine，为了自动补全
Install-Module PSReadLine

# 创建powershell 的初始化脚本，点击确认创建即可
notepad $profile

# 安装几个插件
Install-Module posh-git
Install-Module Terminal-Icons
```

# ohmyposh准备

```powershell
# 安装ohmyposh
winget install JanDeDobbeleer.OhMyPosh -s winget
# 查看ohmyposh主题
Get-PoshThemes
```

# 配置powershell

```powershell
notepad $profile
```

# 配置ohmyposh

```powershell
oh-my-posh init pwsh --config path/to/theme.json | Invoke-Expression
Import-Module name
Set-xxx name -option value
```
