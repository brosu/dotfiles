local setup, iron = pcall(require, "iron.core")
if not setup then
  return
end

iron.setup({
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = true,
    -- Your repl definitions come here
    repl_definition = {
      sh = {
        -- Can be a table or a function that
        -- returns a table (see below)
        command = { "zsh" },
      },
    },
    -- How the repl window will be displayed
    -- See below for more information
    repl_open_cmd = require("iron.view").bottom(40),
  },
  -- Iron doesn't set keymaps by default anymore.
  -- You can set them here or manually add keymaps to the functions in iron.core
  keymaps = {
    send_motion = "<space>rc",
    visual_send = "<space>rc",
    -- send_file = "<space>rf",
    send_line = "<space>rl",
    send_mark = "<space>rm",
    mark_motion = "<space>rc",
    mark_visual = "<space>rc",
    remove_mark = "<space>rd",
    cr = "<space>r<cr>",
    interrupt = "<space>r<space>",
    exit = "<space>rq",
    clear = "<space>cl",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true,
  },
  ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
})
