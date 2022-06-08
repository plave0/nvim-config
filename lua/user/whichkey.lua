
local which_key_statusok, which_key = pcall(require, "which-key")
if not which_key_statusok then
  vim.notify("Which-key failed to load")
end

which_key.setup({
  window = {
    border = "single"
  }
})

which_key.register({
  s = {
    name = "Search",
    f = {"<cmd>Telescope find_files<cr>", "Srach files"},
    l = {"<cmd>Telescope live_grep<cr>", "Live grep"},
    b = {"<cmd>Telescope buffers<cr>", "Srach buffers"},
    h = {"<cmd>Telescope help_tags<cr>", "Srach help"},
    d = {"<cmd>Telescope diagnostic<cr>", "Srach diagnostics"}
  }
})

