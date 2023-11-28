-- auto install packer if not installed
-- https://github.com/josean-dev/dev-environment-files/blob/main/.config/nvim/lua/josean/plugins-setup.lua
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local array_concat = function(...)
  local t = {}
  for n = 1, select("#", ...) do
    local arg = select(n, ...)
    if type(arg) == "table" then
      for _, v in ipairs(arg) do
        t[#t + 1] = v
      end
    else
      t[#t + 1] = arg
    end
  end
  return t
end

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

local supporting_plugins = {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use
  "sindrets/diffview.nvim",
}

local navigation_plugins = {
  "christoomey/vim-tmux-navigator", -- tmux & split window navigation
  "szw/vim-maximizer", -- maximizes and restores current window
  "akinsho/toggleterm.nvim",
  "nvim-tree/nvim-tree.lua", -- file explorer
  -- "easymotion/vim-easymotion",
  -- "justinmk/vim-sneak",
  "smoka7/hop.nvim",
}

local autocomplete_plugins = {
  "hrsh7th/cmp-path", -- source for file system path
  "hrsh7th/nvim-cmp",
  "ekalinin/Dockerfile.vim",
}

local edit_plugins = {
  "tpope/vim-surround", -- add, delete, change surroundings (it's awesome,
  "windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
  "numToStr/Comment.nvim", -- "gc" to comment visual regions/lines
  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
}

local lsp_plugins = {
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "jose-elias-alvarez/null-ls.nvim",
  "jay-babu/mason-null-ls.nvim",
  "j-hui/fidget.nvim", -- Useful status updates for LSP
  "folke/neodev.nvim", -- Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "glepnir/lspsaga.nvim",
  "jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
  "onsails/lspkind.nvim", -- vs-code like icons for autocompletion
  "mfussenegger/nvim-jdtls",
}

local integration_plugins = {
  "rmagatti/auto-session",
  "AmeerTaweel/todo.nvim",
  "vigemus/iron.nvim", -- Interactive Repls Over Neovim
  -- "puremourning/vimspector",
  "mfussenegger/nvim-dap",
  "mfussenegger/nvim-dap-python",
  "rcarriga/nvim-dap-ui",
  "theHamsta/nvim-dap-virtual-text",
  "CRAG666/code_runner.nvim",
}

local visual_plugins = {
  "nvim-tree/nvim-web-devicons",
  "folke/which-key.nvim",
  "anuvyklack/hydra.nvim",
  "navarasu/onedark.nvim", -- Theme inspired by Atom
  "nvim-lualine/lualine.nvim", -- Fancier statusline
  "lukas-reineke/indent-blankline.nvim", -- Add indentation guides even on blank lines
  "ellisonleao/glow.nvim", -- preview markdown
  -- "anuvyklack/pretty-fold.nvim"
  -- kevinhwang91/nvim-ufo
  -- https://github.com/wookayin/dotfiles/blob/master/nvim/lua/config/git.lua
  -- https://github.com/mrjones2014/legendary.nvim
}

local plugin_list = array_concat(
  supporting_plugins,
  navigation_plugins,
  autocomplete_plugins,
  edit_plugins,
  integration_plugins,
  visual_plugins,
  lsp_plugins
)

-- add list of plugins to install
return packer.startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")
  for _, value in ipairs(plugin_list) do
    use(value)
    -- print(value)
  end

  use({ -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    run = function()
      pcall(require("nvim-treesitter.install").update({ with_sync = true }))
    end,
  })

  use({ -- Additional text objects via treesitter
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
  })

  -- Git related plugins
  use("tpope/vim-fugitive")
  use("TimUntersberger/neogit")
  use("tpope/vim-rhubarb")
  use("lewis6991/gitsigns.nvim")
  use("idanarye/vim-merginal")

  -- Fuzzy Finder (files, lsp, etc)
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { "nvim-lua/plenary.nvim" } })

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable("make") == 1 })

  if packer_bootstrap then
    require("packer").sync()
  end
end)
