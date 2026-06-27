vim.pack.add {
  'https://github.com/malewicz1337/oil-git.nvim',
}

require("oil-git").setup({
  debounce_ms = 50,
  show_file_highlights = true,
  show_directory_highlights = true,
  show_file_symbols = true,
  show_directory_symbols = true,
  show_ignored_files = false,
  show_ignored_directories = false,
  show_branch = false,
  symbol_position = "eol",
})
