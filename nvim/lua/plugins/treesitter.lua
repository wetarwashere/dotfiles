return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"javascript",
				"html",
				"css",
				"typescript",
				"tsx",
				"go",
				"asm",
				"json",
				"jsonc",
			},
			sync_install = true,
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
