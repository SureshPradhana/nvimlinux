return {
	"stevearc/conform.nvim",
	event = { "BufWritePre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				css = { "prettierd" },
				json = { "prettierd" },
			},
			format_on_save = {
				lsp_fallback = true,
			},
		})
		vim.api.nvim_create_user_command("Format", function()
			require("conform").format({ lsp_fallback = true })
		end, {})
	end,
}
