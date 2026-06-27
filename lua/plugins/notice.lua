vim.pack.add({
  { src = 'https://github.com/folke/noice.nvim' },
  { src = 'https://github.com/MunifTanjim/nui.nvim' },
})

require("noice").setup({
  lsp = {
    message = {
      view = "mini",
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
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
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
  },
})

vim.lsp.handlers["window/showMessageRequest"] = function(_, params)
  local actions = params.actions or {}

  if #actions == 0 then
    vim.notify(params.message, vim.log.levels.INFO)
    return vim.NIL
  end

  local choices = {}
  for _, action in ipairs(actions) do
    table.insert(choices, action.title:gsub("\r\n", "\\r\\n"):gsub("\n", "\\n"))
  end

  local choice = vim.fn.confirm(params.message, table.concat(choices, "\n"), 1)
  if choice < 1 or choice > #actions then
    return vim.NIL
  end

  return actions[choice]
end
