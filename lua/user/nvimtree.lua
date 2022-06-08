local nvim_tree_ok, nvim_tree = pcall(require, 'nvim-tree')
if not nvim_tree_ok then
  vim.notify("NvimTree not loaded!")
end

nvim_tree.setup({
  open_on_setup = true,
  hijack_cursor = true,
  update_cwd = true,
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = { hint = "", info = "", warning = "", error = "" }
  },
  view = {
    hide_root_folder = true,
    mappings = {custom_only = true}
  },
  renderer = {
    highlight_git = true,
    indent_markers = {
      enable = true
    },
    icons = {
      git_placement = "after"
    }
  }
})
