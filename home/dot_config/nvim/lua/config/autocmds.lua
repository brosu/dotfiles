-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*" }, command = "normal zx" }) -- treesitter telescope bug workaround

-- vim.api.nvim_create_autocmd({ "VimEnter" }, { command = 'lua require("persistence").load({ last = true })' })
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { command = "PossessionLoad" })

-- source: https://github.com/goolord/alpha-nvim/blob/main/lua/alpha.lua

local function should_skip_session_load()
	-- don't start when opening a file
	if vim.fn.argc() > 0 then
		return true
	end

	-- Do not open alpha if the current buffer has any lines (something opened explicitly).
	local lines = vim.api.nvim_buf_get_lines(0, 0, 2, false)
	print(lines)
	if #lines > 1 or (#lines == 1 and lines[1]:len() > 0) then
		return true
	end

	-- Skip when there are several listed buffers.
	for _, buf_id in pairs(vim.api.nvim_list_bufs()) do
		local bufinfo = vim.fn.getbufinfo(buf_id)
		if bufinfo.listed == 1 and #bufinfo.windows > 0 then
			return true
		end
	end

	-- Handle nvim -M
	if not vim.o.modifiable then
		return true
	end

	---@diagnostic disable-next-line: undefined-field
	for _, arg in pairs(vim.v.argv) do
		print(arg)
		-- whitelisted arguments
		-- always open
		if arg == "--startuptime" then
			return false
		end

		-- blacklisted arguments
		-- always skip
		if
			arg == "-b"
			-- commands, typically used for scripting
			or arg == "-c"
			or vim.startswith(arg, "+")
			or arg == "-S"
		then
			return true
		end
	end

	-- base case: don't skip
	return false
end

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	group = vim.api.nvim_create_augroup("br", { clear = true }),
	nested = true,
	callback = function()
		print(should_skip_session_load())
		if should_skip_session_load() then
			print("skip")
		else
			print("here")
			require("session_manager").load_current_dir_session(true)
		end
	end,
})
