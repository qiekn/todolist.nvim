# todolist.nvim

![preview](https://github.com/user-attachments/assets/afc2b24b-b882-4b7a-9b7c-3b4db4774527)

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
