return {
  "mrjones2014/smart-splits.nvim",
  lazy = false,
  config = function()
    require("smart-splits").setup({
      multiplexer_integration = "auto", -- autodetect tmux/zellij
    })

 end,
}