return {
	"GeorgesAlkhouri/nvim-aider",
	cmd = "Aider",
	keys = {
		{ "<leader>aa", "<cmd>Aider toggle<CR>", desc = "Aider: Toggle chat terminal" },
		{ "<leader>as", "<cmd>Aider send<CR>", desc = "Aider: Send selection", mode = { "n", "v" } },
		{ "<leader>ab", "<cmd>Aider buffer<CR>", desc = "Aider: Send full buffer" },
		{ "<leader>a+", "<cmd>Aider add<CR>", desc = "Aider: Add current file to context" },
		{ "<leader>a-", "<cmd>Aider drop<CR>", desc = "Aider: Drop current file from context" },
		{ "<leader>ar", "<cmd>Aider add readonly<CR>", desc = "Aider: Add as read-only" },
		{ "<leader>aR", "<cmd>Aider reset<CR>", desc = "Aider: Reset session" },
	},
	dependencies = {
		"folke/snacks.nvim", -- Required for UI
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("nvim-aider").setup({
			auto_manage_context = true,
			default_bindings = false, -- we define our own keymaps
			debug = false,
			ignore_buffers = {
				"^term:",
				"NeogitConsole",
				"NvimTree_",
				"neo-tree filesystem",
			},
			border = {
				style = "rounded",
				color = "#fab387",
			},
		})
	end,
}
