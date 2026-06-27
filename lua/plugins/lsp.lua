vim.pack.add {
  { src = 'https://github.com/mason-org/mason.nvim', name = "mason" },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
}

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

vim.lsp.enable({ "lua_ls", "pyright" })
