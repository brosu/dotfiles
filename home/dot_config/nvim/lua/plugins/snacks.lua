return {
	"folke/snacks.nvim",
	opts = {
		terminal = {
			win = {
				position = "float",
				keys = {
					term_normal = {
						"<esc><esc>",
						function()
							return "<C-\\><C-n>"
						end,
						mode = "t",
						expr = true,
						desc = "Double escape to normal mode",
					},
					q = "hide",
				},
			},
		},
	},
}
