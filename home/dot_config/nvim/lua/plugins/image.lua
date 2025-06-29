return {
	"3rd/image.nvim",
	lazy = false, -- or true if you want to load on demand
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("image").setup({
			backend = "kitty", -- or "ueberzug" / "wezterm" / "tycat" etc
			kitty_method = "normal",
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = false,
					filetypes = { "markdown", "vimwiki" },
				},
			},
			max_width = nil,
			max_height = nil,
			max_height_window_percentage = math.huge,
			max_width_window_percentage = math.huge,
			window_overlap_clear_enabled = true, -- experimental
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
		})
	end,
}
