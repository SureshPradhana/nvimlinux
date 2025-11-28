return { -- Set lualine as statusline
	'nvim-lualine/lualine.nvim',
	event = "VeryLazy",
	opts = {
		options = {
			icons_enabled = false,
			theme = 'gruvbox',
			component_separators = '|',
			section_separators = '',
		},
	},
	dependencies = { 'nvim-tree/nvim-web-devicons' }
}
