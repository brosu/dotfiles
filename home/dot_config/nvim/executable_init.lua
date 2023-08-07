require("br.plugins-setup")
require("br.core.options")
require("br.core.autocmd")
require("br.plugins.lualine")
require("br.plugins.gitsigns")
require("br.plugins.telescope")
require("br.plugins.treesitter")
require("br.plugins.indent-blackline")
require("br.plugins.nvim-tree")
require("br.plugins.lsp.mason")
require("br.plugins.lsp.lspsaga")
require("br.plugins.lsp.lspconfig")
require("br.plugins.lsp.null-ls")
require("br.plugins.auto-session")
require("br.plugins.nvim-cmp")
require("br.plugins.autopairs")
require("br.plugins.iron")
require("br.plugins.dap")
require("br.core.keymaps")
require("br.plugins.which-key")
require("br.plugins.hydra")
require("br.plugins.onedark")

-- Enable Comment.nvim
require("Comment").setup()

-- Setup neovim lua configuration
require("neodev").setup()

-- Turn on lsp status information
require("fidget").setup()
require("neogit").setup()
require("luasnip")
require("todo").setup()
require("glow").setup()
require("toggleterm").setup({
  direction = "float",
})
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
