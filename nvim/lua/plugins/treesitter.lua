-- lua/plugins/treesitter.lua

return {
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate", -- Automatically install/update parsers on setup
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				ensure_installed = { "rust", "lua", "python", "javascript", "markdown" }, -- List of languages to install
				auto_install = true,
				highlight = {
					enable = true, -- Enable Tree-sitter-based syntax highlighting
					additional_vim_regex_highlighting = false, -- Disable standard regex highlighting for better performance
				},
				indent = { enable = true },
			})
		end,
	},
}
