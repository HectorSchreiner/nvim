-- init.lua
-- Set the tab width to 2 spaces
vim.opt.tabstop = 2        -- Number of spaces tabs count for
vim.opt.shiftwidth = 2     -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true   -- Convert tabs to spaces

-- Set the leader key (optional)
vim.g.mapleader = " "

-- Load the lazy.nvim configuration
require("config.lazy")

-- themes
vim.cmd("colorscheme catppuccin")
local themes = { "catppuccin", "tokyonight", "gruvbox" }  -- Add more themes as you install them
local current_theme_index = 1

-- Function to switch themes
function SwitchTheme()
  current_theme_index = current_theme_index + 1
  if current_theme_index > #themes then
    current_theme_index = 1  -- Loop back to the first theme
  end
  vim.cmd("colorscheme " .. themes[current_theme_index])
  print("Switched to theme: " .. themes[current_theme_index])
end

-- Keymap to toggle between themes
vim.api.nvim_set_keymap("n", "<leader>tt", ":lua SwitchTheme()<CR>", { noremap = true, silent = true })

-- Create a function to reload Neovim config
function ReloadConfig()
  for name,_ in pairs(package.loaded) do
    if name:match("^user") or name:match("^plugins") then
      package.loaded[name] = nil
    end
  end
  dofile(vim.fn.stdpath('config') .. '/init.lua')
end

-- Keymap to reload the config
vim.api.nvim_set_keymap("n", "<leader>r", ":lua ReloadConfig()<CR>", { noremap = true, silent = true })

vim.opt.number = true
vim.opt.relativenumber = true
-- Toggle between absolute and relative line numbers
vim.api.nvim_set_keymap("n", "<leader>n", ":set relativenumber!<CR>", { noremap = true, silent = true })

-- Bind <leader>f to format the current buffer using the LSP
vim.api.nvim_set_keymap("n", "<leader>f", ":lua vim.lsp.buf.format({ async = true })<CR>", { noremap = true, silent = true })

