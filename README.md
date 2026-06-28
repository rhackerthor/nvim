# Neovim Configuration

基于 Neovim 原生 `vim.pack.add()` 包管理（`vim.pack`），零第三方插件管理器依赖。

## 环境要求

| 依赖 | 说明 |
|------|------|
| **Neovim >= 0.12** | 内置 `vim.pack.add()` 支持 |
| **Git** | 插件拉取与更新 |
| **Nerd Font** | 图标显示（推荐 [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts)） |
| **Ripgrep** (`rg`) | Telescope 实时文本搜索 |
| **GCC / Clang** | LSP 与 Treesitter parser 编译 |
| **Node.js >= 18** | 部分 LSP server 需要 |
| **Python >= 3.8** | pyright LSP 需要 |
| **Ghostty** | 推荐的终端模拟器 |

## 安装

```bash
git clone <repo-url> ~/.config/nvim
nvim                # 首次启动自动安装插件
nvim                # 重启生效
```

安装 / 同步所有插件版本：

```vim
:lua vim.pack.sync()
```

## 文件结构

```
~/.config/nvim/
├── init.lua                  # 入口，按顺序加载所有模块
├── README.md
└── lua/
    ├── config/
    │   ├── options.lua       # 编辑器选项
    │   └── keymaps.lua       # 全局快捷键
    └── plugins/
        ├── bufferline.lua    # 顶部缓冲区标签栏
        ├── cmp.lua           # 代码补全 (blink.cmp + friendly-snippets)
        ├── gitsigns.lua      # 行级 Git 变更标记
        ├── lsp.lua           # LSP (mason + nvim-lspconfig)
        ├── lualine.lua       # 底部状态栏
        ├── metals.lua        # Scala / Java LSP (nvim-metals)
        ├── mini.lua          # mini.pairs 自动配对
        ├── notice.lua        # 增强 UI (noice + nui + nvim-notify)
        ├── oil.lua           # 目录文件管理器
        ├── oil-git.lua       # Oil 目录 Git 状态着色
        ├── smear-cursor.lua  # 光标平滑动画
        ├── telescope.lua     # 模糊查找器
        ├── theme.lua         # 主题 tokyonight-moon
        ├── tmux.lua          # Tmux 面板无缝导航
        ├── todo-comments.lua # TODO / FIXME 注释高亮
        └── treesitter.lua    # Treesitter 语法高亮
```

## 插件一览

| 插件 | 仓库 | 用途 |
|------|------|------|
| **tokyonight.nvim** | `folke/tokyonight.nvim` | 主题配色 (tokyonight-moon) |
| **blink.cmp** | `saghen/blink.cmp` | 高性能异步代码补全引擎 |
| **friendly-snippets** | `rafamadriz/friendly-snippets` | 预置代码片段集 |
| **nvim-treesitter** | `nvim-treesitter/nvim-treesitter` | Treesitter 高亮、缩进、折叠 |
| **mason.nvim** | `mason-org/mason.nvim` | LSP / DAP / Linter / Formatter 包管理 |
| **nvim-lspconfig** | `neovim/nvim-lspconfig` | LSP 客户端通用配置 |
| **nvim-metals** | `scalameta/nvim-metals` | Scala / Java Metals LSP |
| **telescope.nvim** | `nvim-telescope/telescope.nvim` | 文件 / 缓冲区 / 文本模糊搜索 |
| **plenary.nvim** | `nvim-lua/plenary.nvim` | Telescope 依赖库 |
| **oil.nvim** | `stevearc/oil.nvim` | 目录编辑器（类 vim-vinegar） |
| **oil-git.nvim** | `malewicz1337/oil-git.nvim` | Oil 目录 Git 状态着色与符号 |
| **gitsigns.nvim** | `lewis6991/gitsigns.nvim` | 行级 Git 增删改标记 + 区块操作 |
| **lualine.nvim** | `nvim-lualine/lualine.nvim` | 状态栏 |
| **bufferline.nvim** | `akinsho/bufferline.nvim` | 缓冲区标签栏 |
| **nvim-web-devicons** | `nvim-tree/nvim-web-devicons` | 文件图标 |
| **noice.nvim** | `folke/noice.nvim` | 命令栏 / 消息 / 弹出菜单 UI 增强 |
| **nui.nvim** | `MunifTanjim/nui.nvim` | noice 弹出组件依赖 |
| **nvim-notify** | `rcarriga/nvim-notify` | 通知弹窗后端 |
| **mini.pairs** | `echasnovski/mini.pairs` | 括号引号自动配对 |
| **todo-comments.nvim** | `folke/todo-comments.nvim` | TODO / FIXME 注释高亮 |
| **smear-cursor.nvim** | `sphamba/smear-cursor.nvim` | 平滑光标动画 |
| **vim-tmux-navigator** | `christoomey/vim-tmux-navigator` | Tmux ↔ Neovim 面板切换 |

