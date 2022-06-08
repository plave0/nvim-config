local status_ok, telesope = pcall(require, "telescope")
if not status_ok then
  vim.notify("Telescope failed to load")
end

telesope.setup({})
