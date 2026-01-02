return {
	{
		"yioneko/nvim-yati",
		version = "*",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
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
				yati = {
					enable = true,
					suppress_conflict_warning = true,
					default_lazy = true,
					default_fallback = "auto",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = true,
				},
				indent = {
					enable = true,
					disable = { "tsx" },
				},
			})
		end,
	},
}
