--- mapleader ---
vim.g.mapleader = " "
--- Insert mode ---
vim.keymap.set("i", "jk", "<ESC>")
--- Visual Mode ---
-- vim.keymap.set("v", "J", ":m >+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m >-2<CR>gv=gv")
--- Normal mode ---
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")
vim.keymap.set("n", "<leader>t", ":w<CR>")
vim.keymap.set("n", "<leader>z", ":q<CR>")
vim.keymap.set("n", "<leader>v", ":vs<CR>")
vim.keymap.set("n", "<leader>h", ":sp<CR>")
vim.keymap.set("n", "<C-i>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<C-o>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<C-t>", "<CMD>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
