--custom settings
local set = vim.opt
local g = vim.g


-- Set highlight on search
set.hlsearch = false
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
set.updatetime = 250
set.timeout = true
set.timeoutlen = 300


-- show hidden files
g.NERDTreeShowHidden = 1

-- Set completeopt to have a better completion experience
set.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
set.termguicolors = true


vim.o.fillchars = vim.o.fillchars .. 'eob: '

-- font settings
-- g.WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = ''
-- g.WebDevIconsUnicodeDecorateFolderNodes = 1
-- g.DevIconsEnableFoldersOpenClose = 1
-- g.DevIconsEnableFolderPatternMatching = 1

-- Remove vertical split indicator
vim.cmd [[set fillchars+=vert:\ ]] -- Set the vertical split character to a space



-- autoformat on save
local fmtGroup = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	group = fmtGroup,
	pattern = { "*.svelte", "*.scss", "*.less", "*.sass", "*.css", "*.md", "*.markdown", "*.lua", "*.go", "*.html", "*.rs", "*.json", "*.py", "*.astro", "*.js", "*.ts" },
	command = "lua vim.lsp.buf.format({ async = false })",
})


g.floaterm_keymap_toggle = '<leader>\\'
g.floaterm_keymap_new = '<leader>t'
g.floaterm_keymap_next = '<leader>n'
g.floaterm_keymap_prev = '<leader>p'
-- Define a function to toggle the floatterm
function ToggleFloatTerm()
	g.floaterm_keymap_toggle = '<leader>\\'
end

function NewFloatTerm()
	g.floaterm_keymap_new = '<leader>t'
end

function NextFloatTerm()
	g.floaterm_keymap_next = '<leader>n'
end

function PrevFloatTerm()
	g.floaterm_keymap_prev = '<leader>p'
end

g.coc_global_extensions = { 'coc-svelte', 'coc-json', 'coc-git', 'coc-html', 'coc-emmet', 'coc-pairs',
	'coc-html-css-support', 'coc-json', 'coc-deno', 'coc-css', 'coc-tsserver', '@yaegassy/coc-intelephense',
	'coc-snippets', 'coc-svelte' }

