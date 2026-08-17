vim.pack.add {
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
}

require("nvim-treesitter").setup({
  ensure_installed = {},
  sync_install = false,
  auto_install = false,
  highlight = { enable = true },
  indent = { enable = true },
})
