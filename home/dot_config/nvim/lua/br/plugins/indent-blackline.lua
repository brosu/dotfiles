local setup, indent_blackline = pcall(require, "indent_blackline")
if not setup then
  return
end

indent_blackline.setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}
