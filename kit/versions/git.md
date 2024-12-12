# git

git 是一个分布式版本控制系统，用于跟踪文件的变化。
`.gitingore` 文件用于忽略不需要跟踪的文件。在上一次提交的基础上，`.gitignore` 文件只会跟踪没有跟踪过的文件和文件夹。即，如果文件已经被跟踪过，那么即使在`.gitignore`文件中添加了该文件，也不会被忽略。

## 参数含义

- `--mixed`：默认参数，重置HEAD，暂存区不变，工作区不变
- `--soft`：重置HEAD，暂存区不变，工作区不变
- `--hard`：重置HEAD，暂存区回退，工作区恢复到HEAD
- `HEAD`：当前版本
- `HEAD^`：上一个版本

## git init

初始化一个git仓库。

- `git init`：初始化一个git仓库
- `git init --bare`：初始化一个裸仓库

## git-status

查看工作区、暂存区、版本库的状态。

- `git status`：查看工作区、暂存区、版本库的状态
- `git status -s`：查看工作区、暂存区、版本库的状态（简短）

## git commit

提交文件。

- `git commit . -m "message"`：提交暂存区的所有文件
- `git commit file -m "message"`：提交暂存区的指定文件
- `git commit -a -m "message"`：提交工作区的所有文件
- `git commit --amend -m "message"`：修改最近一次提交的信息

## git show

查看提交的详细信息。

- `git show`：查看最新提交的详细信息，包括提交信息，内容以及具体变更情况
- `git show commit_id`：查看指定提交的详细信息
- `git show tag_name`：查看指定标签的详细信息，即当时commit的详细信息
- `git show --raw`: 查看提交的文件变更情况

## git log

查看提交历史。

- `git log`：查看提交历史，包括提交信息，提交人，提交时间
- `git log --stat`：查看提交历史，包括提交信息，提交人，提交时间，文件变更情况
- `git log --name-only`：查看提交历史，包括提交信息，提交人，提交时间，发生变更的文件名
- `git log --pretty=oneline`：查看提交历史，只显示提交ID和提交信息
- `git log --pretty=format:"%h - %an, %ar : %s"`：查看提交历史，自定义格式
  - 格式说明：
    - `%h`：提交ID
    - `%an`：提交人
    - `%ar`：提交时间
    - `%s`：提交信息
- `git log --author=author_name`：查看指定作者的提交历史

## git tag

查看标签。

- `git tag`：查看所有标签
- `git tag -l "tag_name"`：查看指定标签，支持通配符*
- `git tag tag_name`：创建轻量标签
- `git tag tag_name commit_id`：为指定commit创建轻量标签
- `git tag -a tag_name -m "message"`：创建带注释的标签
- `git tag -a tag_name commit_id -m "message"`：为指定commit创建带注释的标签
- `git tag -d tag_name`：删除标签

## git add

将工作区的文件添加到暂存区。

- `git add file`：将工作区的文件添加到暂存区
- `git add .`：将工作区的所有文件添加到暂存区
- `git add -u`：将工作区的已跟踪文件添加到暂存区

## git rm

删除文件。

- `git rm file`：删除文件
- `git rm -r dir`：删除目录
- `git rm --cached file`：删除暂存区的文件，保留工作区的文件，即取消跟踪

## git checkout

切换分支

- `git checkout branch_name`：切换分支
- `git checkout tag_name`：切换到标签
- `git checkout -b branch_name`：创建并切换分支
- `git checkout -b branch_name tag_name`：创建并切换分支，并切换到标签

回退版本

- `git checkout HEAD file`：回退版本，将暂存区的文件恢复到最近一次提交的版本
- `git checkout commit_id file`：回退版本，将暂存区的文件恢复到指定提交的版本
- `git checkout HEAD .`：回退版本，将暂存区的所有文件恢复到最近一次提交的版本
- `git checkout commit_id .`：回退版本，将暂存区的所有文件恢复到指定提交的版本

## git switch

切换分支

