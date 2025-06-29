return {
	"robitx/gp.nvim",
	event = "VeryLazy",
	config = function()
		require("gp").setup({
			map_keys = false,
			replace_codeblock = true,
			agents = {
				{
					name = "LMStudio",
					provider = "openai",
					chat = true,
					command = true,
					model = { model = "nousresearch.nous-hermes-2-mistral-7b-dpo" }, -- Replace with your LM Studio model name
					system_prompt = "You are a helpful AI assistant.",
				},
			},
			providers = {
				openai = {
					endpoint = "http://localhost:1234/v1/chat/completions",
					secret = "dummy", -- LM Studio doesn't require a real API key
				},
			},
		})
		-- Keymaps with inline descriptions
		local map = vim.keymap.set

		local wk = require("which-key")

		wk.register({
			a = {
				name = "+AI (gp.nvim)",
				c = { "<cmd>GpChatNew float<CR>", "Chat (floating)" },
				e = { ":<C-u>'<,'>GpRewrite<CR>", "Rewrite Selection", mode = "v" },
				o = { ":<C-u>'<,'>GpAppend<CR>", "Append Below", mode = "v" },
				d = { ":<C-u>'<,'>GpPrepend<CR>", "Prepend Above", mode = "v" },
				x = { ":<C-u>'<,'>GpExplain<CR>", "Explain Code", mode = "v" },
				r = { ":<C-u>'<,'>GpImplement<CR>", "Implement Stub", mode = "v" },
				f = { "<cmd>GpChatFinder<CR>", "File-aware Chat" },
				i = {
					function()
						vim.cmd("normal! ggVG")
						vim.cmd("GpRewrite")
					end,
					"Rewrite Entire File",
				},
			},
		}, { prefix = "<leader>" })
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-telescope/telescope.nvim",
	},
}
