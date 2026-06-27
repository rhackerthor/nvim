vim.pack.add({
  { src = 'https://github.com/folke/noice.nvim' },
  { src = 'https://github.com/MunifTanjim/nui.nvim' },
  { src = 'https://github.com/rcarriga/nvim-notify' },
})

require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
    },
  },
  presets = {
    bottom_search = true,
    long_message_to_split = true,
    lsp_doc_border = true,
  },
  routes = {
    {
      filter = {
        event = "msg_show",
        any = {
          { find = "%d+L, %d+B" },
          { find = "; after #%d+" },
          { find = "; before #%d+" },
        },
      },
      view = "mini",
    },
  },
  views = {
    confirm = {
      focusable = true,
      position = {
        row = "45%",
        col = "50%",
      },
      border = {
        style = "rounded",
        padding = { 1, 2 },
        text = {
          top = " Metals Confirm ",
        },
      },
    },
  },
})
