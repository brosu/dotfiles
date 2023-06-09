local setup, telescope = pcall(require, "telescope")
if not setup then
  return
end

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
telescope.setup({
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
})

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")
