return {
	'MeanderingProgrammer/render-markdown.nvim',
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
	dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	config = function()
		require('render-markdown').setup({
			heading = {
				border = true,
				icons = { "◉", "○", "✸", "✿" },
				left_pad = 1,
				right_pad = 1,
				-- backgrounds = {
				-- 	"clear", "clear", "clear", "clear", "clear", "clear"
				-- },
				foregrounds = {
					'RenderMarkdownH1',
					'RenderMarkdownH2',
					'RenderMarkdownH3',
					'RenderMarkdownH4',
					'RenderMarkdownH5',
					'RenderMarkdownH6',
				},
			},
			code = {
				language_pad = 1,
				width = "block",
				left_pad = 1,
				right_pad = 1,
				sign = false,
			},
			bullet = {

				icons = { '•', '◦', '⬩', '◇' },
			},
			sign = {
				enabled = true,
			}
		})
	end,
}
