-- set leader key to space
vim.g.mapleader = " "
local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
-- keymap.set("i", "jk", "<ESC>")

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
-- keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
keymap.set("n", ",", "<CMD>WhichKey<CR>")

-- Remap for dealing with word wrap
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

keymap.set("n", "<leader>w", "<cmd>w<cr><esc>", { desc = "Save file" })
keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<cr>", { desc = "Toggle file explorer" })

keymap.set("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Quit all" })

keymap.del("n", "<leader>qq")

keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "quit window" })

keymap.set("n", "<leader>t", "<cmd>TREPLSendLine<cr>", { desc = "Execute line" })
keymap.set("v", "<leader>t", "<cmd>TREPLSendSelection<cr>", { desc = "Execute selection" })

keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })

-- -- place this in one of your configuration file(s)
-- local hop = require("hop")
-- local directions = require("hop.hint").HintDirection
-- vim.keymap.set("", "f", function()
--   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
-- end, { remap = true })
-- vim.keymap.set("", "F", function()
--   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
-- end, { remap = true })
-- vim.keymap.set("", "t", function()
--   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
-- end, { remap = true })
-- vim.keymap.set("", "T", function()
--   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
-- end, { remap = true })

-- Diagnostic keymaps
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
-- vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
