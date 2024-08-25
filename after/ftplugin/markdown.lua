vim.opt_local.nu = false
vim.opt_local.spell = true
vim.opt_local.textwidth = 60
vim.opt_local.foldcolumn = "3"

vim.keymap.set("n", "<Leader>=", function()
	vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
	end, { buffer = vim.api.nvim_get_current_buf(), desc = "[lsp] format" })
