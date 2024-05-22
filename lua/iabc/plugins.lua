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
  require 'lua.iabc.nvim-plugins.nvim-snippets',
  require 'lua.iabc.nvim-plugins.friendly-snippets',
  require 'lua.iabc.nvim-plugins.markdown-journal',
  require 'lua.iabc.nvim-plugins.indent-blankline',
  require 'lua.iabc.nvim-plugins.visual-multi',
  require 'lua.iabc.nvim-plugins.silicon',
  require 'lua.iabc.nvim-plugins.vim-rhubarb',
  require 'lua.iabc.nvim-plugins.vim-sleuth',
  require 'lua.iabc.nvim-plugins.copilot',
  require 'lua.iabc.nvim-plugins.floatterm',
  require 'lua.iabc.nvim-plugins.dap',
  require 'lua.iabc.nvim-plugins.nvim-web-devicons',
  require 'lua.iabc.nvim-plugins.monokai',
  require 'lua.iabc.nvim-plugins.onedark',
  require 'lua.iabc.nvim-plugins.catppuccin',
  require 'lua.iabc.nvim-plugins.oh-lucy',
  require 'lua.iabc.nvim-plugins.oceanic-next',
  require 'lua.iabc.nvim-plugins.nord',
  require 'lua.iabc.nvim-plugins.onedark',
  require 'lua.iabc.nvim-plugins.nvim-base16',
  require 'lua.iabc.nvim-plugins.material',
  require 'lua.iabc.nvim-plugins.nordtheme_vim',
  require 'lua.iabc.nvim-plugins.comment',
  require 'lua.iabc.nvim-plugins.color-picker',
  require 'lua.iabc.nvim-plugins.icon-picker',
  require 'lua.iabc.nvim-plugins.dressing',
  require 'lua.iabc.nvim-plugins.telescope',
  require 'lua.iabc.nvim-plugins.popup',
  require 'lua.iabc.nvim-plugins.telescope-media-files',
  require 'lua.iabc.nvim-plugins.telescope-fzf-native',
  require 'lua.iabc.nvim-plugins.nvim-treesitter',
  require 'lua.iabc.nvim-plugins.nvim-ts-context-commentstring',
  require 'lua.iabc.nvim-plugins.glow',
  require 'lua.iabc.nvim-plugins.nvim-bufferline',
  require 'lua.iabc.nvim-plugins.nvim-tree',
  require 'lua.iabc.nvim-plugins.which-key',
  require 'lua.iabc.nvim-plugins.zen-mode',
  require 'lua.iabc.nvim-plugins.obsidian',
  require 'lua.iabc.nvim-plugins.markdown-preview',
  require 'lua.iabc.nvim-plugins.alpha',
  require 'lua.iabc.nvim-plugins.lualine',
  require 'lua.iabc.nvim-plugins.gitsigns',
  require 'lua.iabc.nvim-plugins.nvim-lspconfig',
  require 'lua.iabc.nvim-plugins.nvim-cmp',
})


require("telescope").load_extension("media_files")
require("Comment").setup {
  pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
}
