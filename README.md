# todolist.nvim

Install with lazy

```lua
return {
  "qiekn/todolist.nvim",
  config = function()
    require("todolist").setup({
      -- create you only file first
      target_file = "~/Documents/notes/todo.md",
      border = "single", -- single, rounded, etc.
    })
  end,
}
```
