local colorscheme = "darkplus"
vim.g.vscode_style = "dark"
vim.g.material_theme_style = "darker"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
