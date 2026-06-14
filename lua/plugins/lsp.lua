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

-- Create keymapping
-- LspAttach: After an LSP Client performs "initialize" and attaches to a buffer.
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function (args)
      pattern = { "lua", "python", "c", "cpp" }
    end
})

vim.lsp.enable({ "lua_ls", "pyright" })