---

## 编辑器选项

| 选项 | 值 | 说明 |
|------|-----|------|
| `number` | `true` | 显示行号 |
| `relativenumber` | `true` | 相对行号（跳转方便） |
| `wrap` | `false` | 不自动折行 |
| `cursorline` | `true` | 高亮当前行 |
| `tabstop` | `2` | Tab 宽度 |
| `shiftwidth` | `2` | 自动缩进宽度 |
| `expandtab` | `true` | Tab 转空格 |
| `mouse` | `a` | 启用鼠标 |
| `clipboard` | `unnamedplus` | 系统剪贴板同步 |
| `undofile` | `true` | 持久撤销历史 |
| `ignorecase` + `smartcase` | 搜索默认忽略大小写，含大写则精确 |
| `scrolloff` | `4` | 光标距上下边缘 ≥4 行 |
| `hlsearch` | `false` | 默认不高亮搜索结果 |
| `inccommand` | `split` | 实时预览 `:%s` 替换 |
| `updatetime` | `250` | 写入 swap 间隔 (ms) |
| `timeoutlen` | `300` | 按键序列超时 (ms) |
| `showmode` | `false` | 隐藏模式指示（由 lualine 显示） |
| `conceallevel` | `2` | 隐藏标记级别 |

---

## 快捷键速查

> **Leader 键:** `空格`

### 通用操作

| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `jk` | Insert | 退出插入模式 |
| `<leader>w` | Normal | 保存文件 |
| `<leader>q` | Normal | 关闭窗口 |
| `<leader>nh` | Normal | 清除搜索高亮 |
| `<leader>y` | Normal, Visual | 复制到系统剪贴板 |
| `<leader>Y` | Normal | 复制整行到系统剪贴板 |
| `<leader>p` | Visual | 粘贴（不覆盖默认寄存器） |
| `Ctrl+d` | Normal | 向下翻页并居中 |
| `Ctrl+u` | Normal | 向上翻页并居中 |
| `n` / `N` | Normal | 下一个 / 上一个搜索结果并居中 |

### 窗口与分屏

| 快捷键 | 功能 |
|--------|------|
| `<leader>sv` | 垂直分屏 |
| `<leader>sh` | 水平分屏 |
| `<leader>se` | 等分所有窗口 |
| `<leader>sx` | 关闭当前窗口 |
| `Ctrl+h/j/k/l` | Tmux / Neovim 面板间光标导航 |

### 缓冲区

| 快捷键 | 功能 |
|--------|------|
| `Ctrl+o` | 下一个缓冲区 |
| `Ctrl+i` | 上一个缓冲区 |
| `<leader>bd` | 关闭当前缓冲区 |
| `<leader>bo` | 关闭其他缓冲区 |

---

### 文件管理 — Oil

| 快捷键 | 功能 |
|--------|------|
| `-` | 打开当前文件的父目录 |
| `<CR>` | 打开文件 / 进入目录 |
| `<leader>v` | 垂直分屏打开 |
| `<leader>h` | 水平分屏打开 |
| `<C-t>` | 新标签页打开 |
| `<C-p>` | 预览文件 |
| `<C-r>` | 刷新目录 |
| `gx` | 用外部程序打开 |
| `g.` | 显示 / 隐藏隐藏文件 |
| `g\` | 显示 / 隐藏回收站 |
| `gs` | 切换排序方式 |
| `` ` `` | 切换工作目录到当前 Oil 目录 |
| `g~` | 切换 Tab 页工作目录 |
| `gl` | 切换文件详情列（大小、修改时间） |
| `g?` | 显示 Oil 帮助 |

---

### 搜索 — Telescope

| 快捷键 | 功能 |
|--------|------|
| `<leader>ff` | 查找文件 |
| `<leader>fg` | 实时文本搜索 (ripgrep) |
| `<leader>fb` | 已打开缓冲区列表 |
| `<leader>fh` | 搜索 Neovim 帮助文档 |
| `<leader>fd` | 列出所有 LSP 诊断 |
| `<leader>fr` | 最近打开过的文件 |
| `<leader>fk` | 搜索快捷键 |
| `<leader>fs` | 当前文件 LSP 符号 |
| `<leader>fS` | 整个工作区 LSP 符号 |
| `<leader>gc` | Git 提交记录 |
| `<leader>gb` | Git 分支列表 |
| `<leader>gs` | Git 文件状态 |

