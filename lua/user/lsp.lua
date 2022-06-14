local status_ok, lsp_installer, lspconfig, lsp_settings
status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
		vim.notify("nvim-lsp-installer could not load")
	return
end

status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
		vim.notify("lspconfig could not load")
	return
end

status_ok, lsp_settings = pcall(require, "user.lsp_settings")
if not status_ok then
		vim.notify("lsp settings could not load")
	return
end

local on_attach = function(_,bufnr)

	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gl",
		'<cmd>lua vim.diagnostic.open_float()<CR>', opts)
end


for _,server in ipairs(lsp_installer.get_installed_servers()) do

  if server.name == "sumneko_lua" then

    lspconfig[server.name].setup({
       on_attach = on_attach,
       settings = lsp_settings.lua_settings
     })

  else

    lspconfig[server.name].setup({
      on_attach = on_attach,
      settings = lsp_settings.default_settings
    })

  end

end
