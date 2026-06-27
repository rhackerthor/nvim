vim.pack.add({
  { src = "https://github.com/folke/todo-comments.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" }
})

require("todo-comments").setup({})

vim.keymap.set('n', ']t', function() require('todo-comments').jump_next() end, { desc = "Next Todo Comment" })
vim.keymap.set('n', '[t', function() require('todo-comments').jump_prev() end, { desc = "Previous Todo Comment" })
