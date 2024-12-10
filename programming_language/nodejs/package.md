# nodejs 包版本管理

## npm

- 在 `package.json` 中指定版本号
  - `^`：允许大版本号变化，不允许小版本号变化
  - `~`：允许大版本号和小版本号变化，不允许小版本号变化
  - `*`：允许所有版本号变化
  - `>=`：大于等于指定版本
  - `<=`：小于等于指定版本
  - `>`：大于指定版本
  - `<`：小于指定版本
  - `=`：等于指定版本
  - `-`：指定范围版本
  - `||`：或
  
  > 指定nodejs版本：`"engines": {"node": ">=4.0.0"}`
  > 指定npm版本：`"engines": {"npm": ">=3.0.0"}`
- `.npmrc`文件
  - `registry`：指定npm源
  - `engineStrict`：是否严格检查nodejs和npm版本
  > `{ "registry": "https://registry.npm.taobao.org", "engineStrict": true }`
