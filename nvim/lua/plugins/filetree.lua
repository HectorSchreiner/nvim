return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      -- Setup Neo-tree
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,  -- Show hidden files (dotfiles)
            hide_gitignored = true, -- Hide files ignored by git
          },
        },
        window = {
          position = "right",  -- Set Neo-tree position on the left side
          width = 30,
        },
        buffers = {
          show_unloaded = true,  -- Show all buffers
        },
      })

      -- Set a keybinding to toggle Neo-tree
      vim.api.nvim_set_keymap(
        "n", "<C-n>", ":Neotree toggle<CR>", { noremap = true, silent = true }
      )
    end
  }
