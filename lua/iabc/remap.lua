vim.g.mapleader = " "

-- Navigate to next buffer
vim.api.nvim_set_keymap('n', '<leader>n', ':bn<CR>', { noremap = true, silent = true })

-- Navigate to previous buffer
vim.api.nvim_set_keymap('n', '<leader>p', ':bp<CR>', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', '<Leader>n', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
