
local which_key_statusok, which_key = pcall(require, "which-key")
if not which_key_statusok then
  vim.notify("Which-key failed to load")
end

which_key.setup({
  window = {
    border = "single"
  }
})

local set_telescope_keys = function()
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
end

local set_nvim_tree_keys = function()
  which_key.register({
      e = {"<cmd>NvimTreeToggle<cr>", "Toggle file explorer"},
    }, {mode = "n", prefix = "<leader>"})
end

local set_git_signs_keys = function()
  which_key.register({
      h = {
        n = {"<cmd>Gitsigns next_hunk<cr>", "Next hunk"},
        p = {"<cmd>Gitsigns prev_hunk<cr>", "Prev hunk"},
        h = {"<cnd>Gitsigns preview_hunk<cr>", "Preview hunk"}
      }
  }, {mode = "n", prefix = "<leader>"} )
end

set_telescope_keys()
set_nvim_tree_keys()
set_git_signs_keys()


