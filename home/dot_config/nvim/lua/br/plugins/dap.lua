local setup, dap_python = pcall(require, "dap-python")
if not setup then
  print("Warn: could not load dap-python")
  return
end

dap_python.setup("~/.virtualenvs/debugpy/bin/python")
local vscode_setup, dap_vscode = pcall(require, "dap.ext.vscode")
if vscode_setup then
  dap_vscode.load_launchjs(nil, { cppdbg = { "c", "cpp" } })
else
  print("Warn: could not load dap.ext.vscode")
end