> Telescope 内置快捷键: `Ctrl+j/k` 上下移动，`Ctrl+q` 发送到 quickfix 列表。

---

### LSP (Language Server Protocol)

| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `gd` | Normal | 跳转到定义 |
| `gD` | Normal | 跳转到声明 |
| `gr` | Normal | 查找所有引用 |
| `gi` | Normal | 跳转到接口实现 |
| `gy` | Normal | 跳转到类型定义 |
| `K` | Normal | 显示悬停文档 |
| `<leader>rn` | Normal | 重命名符号 |
| `<leader>ca` | Normal, Visual | 代码操作（快速修复等） |
| `<leader>f` | Normal | 格式化当前缓冲区 |
| `g[` | Normal | 上一个诊断 |
| `g]` | Normal | 下一个诊断 |
| `<leader>dq` | Normal | 诊断列表窗口 |
| `<leader>th` | Normal | 切换行内提示 (Inlay Hints) |

已启用 LSP Server: **lua_ls** · **pyright** · **bashls** · **jsonls** · **yamlls**

安装其他 LSP:

```vim
:Mason              " 打开管理界面
:MasonInstall gopls " 安装指定 LSP
```

然后在 `lua/plugins/lsp.lua` 末尾的 `vim.lsp.enable({...})` 中添加 server 名称。

---

### 代码补全 — Blink

| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `Tab` / `↓` | Insert (补全菜单) | 下一个候选项 |
| `Shift+Tab` / `↑` | Insert (补全菜单) | 上一个候选项 |
| `Ctrl+p` / `Ctrl+n` | Insert (补全菜单) | 上一个 / 下一个候选项 |
| `Enter` | Insert | 确认当前选择 |
| `Ctrl+Space` | Insert | 手动触发补全 |
| `Ctrl+e` | Insert | 关闭补全菜单 |
| `Ctrl+b` | Insert (补全菜单) | 向上滚动文档 |
| `Ctrl+f` | Insert (补全菜单) | 向下滚动文档 |

Blink 还启用了:

- **命令行补全**: 在 `:` 命令和 `/` 搜索中自动建议
- **签名帮助**: 函数参数自动提示
- **Ghost Text**: 行内显示补全预览
- **自动括号**: 函数补全自动添加 `()`
- **Snippets**: 内置 `friendly-snippets` 代码片段支持

---

### Git — Gitsigns

| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `]h` | Normal | 下一个变更区块 (hunk) |
| `[h` | Normal | 上一个变更区块 (hunk) |
| `<leader>hs` | Normal, Visual | 暂存 (Stage) 当前区块 |
| `<leader>hr` | Normal, Visual | 重置 (Reset) 当前区块 |
| `<leader>hS` | Normal | 暂存整个文件 |
| `<leader>hp` | Normal | 预览区块变更 |
| `<leader>hb` | Normal | 行级 Git Blame |

---

### TODO 注释

| 快捷键 | 功能 |
|--------|------|
| `]t` | 跳转到下一个 TODO / FIXME / HACK 注释 |
| `[t` | 跳转到上一个 TODO 注释 |

---

## Scala 开发

`nvim-metals` 在打开 `.scala`、`.sbt`、`.java` 文件时自动延迟加载。首次使用需在 Metals 弹窗中选择项目导入方式。

---

## 维护

```vim
:checkhealth              " 健康检查
:lua vim.pack.sync()      " 同步 / 更新所有插件
:lua vim.pack.clean()     " 清理未引用的插件

:Mason                    " 管理 LSP / Formatter / Linter
:TSInstallInfo            " 查看 Treesitter parser 安装状态
:TSUpdate                 " 更新所有 Treesitter parser
```

## 自定义

### 添加插件

1. 在 `lua/plugins/` 下新建 `my-plugin.lua`
2. 在 `init.lua` 中添加 `require("plugins.my-plugin")`

```lua
-- lua/plugins/my-plugin.lua
vim.pack.add {
  'https://github.com/author/plugin.nvim',
}

require("plugin").setup({
  -- 配置项
})
```

### 修改主题

编辑 `lua/plugins/theme.lua`:

```lua
vim.cmd.colorscheme("<theme-name>")
```

### 添加 LSP 语言

1. `:MasonInstall <server-name>`
2. 编辑 `lua/plugins/lsp.lua`，在 `vim.lsp.enable({...})` 中添加 server

### 启用 Treesitter

如需启用 Treesitter 语法高亮，需先在系统中安装 `tree-sitter` CLI:

```bash
npm install -g tree-sitter-cli
# 或 cargo install tree-sitter-cli
```

然后取消 `init.lua` 中 `treesitter` 行的注释，重启 Neovim 即可自动安装所有 parser。
