local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
  require 'iabc.nvim-plugins.nvim-snippets',
  require 'iabc.nvim-plugins.friendly-snippets',
  require 'iabc.nvim-plugins.markdown-journal',
  require 'iabc.nvim-plugins.indent-blankline',
  require 'iabc.nvim-plugins.visual-multi',
  require 'iabc.nvim-plugins.silicon',
  require 'iabc.nvim-plugins.vim-rhubarb',
  require 'iabc.nvim-plugins.vim-sleuth',
  require 'iabc.nvim-plugins.copilot',
  require 'iabc.nvim-plugins.floatterm',
  require 'iabc.nvim-plugins.dap',
  require 'iabc.nvim-plugins.nvim-web-devicons',
  require 'iabc.nvim-plugins.monokai',
  require 'iabc.nvim-plugins.onedark',
  require 'iabc.nvim-plugins.catppuccin',
  require 'iabc.nvim-plugins.oh-lucy',
  require 'iabc.nvim-plugins.oceanic-next',
  require 'iabc.nvim-plugins.nord',
  require 'iabc.nvim-plugins.onedark',
  require 'iabc.nvim-plugins.bamboo',
  require 'iabc.nvim-plugins.nvim-base16',
  require 'iabc.nvim-plugins.material',
  require 'iabc.nvim-plugins.nordtheme_vim',
  require 'iabc.nvim-plugins.comment',
  require 'iabc.nvim-plugins.color-picker',
  require 'iabc.nvim-plugins.icon-picker',
  require 'iabc.nvim-plugins.dressing',
  require 'iabc.nvim-plugins.telescope',
  require 'iabc.nvim-plugins.popup',
  require 'iabc.nvim-plugins.telescope-media-files',
  require 'iabc.nvim-plugins.telescope-fzf-native',
  require 'iabc.nvim-plugins.nvim-treesitter',
  -- require 'iabc.nvim-plugins.nvim-ts-context-commentstring',
  require 'iabc.nvim-plugins.glow',
  require 'iabc.nvim-plugins.nvim-bufferline',
  require 'iabc.nvim-plugins.nvim-tree',
  require 'iabc.nvim-plugins.which-key',
  require 'iabc.nvim-plugins.zen-mode',
  require 'iabc.nvim-plugins.obsidian',
  require 'iabc.nvim-plugins.markdown-preview',
  require 'iabc.nvim-plugins.alpha',
  require 'iabc.nvim-plugins.lualine',
  require 'iabc.nvim-plugins.gitsigns',
  require 'iabc.nvim-plugins.nvim-lspconfig',
  require 'iabc.nvim-plugins.nvim-cmp',
  require 'iabc.nvim-plugins.oil',
  require 'iabc.nvim-plugins.lorem',
  require 'iabc.nvim-plugins.url-open',
  require 'iabc.nvim-plugins.overseer',
})


require("telescope").load_extension("media_files")
-- require("Comment").setup {
--   pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
-- }
