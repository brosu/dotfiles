return {
	"folke/which-key.nvim",
	opts = function(_, opts)
		opts.defaults["<leader>q"] = nil
		opts.defaults["<leader>w"] = nil
		return opts
	end,
}
