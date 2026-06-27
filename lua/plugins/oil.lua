vim.pack.add {
  'https://github.com/stevearc/oil.nvim',
}

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

require("oil").setup({
  win_options = {
    wrap = false,
    signcolumn = "yes",
    cursorcolumn = false,
    foldcolumn = "0",
    spell = false,
    list = false,
    conceallevel = 3,
    concealcursor = "nvic",
  },
  use_default_keymaps = false,
  keymaps = {
    ["g?"] = { "actions.show_help", mode = "n" },
    ["<CR>"] = "actions.select",
    ["<leader>v"] = { "actions.select", opts = { vertical = true } },
    ["<leader>h"] = { "actions.select", opts = { horizontal = true } },
    ["<C-t>"] = { "actions.select", opts = { tab = true } },
    ["<C-p>"] = "actions.preview",
    ["<C-c>"] = { "actions.close", mode = "n" },
    ["<C-r>"] = "actions.refresh",
    ["-"] = { "actions.parent", mode = "n" },
    ["_"] = { "actions.open_cwd", mode = "n" },
    ["`"] = { "actions.cd", mode = "n" },
    ["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
    ["gs"] = { "actions.change_sort", mode = "n" },
    ["gx"] = "actions.open_external",
    ["g."] = { "actions.toggle_hidden", mode = "n" },
    ["g\\"] = { "actions.toggle_trash", mode = "n" },
    ['gl'] = {
      callback = function()
        vim.g.oil_columns_toggle = not vim.g.oil_columns_toggle
        if vim.g.oil_columns_toggle then
          require('oil').set_columns({ "icon", "size", "mtime" })
        else
          require('oil').set_columns({ "icon" })
        end
      end,
      desc = "Toggle extra columns"
    },
  },
  preview_win = {
    update_on_cursor_moved = true,
    preview_method = "load",
    win_options = {},
  },
})
