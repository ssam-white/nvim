function ClearBackground(color)
    vim.cmd.colorscheme(color or "gruvbox")

    local groups = {
        "SignColumn",
        "StatusLine",
        "Normal",
		"NormalFloat",
        "DiagnosticSignError",
		"DiagnosticSignWarn",
		"DiagnosticSignInfo",
		"DiagnosticSignHint",
        -- "Pmenu",
        -- "PmenuSel",
    }

    for _, group in ipairs(groups) do
		local current_hl = vim.api.nvim_get_hl(0, { name = group, link = false })
		local new_hl = vim.tbl_deep_extend('keep', {}, current_hl)
		new_hl.bg = nil
		vim.api.nvim_set_hl(0, group, new_hl)
    end
end

return {
	{ 
		"rose-pine/neovim", 
		name = "rose-pine",
		config = function()
			ClearBackground("rose-pine")
		end
	},
	{
		"bluz71/vim-nightfly-colors",
		name = "nightfly" ,
	},
	{
        'ellisonleao/gruvbox.nvim',
        -- config = function()
        --     ClearBackground()
        -- end
    },
}
