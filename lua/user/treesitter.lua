local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
	vim.notify("Failed to load nvim-treesiter")
	return
end
treesitter.setup {
	highlight = { enable = true }
}


