-- lua/plugins/telescope.lua

return {
  {
    "nvim-telescope/telescope.nvim",  -- Telescope plugin
    requires = { 
      "nvim-lua/plenary.nvim",  -- Telescope depends on plenary.nvim
    },
    config = function()
      -- Telescope setup
      require("telescope").setup({
        defaults = {
          -- Default configuration for Telescope
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
          },
          prompt_prefix = "> ",
          selection_caret = "> ",
          path_display = { "truncate" },
          file_ignore_patterns = { "node_modules" },
        },
        pickers = {
          -- Configure built-in pickers (like `find_files`, `live_grep`, etc.)
          find_files = {
            theme = "dropdown",  -- Use dropdown theme for file finding
          },
          live_grep = {
            theme = "ivy",  -- Use ivy theme for live grep
          }
        },
        extensions = {
          -- Add Telescope extensions here (if any)
        },
      })

      -- Keymap to quickly open Telescope find_files
      vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files<CR>", { noremap = true, silent = true })

      -- Keymap to search text in files (live grep)
      vim.api.nvim_set_keymap("n", "<C-f>", ":Telescope live_grep<CR>", { noremap = true, silent = true })
    end
  },
  {
          "nvim-telescope/telescope-ui-select.nvim",
          config = function()
        -- This is your opts table
                require("telescope").setup({
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }

    }
  }
})
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")
  end
},
}

