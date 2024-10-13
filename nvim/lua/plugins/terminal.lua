-- lua/plugins/toggleterm.lua
return {
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        size = 40,                       -- Default terminal size (for vertical it's width)
        open_mapping = [[<C-æ>]],         -- Keybinding to open the terminal
        direction = "vertical",           -- Open the terminal on the right side
        shade_terminals = true,           -- Make terminal window shaded
        persist_size = true,              -- Maintain terminal size across sessions
        close_on_exit = true,             -- Close the terminal when the process exits
      })
    end
  }
}

