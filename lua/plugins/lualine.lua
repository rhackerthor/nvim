vim.pack.add({
  'https://github.com/nvim-lualine/lualine.nvim',
})

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { statusline = { "dashboard", "alpha", "starter", "snacks_dashboard" } },
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {
      {
        "mode",
        separator = { left = "\u{e0b6}" },
        right_padding = 2,
      },
    },
    lualine_b = {
      {
        "branch",
        icon = "\u{f058}",
        color = { fg = "#ff9e64" },
      },
    },
    lualine_c = {
      {
        "filename",
        file_status = true,
        newfile_status = false,
        path = 1,
        shorting_target = 40,
        symbols = {
          modified = "\u{25cf}",
          readonly = "\u{f023}",
          unnamed = "[No Name]",
          newfile = "[New]",
        },
      },
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn", "info", "hint" },
        symbols = { error = "\u{2718} ", warn = "\u{25b2} ", info = "\u{25cf} ", hint = "\u{2691} " },
        colored = true,
        update_in_insert = false,
        always_visible = false,
      },
    },
    lualine_x = {
      {
        "diff",
        symbols = { added = "+", modified = "~", removed = "-" },
        colored = true,
      },
      "encoding",
      {
        "fileformat",
        symbols = { unix = "LF", dos = "CRLF", mac = "CR" },
      },
      "filetype",
    },
    lualine_y = { "progress" },
    lualine_z = {
      {
        "location",
        separator = { right = "\u{e0b4}" },
        left_padding = 2,
      },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})
