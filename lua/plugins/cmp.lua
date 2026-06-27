vim.pack.add {
  { src = "https://github.com/saghen/blink.cmp", version = "v1", name = "blink.cmp" },
}

require("blink.cmp").setup({
  keymap = {
    preset = "enter",
    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },
  },
  completion = {
    ghost_text = { enabled = true }
  }
})
