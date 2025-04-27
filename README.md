# todolist.nvim

![preview](https://github.com/user-attachments/assets/6cbbb908-7f13-4447-b108-e114e9b0988b)

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
