vim.pack.add {
  { src = 'https://github.com/nvim-telescope/telescope.nvim', tag = '0.1.8' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
}

local telescope = require("telescope")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

telescope.setup({
  defaults = {
    path_display = { "truncate" },
    border = true,
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = { prompt_position = "top", preview_width = 0.55 },
      vertical = { mirror = false },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    sorting_strategy = "ascending",
    winblend = 0,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<Esc>"] = actions.close,
      },
      n = {
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
      },
    },
  },
  pickers = {
    find_files = { hidden = true },
    live_grep = { additional_args = { "--hidden" } },
    buffers = {
      sort_lastused = true,
      mappings = {
        i = { ["<c-d>"] = actions.delete_buffer },
      },
    },
  },
  extensions = {},
})

local map = vim.keymap.set

map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
map("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostics" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Keymaps" })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Document symbols" })
map("n", "<leader>fS", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", { desc = "Workspace symbols" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Git commits" })
map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "Git branches" })
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Git status" })
