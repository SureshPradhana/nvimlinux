-- Obsidian.nvim
return {
	"epwalsh/obsidian.nvim",
	version = "*",
	ft = "markdown",
	event = {
		"BufReadPre " .. vim.fn.expand("~") .. "/personal/**.md",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/personal",
			}
		},
	},
}
