return {
	"vyfor/cord.nvim",
	build = ":Cord update",
	config = function()
		require("cord").setup({
			editor = {
				tooltip = "Sometimes dumb text editor",
			},

			display = {
				theme = "classic",
				swap_fields = true,
			},

			idle = {
				tooltip = "Doing something irl (maybe)",
			},

			advanced = {
				workspace = {
					limit_to_cwd = true,
				},
			},
		})
	end,
}
