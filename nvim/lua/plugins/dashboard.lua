-- lua/plugins/dashboard.lua

return {
	{
		"goolord/alpha-nvim", -- Alpha dashboard plugin
		requires = { "nvim-tree/nvim-web-devicons" }, -- For file icons
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			-- Set header (ASCII art)
			dashboard.section.header.val = {
				"██████╗░███████╗███╗░░██╗██╗░██████╗",
				"██╔══██╗██╔════╝████╗░██║██║██╔════╝",
				"██████╔╝█████╗░░██╔██╗██║██║╚█████╗░",
				"██╔═══╝░██╔══╝░░██║╚████║██║░╚═══██╗",
				"██║░░░░░███████╗██║░╚███║██║██████╔╝",
				"╚═╝░░░░░╚══════╝╚═╝░░╚══╝╚═╝╚═════╝░",
			}

			-- Set menu buttons
			dashboard.section.buttons.val = {
				dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
				dashboard.button("r", "  Recently used files", ":Telescope oldfiles<CR>"),
				dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
			}

			-- Footer
			dashboard.section.footer.val = "🚀 Neovim loaded successfully"

			alpha.setup(dashboard.config)
		end,
	},
}
