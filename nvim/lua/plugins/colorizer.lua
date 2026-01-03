return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			"*",
			css = { name = true, rgb_fn = true, hsl_fn = true },
		})
	end,
}
