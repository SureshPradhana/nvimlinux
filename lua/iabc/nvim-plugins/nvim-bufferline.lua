return {
	'akinsho/nvim-bufferline.lua',
	version = '*',
	event = "VeryLazy",
	config = function()
		-- Plugin configuration
		local bufferline = require("bufferline")
		bufferline.setup {
			options = {
				mode = "buffers", -- set to "tabs" to only show tabpages instead
				diagnostics = "nvim_lsp",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true -- use a "true" to enable the default, or set your own character
					}
				},
				separator_style = "thin",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and " " or (e == "warning" and " " or "")
						s = s .. n .. sym
					end
					return s
				end,
			}
		}
	end,
}


-- local bufferline = require("bufferline");
-- require('bufferline').setup {
--   options = {
--     mode = "buffers", -- set to "tabs" to only show tabpages instead
--     diagnostics = "nvim_lsp",
--     offsets = {
--       {
--         filetype = "NvimTree",
--         text = "File Explorer",
--         highlight = "Directory",
--         separator = true -- use a "true" to enable the default, or set your own character
--       }
--     },
--     separator_style = "thin",
--     diagnostics_indicator = function(count, level, diagnostics_dict, context)
--       local s = " "
--       for e, n in pairs(diagnostics_dict) do
--         local sym = e == "error" and " "
--             or (e == "warning" and " " or "")
--         s = s .. n .. sym
--       end
--       return s
--     end,
--   }
-- }
