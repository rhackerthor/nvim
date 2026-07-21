vim.pack.add({
  { src = "https://github.com/stevearc/dressing.nvim" },
})

require("dressing").setup({
  input = {
    enabled = false,
  },
  select = {
    enabled = true,
    backend = { "builtin" },
    builtin = {
      show_count = true,
      width = 50,
      border = "rounded",
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual",
    },
  },
})
