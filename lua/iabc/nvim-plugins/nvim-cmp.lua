return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
		"dnnr1/lorem-ipsum.nvim", -- 👈 Add this line
	},
	config =
		function()
			local cmp = require("cmp")
			vim.opt.completeopt = { "menu", "menuone", "noselect" }

			local kind_icons = {
				-- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#basic-customisations
				Text = " ",
				Method = "󰆧",
				Function = "ƒ ",
				Constructor = " ",
				Field = "󰜢 ",
				Variable = " ",
				Constant = " ",
				Class = " ",
				Interface = "󰜰 ",
				Struct = " ",
				Enum = "了 ",
				EnumMember = " ",
				Module = "",
				Property = " ",
				Unit = " ",
				Value = "󰎠 ",
				Keyword = "󰌆 ",
				Snippet = " ",
				File = " ",
				Folder = " ",
				Color = " ",
			}


			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				view = {
					entries = {
						follow_cursor = true,
					}
				},

				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "luasnip" }, -- For luasnip users.
					{ name = "lorem_ipsum" },
				}, {
					{ name = "buffer" },
					{ name = "path" },
				}, {
					{ name = "neorg" },
				})
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end
}
