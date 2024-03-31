return {
	"nvim-telescope/telescope.nvim",
	keys = {
		{
			"<leader><space>",
			"<Cmd>Telescope buffers<CR>",
			desc = "Find buffers",
		},
	},
	opts = {
		defaults = {
			file_ignore_patterns = {
				"^dotbot*",
			},
			mappings = {
				i = {
					["<C-u>"] = false,
					["<C-x>"] = "delete_buffer",
				},
				n = {
					["x"] = "delete_buffer",
				},
			},
		},
	},
}
