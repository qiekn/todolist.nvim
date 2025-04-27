# todolist.nvim

![preview](https://github.com/user-attachments/assets/afc2b24b-b882-4b7a-9b7c-3b4db4774527)

## Usage

Commands: `:TodoList`

Default Keymap: `<leader>tt` `<leader>td`

## Install

lazy plugin manager

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

## Credits

YouTube Video:  
[Coding with Sphere: How to Make a Floating TODO List | Neovim lugin Tutorial](https://www.youtube.com/watch?v=7Kzv3wUHtyU)
