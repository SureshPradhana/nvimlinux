
--custom settings


-- Set highlight on search
vim.o.hlsearch = false
vim.o.incsearch = true

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300


-- show hidden files
vim.g.NERDTreeShowHidden = 1

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true


vim.o.fillchars = vim.o.fillchars .. 'eob: '

-- font settings
-- vim.g.WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = ''
-- vim.g.WebDevIconsUnicodeDecorateFolderNodes = 1
-- vim.g.DevIconsEnableFoldersOpenClose = 1
-- vim.g.DevIconsEnableFolderPatternMatching = 1

-- Remove vertical split indicator
vim.cmd [[set fillchars+=vert:\ ]]  -- Set the vertical split character to a space
