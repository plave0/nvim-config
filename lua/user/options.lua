local o = vim.opt

o.backup = false
o.swapfile = false
o.path = ".,,"
o.termguicolors = true
o.shiftwidth = 2
o.expandtab = true
o.tabstop = 2
o.number = true
o.wrap = false
o.smartindent = true
o.ignorecase = true
o.showtabline = 2
o.signcolumn = "yes"
o.updatetime = 200

o.splitbelow = true
o.splitright = true

o.fileencoding = "utf-8"
o.clipboard = "unnamedplus"
o.mouse = "a"

-- vim.diagnostics fonfiguration
local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

local diag_conf = {
		virtual_text = false,
		signs = {
      active = signs,
    },
		float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
		}
}

vim.diagnostic.config(diag_conf)

