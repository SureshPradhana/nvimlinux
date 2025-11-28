-- Obsidian.nvim
return {
	"epwalsh/obsidian.nvim",
	version = "*",
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
