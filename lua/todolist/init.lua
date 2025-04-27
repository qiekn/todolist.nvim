local M = {}

local default_opts = {
  target_file = "~/Documents/notes/todo.md",
  border = "single",
}

local function expand_path(path)
  if path:sub(1, 1) == "~" then
    return os.getenv("HOME") .. path:sub(2)
  end
  print(path)
  return path
end

-- used for center floating window
local function center_in(outer, inner)
  return (outer - inner) / 2
end

local function win_config(opts)
  local width = math.min(64, math.floor(vim.o.columns * 0.8))
  local height = math.min(20, math.floor(vim.o.lines * 0.5))
  return {
    relative = "editor",
    width = width,
    height = height,
    col = center_in(vim.o.columns, width),
    row = center_in(vim.o.lines, height),
    border = opts.border,
  }
end

local function open_floating_file(opts)
  -- path
  local expanded_path = expand_path(opts.target_file)
  if vim.fn.filereadable(expanded_path) == 0 then
    vim.notify("todo-list file does not exist at directory: " .. expanded_path, vim.log.levels.ERROR)
    return
  end
  -- buffer
  local buf = vim.fn.bufnr(expanded_path, true)
  if buf == -1 then
    buf = vim.api.nvim_create_buf(false, false)
    vim.api.nvim_buf_set_name(buf, expanded_path)
  end
  vim.bo[buf].swapfile = false
  -- window
  local window = vim.api.nvim_open_win(buf, true, win_config(opts))
  vim.api.nvim_set_option_value("winhighlight", "Normal:FloatingTodoNormal", { win = window })
  -- command: quick quit this floating window when press q
  vim.api.nvim_buf_set_keymap(buf, "n", "q", "", {
    noremap = true,
    silent = true,
    callback = function()
      if vim.api.nvim_get_option_value("modified", { buf = buf }) then
        vim.notify("save your changes pls", vim.log.levels.WARN)
      else
        vim.api.nvim_win_close(0, true)
      end
    end,
  })
end

local function setup_user_commands(opts)
  opts = vim.tbl_deep_extend("force", opts, default_opts)
  vim.api.nvim_create_user_command("TodoList", function()
    open_floating_file(opts)
  end, {})
end

M.setup = function(opts)
  setup_user_commands(opts)
end

M.setup({
  target_file = "~/notes/todo.md",
  border = "single", -- single, rounded, etc.
})

vim.keymap.set("n", "<leader>td", ":TodoList<CR>", { silent = true, desc = "Todo-list" })
vim.keymap.set("n", "<leader>tt", ":TodoList<CR>", { silent = true, desc = "Todo-list" })

return M

-- vim: ts=2 sts=2 sw=2 et
