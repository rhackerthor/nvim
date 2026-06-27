vim.pack.add {
  { src = 'https://github.com/mason-org/mason.nvim', name = "mason" },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
}

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "●" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = { prefix = "" },
  signs = { active = signs },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = { border = "rounded", source = true },
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    map("n", "gr", vim.lsp.buf.references, "Go to references")
    map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
    map("n", "gy", vim.lsp.buf.type_definition, "Go to type definition")
    map("n", "K", vim.lsp.buf.hover, "Hover")
    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
    map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("v", "<leader>ca", vim.lsp.buf.code_action, "Code action (visual)")
    map("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, "Format buffer")
    map("n", "g[", vim.diagnostic.goto_prev, "Previous diagnostic")
    map("n", "g]", vim.diagnostic.goto_next, "Next diagnostic")
    map("n", "<leader>dq", vim.diagnostic.setloclist, "Diagnostic loclist")

    if client.supports_method("textDocument/inlayHint") then
      map("n", "<leader>th", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, "Toggle inlay hints")
    end
  end,
})

vim.lsp.enable({ "lua_ls", "pyright", "bashls", "jsonls", "yamlls", "clangd" })
