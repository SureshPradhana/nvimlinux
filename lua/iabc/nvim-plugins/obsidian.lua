-- Obsidian.nvim
return {
	"epwalsh/obsidian.nvim",
	version = "*",
	ft = "markdown",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "Obsidian-linux",
				path = "~/Obsidian-linux",
			},
		},
	},
}
