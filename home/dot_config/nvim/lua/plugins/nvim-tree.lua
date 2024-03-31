return {
	{
		"nvim-tree/nvim-tree.lua",
		-- dependencies = {
		-- 	"nvim-tree/nvim-web-devicons",
		-- },
		opts = {
			view = {
				number = true,
				relativenumber = false,
			},
			renderer = {
				indent_markers = {
					enable = true,
					inline_arrows = true,
					icons = {
						corner = "└",
						edge = "│",
						item = "├",
						bottom = "─",
						none = "│",
					},
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "►",
							arrow_open = "▼",
						},
					},
				},

				highlight_modified = "all",
			},

			modified = {
				enable = true,
				show_on_dirs = true,
				show_on_open_dirs = true,
			},

			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			git = {
				ignore = false,
			},
		},
		-- config = function()
		-- 	local nvimtree = require("nvim-tree")
		-- 	vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeFindFileToggle<CR>")
		-- 	vim.cmd([[highlight NvimTreeIndentMarker guifg=#61afef]])
		-- 	nvimtree.setup()
		-- end,
	},
}
