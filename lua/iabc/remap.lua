-- opts
local opts = { noremap = true, silent = true }

-- Set leader key to space
vim.g.mapleader = " "

-- Navigate to next buffer
vim.api.nvim_set_keymap('n', '<leader>h', ':bn<CR>', opts)

-- Navigate to previous buffer
vim.api.nvim_set_keymap('n', '<leader>l', ':bp<CR>', opts)

-- toggle NvimTree
vim.api.nvim_set_keymap('n', '<S-Tab>', ':NvimTreeToggle<CR>', opts)

-- remaps <C-w> with ' (move cursor to Nth window)
vim.keymap.set("n", "'", "<C-w>", opts)


-- moves the selected text when in visjual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)

-- create an executable
vim.keymap.set("n", "<A-x>", ":!chmod +x %<CR>", opts)

-- better indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- set kj as Esc
vim.keymap.set("i", "kj", "<Esc>", opts)
vim.keymap.set("n", "kj", "<Esc>", opts)
vim.keymap.set("v", "kj", "<Esc>", opts)

-- source init.lua
vim.keymap.set("n", "<leader>o", ":source $HOME/.config/nvim/init.lua <CR>", opts)


-- copilot keymaps
vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
}, opts)
vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<C-[>', '<Plug>(copilot-dismiss)', opts)
vim.keymap.set('i', '<M-]>', '<Plug>(copilot-next)', opts)
vim.keymap.set('i', '<M-[>', '<Plug>(copilot-previous)', opts)
vim.keymap.set('i', '<M-\\>', '<Plug>(copilot-suggest)', opts)

-- open parent directory
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' }, opts)


vim.keymap.set("n", "<C-s>", "<cmd>PickColor<cr>", opts)
vim.keymap.set("i", "<C-s>", "<cmd>PickColorInsert<cr>", opts)

-- open url under cursor
vim.keymap.set("n", "<C-u>", ":URLOpenUnderCursor<CR>", opts)