- `git switch branch_name`：切换分支
- `git switch -c branch_name`：创建并切换分支

## git reset

回退版本

- `git reset commit_id`：回退版本，将HEAD指向指定提交，暂存区和工作区不变
- `git reset --hard commit_id`：回退版本，将HEAD指向指定提交，暂存区和工作区恢复到指定提交

## git revert

撤销提交

- `git revert commit_id`：撤销指定提交，生成一个新的提交，暂存区和工作区不变

## git branch

查看分支

- `git branch`：查看本地分支
- `git branch -a`：查看所有分支
- `git branch -r`：查看远程分支
- `git branch -v`：查看本地分支以及最后一次提交
- `git branch -vv`：查看本地分支以及最后一次提交和远程分支

创建分支

- `git branch branch_name`：创建本地分支

删除分支

- `git branch -d branch_name`：删除本地分支

## git remote

- `git remote`：查看远程仓库名称
- `git remote -v`：查看远程仓库名称和地址
- `git remote add remote_name remote_url`：添加远程仓库
- `git remote remove remote_name`：删除远程仓库
- `git remote rename old_name new_name`：重命名远程仓库
- `git remote set-url remote_name remote_url`：修改远程仓库地址

## git-stash

将变化放在一个脏工作区中，然后切换到HEAD。

- `git stash`：将变化放在一个脏工作区中，然后切换到HEAD。只会存储已经被跟踪的文件
- `git stash -u`：将变化放在一个脏工作区中，然后切换到HEAD。会存储所有文件
- `git stash --all`：将变化放在一个脏工作区中，然后切换到HEAD。会存储所有文件，包括ignored文件
- `git stash list`：查看stash列表
- `git stash apply`：应用最新的stash
- `git stash apply stash@{n}`：应用指定的stash
- `git stash pop`：应用最新的stash并删除
- `git stash pop stash@{n}`：应用指定的stash并删除
- `git stash drop`：删除最新的stash
- `git stash drop stash@{n}`：删除指定的stash
- `git stash clear`：删除所有stash
- `git stash branch branch_name`：创建一个新分支，并将stash应用到新分支上，然后删除stash

## git diff

查看文件的变化。

- `git diff`：查看工作区和暂存区的文件变化
- `git diff file`：查看工作区和暂存区的指定文件变化
- `git diff commit_id`：查看工作区和指定提交的文件变化
- `git diff commit_id1 commit_id2`：查看两个提交之间的文件变化
- `git diff commit_id1 commit_id2 file`：查看两个提交之间的指定文件变化
- `git diff commit_id1 commit_id2 --stat`：查看两个提交之间的文件变化，包括文件名

## git merge

将分支合并到当前分支。

- `git merge branch_name`：将分支合并到当前分支

## git clean

删除未跟踪的文件。

- `git clean`：删除未跟踪的文件
- `git clean -n`：查看将要删除的文件
- `git clean -d -f`：删除未跟踪的文件和目录，包括子目录（-f 强制删除）

## git push

将本地分支推送到远程仓库。

- `git push`：将本地分支推送到远程仓库
- `git push remote_name branch_name`：将本地分支推送到远程仓库
- `git push remote_name tag_name`：将本地标签推送到远程仓库
- `git push remote_name --tags`：将本地所有标签推送到远程仓库
- `git push remote_name :branch_name`：删除远程分支
- `git push remote_name :tag_name`：删除远程标签
- `git push remote_name --delete branch_name`：删除远程分支
- `git push remote_name --delete tag_name`：删除远程标签

## 撤销本地修改

1. 未使用 `git add` 提交到暂存区

    ```shell
    git checkout -- file
    git checkout .
    ```

2. 已使用 `git add` 提交到暂存区

    ```shell
    git reset HEAD file
    git checkout -- file
    git reset HEAD .
    git checkout .
    ```

3. 已使用 `git commit` 提交到版本库

    ```shell
    git reset --hard HEAD^
    git reset --hard commit_id
    ```
