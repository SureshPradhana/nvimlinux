
--custom settings
local set = vim.opt


-- Set highlight on search
set.hlsearch = false
set.incsearch = true

-- Make line numbers default
set.number = true

set.relativenumber = true --relative line numbers

-- Enable mouse mode
set.mouse = 'a'
set.tabstop = 4
set.shiftwidth = 4
set.scrolloff = 8
set.textwidth = 96



-- Sync clipboard between OS and Neovim.
set.clipboard = 'unnamedplus'

-- Enable break indent
set.breakindent = true

-- Save undo history
set.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
set.ignorecase = true
set.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
set.updatetime = 250
set.timeout = true
set.timeoutlen = 300


-- show hidden files
vim.g.NERDTreeShowHidden = 1

-- Set completeopt to have a better completion experience
set.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
set.termguicolors = true


vim.o.fillchars = vim.o.fillchars .. 'eob: '

-- font settings
-- vim.g.WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = ''
-- vim.g.WebDevIconsUnicodeDecorateFolderNodes = 1
-- vim.g.DevIconsEnableFoldersOpenClose = 1
-- vim.g.DevIconsEnableFolderPatternMatching = 1

-- Remove vertical split indicator
vim.cmd [[set fillchars+=vert:\ ]]  -- Set the vertical split character to a space



-- autoformat on save
local fmtGroup = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	group = fmtGroup,
	pattern = { "*.lua", "*.go", "*.html", "*.rs", "*.json", "*.py","*.astro","*.js",".ts" },
	command = "lua vim.lsp.buf.format({ async = false })",
})
