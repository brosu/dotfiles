return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				sh = { "beautysh" },
			},
			formatters = {
				beautysh = {
					prepend_args = { "--indent-size", "2" },
				},
			},
		},
	},
}
