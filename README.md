# todolist.nvim

<img width="2432" height="1735" alt="Snipaste_2026-11-15_05-40-15" src="https://github.com/user-attachments/assets/9231aeff-7023-4365-9239-cea75869e029" />

## Usage

Commands: `:TodoList`

Default Keymap: `<leader>tt` `<leader>td`

You can press `q` to quickly close todo-list floating window when your cursor focusing on it

## Install

lazy plugin manager

```lua
return {
  "qiekn/todolist.nvim",
  config = function()
    require("todolist").setup({
      -- You need to manually create this file first
      target_file = "~/notes/todo.md",
      border = "single", -- single, rounded, etc.
    })
  end,
}
```

## Credits

YouTube Video:  
[Coding with Sphere: How to Make a Floating TODO List | Neovim plugin Tutorial](https://www.youtube.com/watch?v=7Kzv3wUHtyU)
