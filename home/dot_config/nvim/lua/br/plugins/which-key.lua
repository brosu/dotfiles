local setup, whichkey = pcall(require, "which-key")
if not setup then
  return
end
whichkey.setup()

local keymap = {
  -- w = { ":w!<CR>", "save file" }, -- set a single command and text
  -- j = "split args", -- only set a text for an already configured keymap
  -- ["<CR>"] = { "@q", "macro q" }, -- setting a special key
  ["?"] = { "<Cmd>Telescope oldfiles<CR>", "[?] Find recently opened files" },
  ["<space>"] = { "<Cmd>Telescope buffers<CR>", "[ ] Find existing buffers" },
  ["/"] = { "<Cmd>Telescope current_buffer_fuzzy_find<CR>", "[/] Fuzzily search in current buffer]" },
  d = {
    name = "Debug",
    b = { "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle [B]reakpoint" },
    -- nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
    -- nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
    -- nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
    -- nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
    -- nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
    -- nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
    -- nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
    -- nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
    -- nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
  },
  -- q = "diagnostic locations",
  e = { "<Cmd>NvimTreeFocus<CR>", "Toggle file [E]xplorer" },
  s = {
    name = "[S]earch / [S]plit",
    e = { "<Cmd>Telescope help_tags<CR>", "[S]earch h[E]lp" },
    w = { "<Cmd>Telescope grep_string<CR>", "[S]earch current [W]ord" },
    g = { "<Cmd>Telescope live_grep<CR>", "[S]earch by [G]rep" },
    d = { "<Cmd>Telescope diagnostics<CR>", "[S]earch [D]iagnostics" },
    f = { "<Cmd>Telescope find_files<CR>", "[S]earch [F]iles" },
    v = { "<C-w>v", "[S]plit [V]ertically" },
    h = { "<C-w>s", "[S]plit [H]orizontally" },
    ["="] = { "<C-w>=", "[S]plit equally" },
    x = { "<Cmd>close<CR>", "[S]plit close" },
    m = { ":MaximizerToggle<CR>", "[M]aximize" },
  },
  t = {
    x = { "<Cmd>tabclose<CR>", "[T]ab close" },
    o = { "<Cmd>tabclose<CR>", "[T]ab [O]pen new" },
    n = { "<Cmd>tabn<CR>", "[T]ab [N]ext" },
    p = { "<Cmd>tabp<CR>", "[T]ab [P]revious" },
  },
  f = { -- set a nested structure
    name = "+find",
    b = { "<Cmd>Telescope buffers<CR>", "buffers" },
    h = { "<Cmd>Telescope help_tags<CR>", "help tags" },
    c = {
      name = "+commands",
      c = { "<Cmd>Telescope commands<CR>", "commands" },
      h = { "<Cmd>Telescope command_history<CR>", "history" },
    },
    q = { "<Cmd>Telescope quickfix<CR>", "quickfix" },
  },
  -- g = { "<CMD>Git<CR>", "Git" },
  q = { "<CMD>q<CR>", "Buffer" },
  Q = { "<CMD>qa<CR>", "vi" },
  w = { "<CMD>w<CR>", "Write" },
  r = {
    name = "Run",
    f = { "<Cmd>RunFile<CR>", "file" },
  },
}
function setFugitiveDocs()
  whichkey.register({
    c = "Commit",
    s = "Stage",
    u = "Unstage",
    ["-"] = "Toggle stage",
    U = "Unstage everything",
    X = "Discard change",
    ["="] = "Toggle inline diff",
    [">"] = "Insert inline diff",
    ["<"] = "Remove inline diff",
    I = "Patch insert",
    P = "Patch reset",
    d = {
      name = "Diff",
      d = "Diff split",
      v = "Diff split vertically",
      s = "Diff split horizontally",
      h = "Diff split horizontally",
      q = "Diff close",
      ["?"] = "Diff help",
    },
    o = "Open in new split",
    O = "Open in new tab",
    p = "preview",
    C = "Show in commit",
    ["("] = "Previous ...",
    [")"] = "Next...",
    i = "Expand next",
    ["["] = {
      name = "Previous",
      c = "Hunk",
      ["/"] = "File",
      ["m"] = "File",
      ["["] = "Section",
      ["]"] = "Section end",
    },
    ["]"] = {
      name = "Next",
      c = "Hunk",
      ["/"] = "File",
      ["m"] = "File",
      ["["] = "Section forward",
      ["]"] = "Section",
    },
  })
end
vim.cmd("autocmd FileType fugitive lua setFugitiveDocs()")
whichkey.register(keymap, {
  prefix = "<leader>",
})
