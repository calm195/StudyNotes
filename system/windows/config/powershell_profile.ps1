oh-my-posh init pwsh --config ?\oh-my-posh\themes\montys.omp.json | Invoke-Expression

# winget install gsudo
# winget install vim.vim
# Install-Module posh-git
# Install-Module -Name PSReadLine
# Install-Module ZLocation

Import-Module posh-git
Import-Module ZLocation
Import-Module PSReadLine

# 设置以列表形式显示推荐文本
Set-PSReadLineOption -PredictionSource History -PredictionViewStyle ListView
# 设置 ctrl + z 为撤销
Set-PSReadLineKeyHandler -Key "Ctrl+z" -function Undo
# 设置预测文本来源为历史记录
Set-PSReadLineOption -PredictionSource History 
# 设置 Tab 为菜单补全和 Intellisense
Set-PSReadLineKeyHandler -Key "Tab" -Function MenuComplete
# 每次回溯输入历史，光标定位于输入内容末尾
Set-PSReadLineOption -HistorySearchCursorMovesToEnd 