# todolist.nvim

![preview](https://github.com/user-attachments/assets/05bab015-933a-41ec-b4a3-85972daba660)

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
