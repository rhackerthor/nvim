vim.pack.add({})

local M = {}

function M.hello()
  local buf = vim.api.nvim_create_buf(false, true)
  local width = 50
  local height = 4
  local row = math.floor(vim.o.lines * 0.28)
  local col = math.floor((vim.o.columns - width) / 2)

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
    "",
    "  Hello! Type 'good bye' to dismiss.",
    "  Press <Esc> to cancel.",
    "",
  })
  vim.api.nvim_buf_set_option(buf, "modifiable", false)

  local win = vim.api.nvim_open_win(buf, true, {
    style = "minimal",
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    border = "rounded",
    title = " Hello ",
    title_pos = "center",
    zindex = 50,
  })

  vim.api.nvim_win_set_option(win, "winhighlight", "Normal:Normal,FloatBorder:FloatBorder,FloatTitle:FloatTitle")

  local function prompt()
    vim.ui.input({ prompt = "> " }, function(input)
      if not input then
        if vim.api.nvim_win_is_valid(win) then
          vim.api.nvim_win_close(win, true)
        end
        return
      end
      if input == "good bye" then
        if vim.api.nvim_win_is_valid(win) then
          vim.api.nvim_win_close(win, true)
        end
        vim.notify("Good bye!", vim.log.levels.INFO)
      else
        vim.schedule(prompt)
      end
    end)
  end

  vim.schedule(prompt)
end

vim.api.nvim_create_user_command("Hello", M.hello, {})

-- Test vim.ui.select (which Metals likely uses for sbt/mill choice)
vim.api.nvim_create_user_command("Select", function()
  vim.ui.select({ "sbt", "mill", "bloop" }, {
    prompt = "Choose build tool:",
    format_item = function(item)
      return "  " .. item
    end,
  }, function(choice)
    if choice then
      vim.notify("Selected: " .. choice, vim.log.levels.INFO)
    end
  end)
end, {})

-- Test vim.fn.confirm fallback
vim.api.nvim_create_user_command("Confirm", function()
  local choice = vim.fn.confirm("Choose build tool:", "&sbt\n&mill\n&Bloop", 1)
  vim.notify("Selected option " .. choice, vim.log.levels.INFO)
end, {})

return M
