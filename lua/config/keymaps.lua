vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")
vim.keymap.set("n", "<leader>t", ":w<CR>")
vim.keymap.set("n", "<leader>z", ":q<CR>")
vim.keymap.set("n", "<leader>v", ":vs<CR>")
vim.keymap.set("n", "<leader>h", ":sp<CR>")
vim.keymap.set("n", "<C-i>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<C-o>", ":BufferLineCycleNext<CR>")
