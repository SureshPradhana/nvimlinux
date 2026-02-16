--custom settings
local set = vim.opt
local g = vim.g

-- Set highlight on search
set.hlsearch = true
set.incsearch = true

-- Make line numbers default
set.number = true         --line numbers

set.relativenumber = true --relative line numbers

-- Enable mouse mode
set.mouse = 'a'
set.tabstop = 4
set.shiftwidth = 4
set.scrolloff = 8
set.textwidth = 96

-- Sync clipboard between OS and Neovim.
set.clipboard:append('unnamedplus')

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
-- set.updatetime = 250
-- set.timeout = true
-- set.timeoutlen = 300

-- Set completeopt to have a better completion experience
set.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
set.termguicolors = true

-- set fillchars=eob: ' ' to remove ~ at the end of the buffer
vim.o.fillchars = vim.o.fillchars .. 'eob: '

-- font settings
-- g.WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = ''
-- g.WebDevIconsUnicodeDecorateFolderNodes = 1
-- g.DevIconsEnableFoldersOpenClose = 1
-- g.DevIconsEnableFolderPatternMatching = 1

-- Remove vertical split indicator
vim.cmd [[set fillchars+=vert:\ ]] -- Set the vertical split character to a space


-- autoformat on save is handled by conform.nvim (see `lua/iabc/nvim-plugins/conform.lua`)
-- This avoids running multiple formatters on every save, which was slowing down `:w` and
-- could cause timeouts. If you want LSP-only format-on-save instead of conform,
-- you can add a single BufWritePre autocmd here, but don't duplicate it.

-- set floaterm keymaps
g.floaterm_keymap_toggle = '<leader>\\'
g.floaterm_keymap_new = '<leader>t'
g.floaterm_keymap_next = '<leader>n'
g.floaterm_keymap_prev = '<leader>p'
