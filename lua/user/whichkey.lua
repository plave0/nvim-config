
local which_key_statusok, which_key = pcall(require, "which-key")
if not which_key_statusok then
  vim.notify("Which-key failed to load")
end

which_key.setup({
  window = {
    border = "single"
  }
})
