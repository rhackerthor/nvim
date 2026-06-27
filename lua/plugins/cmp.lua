vim.pack.add {
  { src = "https://github.com/saghen/blink.cmp", version = "v1", name = "blink.cmp" },
  { src = "https://github.com/rafamadriz/friendly-snippets", name = "friendly-snippets" },
}

require("blink.cmp").setup({
  keymap = {
    preset = "enter",
    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },
    ["<C-p>"] = { "select_prev", "fallback" },
    ["<C-n>"] = { "select_next", "fallback" },
    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    ["<C-Space>"] = { "show", "fallback" },
    ["<C-e>"] = { "hide", "fallback" },
  },

  appearance = {
    nerd_font_variant = "mono",
  },

  completion = {
    accept = {
      auto_brackets = { enabled = true },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 300,
      window = {
        border = "rounded",
      },
    },
    ghost_text = { enabled = true },
    menu = {
      border = "rounded",
      draw = {
        columns = {
          { "kind_icon" },
          { "label", "label_description", gap = 1 },
        },
      },
    },
  },

  signature = { enabled = true },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },

  snippets = { preset = "default" },

  cmdline = {
    enabled = true,
    keymap = { preset = "cmdline" },
    sources = function()
      local t = vim.fn.getcmdtype()
      if t == "/" or t == "?" then return { "buffer" } end
      if t == ":" or t == "@" then return { "cmdline", "buffer" } end
      return {}
    end,
  },
})
