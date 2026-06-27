vim.pack.add {
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', branch = 'main' },
}

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua", "python", "bash", "json", "yaml", "toml",
    "markdown", "markdown_inline", "html", "css", "javascript",
    "typescript", "c", "cpp", "rust", "go", "java", "scala",
    "dockerfile", "gitignore", "gitcommit", "diff",
    "vim", "vimdoc", "regex", "query",
  },
  sync_install = true,
  auto_install = false,
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      scope_incremental = "<CR>",
      node_incremental = "<Tab>",
      node_decremental = "<S-Tab>",
    },
  },
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
