return {
	"stevearc/conform.nvim",
	event = { "BufWritePre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" }, -- 🔑 add this
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				css = { "prettierd" },
				json = { "prettierd" },
			},
			format_on_save = {
				timeout_ms = 5000,
				lsp_fallback = false, -- 🔑 change this
			},
		})

		vim.api.nvim_create_user_command("Format", function()
			require("conform").format({
				timeout_ms = 5000,
				lsp_fallback = true, -- OK manually
			})
		end, {})
	end,
}
