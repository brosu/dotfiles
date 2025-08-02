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

-- keymap.set({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>")
-- keymap.set({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>")
-- keymap.set({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>")
-- keymap.set({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>")
-- keymap.set({ "n", "t" }, "<C-p>", "<CMD>NavigatorPrevious<CR>")

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

local ss = require("smart-splits")
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Pane navigation
map("n", "<C-h>", ss.move_cursor_left, opts)
map("n", "<C-j>", ss.move_cursor_down, opts)
map("n", "<C-k>", ss.move_cursor_up, opts)
map("n", "<C-l>", ss.move_cursor_right, opts)

-- Resize splits using Alt
map("n", "<M-h>", ss.resize_left, opts)
map("n", "<M-j>", ss.resize_down, opts)
map("n", "<M-k>", ss.resize_up, opts)
map("n", "<M-l>", ss.resize_right, opts)