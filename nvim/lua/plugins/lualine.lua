-- lua/plugins/lualine.lua

return {
  {
    "nvim-lualine/lualine.nvim",  -- Lualine plugin
    requires = { "nvim-tree/nvim-web-devicons", opt = true },  -- Optional for icons
    config = function()
      -- Basic Lualine setup
      require("lualine").setup({
        options = {
          theme = "auto",  -- Auto-detect the theme based on colorscheme
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },  -- Displays the current mode (Normal, Insert, etc.)
          lualine_b = { "branch" },  -- Shows the current Git branch
          lualine_c = { { "filename", path = 1 } },  -- Shows the filename with relative path
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },  -- Shows progress (e.g., 45%)
          lualine_z = { "location" },  -- Shows line number and column
        },
        inactive_sections = {  -- Sections when the window is inactive
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        extensions = { "fugitive", "nvim-tree" },  -- Add extensions (for Git and file tree)
      })
    end
  }
}

