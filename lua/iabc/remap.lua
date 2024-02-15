local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Navigate to next buffer
vim.api.nvim_set_keymap('n', '<leader>n', ':bn<CR>', { noremap = true, silent = true })

-- Navigate to previous buffer
vim.api.nvim_set_keymap('n', '<leader>p', ':bp<CR>', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', '<Leader>n', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

-- remaps <C-w> with ' (move cursor to Nth window)
vim.keymap.set("n", "'", "<C-w>", opts)


-- moves the selected text when in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)

-- create an executable
vim.keymap.set("n", "<A-x>", ":!chmod +x %<CR>", opts)


-- better indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
