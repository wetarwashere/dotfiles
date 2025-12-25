return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[                                ]],
			[[                                ]],
			[[                                ]],
			[[ ██╗    ██╗   ██╗██╗███╗   ███╗ ]],
			[[ ██║    ██║   ██║██║████╗ ████║ ]],
			[[ ██║    ██║   ██║██║██╔████╔██║ ]],
			[[ ██║    ╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
			[[ ███████╗╚████╔╝ ██║██║ ╚═╝ ██║ ]],
			[[ ╚══════╝ ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
			[[                                ]],
			[[                                ]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("n", " New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("e", " Explorer", ":Neotree float filesystem reveal<CR>"),
			dashboard.button("e", "󰏓 Plugins manager", ":Mason<CR>"),
			dashboard.button("f", " Find file", ":Telescope live_grep<CR>"),
			dashboard.button("q", "󰩈 Quit neovim", ":qa<CR>"),
		}

		dashboard.section.header.opts.hl = "AlphaHeader"

		alpha.setup(dashboard.opts)
		vim.cmd([[
            autocmd FileType alpha setlocal nofoldenable
        ]])
	end,
}
