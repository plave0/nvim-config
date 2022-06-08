local status_ok, nvim_autopair = pcall(require, 'nvim-autopairs')
if not status_ok then
  vim.notify("Vim Autopair not loaded!")
end

nvim_autopair.setup()
