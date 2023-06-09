local setup, autosession = pcall(require, "auto-session")
if not setup then
  return
end

autosession.setup({
  log_level = "error",
  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
})
