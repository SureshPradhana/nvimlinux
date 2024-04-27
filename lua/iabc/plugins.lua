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
  'taylorskalyo/markdown-journal',
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  "mg979/vim-visual-multi",

  {
    'krivahtoo/silicon.nvim',
    build = "./install.sh"
  },
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',
  'github/copilot.vim',
  'voldikss/vim-floaterm',
  'mfussenegger/nvim-dap',
  'nvim-tree/nvim-web-devicons',
  {
    "neoclide/coc.nvim",
    branch = "release",
  },
  {
    'tanvirtin/monokai.nvim' },
  {
    'navarasu/onedark.nvim',
  },
  {
    "catppuccin/nvim", name = "catppuccin"
  },
  { 'Yazeed1s/oh-lucy.nvim' },
  'mhartington/oceanic-next',
  'shaunsingh/nord.nvim',
  'navarasu/onedark.nvim',
  'RRethy/nvim-base16',
  'kaicataldo/material.vim',
  'nordtheme/vim',
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },

  -- color picker
  {
    "ziontee113/color-picker.nvim",
    config = function()
      require("color-picker")
    end,
  },

  -- icon picker
  {
    "ziontee113/icon-picker.nvim",
    config = function()
      require("icon-picker").setup({ disable_legacy_commands = true })

      local opts = { noremap = true, silent = true }

      vim.keymap.set("n", "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>", opts)
      vim.keymap.set("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
      vim.keymap.set("n", "<A-i>", "<cmd>IconPickerInsert<cr>", opts)
    end
  },

  {
    'stevearc/dressing.nvim',
  },
  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ":TSUpdate",
  },

  -- glow for markdown preview
  { "ellisonleao/glow.nvim",         config = true, cmd = "Glow" },

  {
    'akinsho/nvim-bufferline.lua',
    version = '*',
  },

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {

      }
    end,
  },

  { 'folke/which-key.nvim', opts = {} },
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        backdrop = 0.95,
        width = 120,
        height = 1,
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
          cursorline = false,
          cursorcolumn = false,
          foldcolumn = "0",
        },
      },
    },
  },

  -- Obsidian.nvim
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    ft = "markdown",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "Obsidian-linux",
          path = "~/Obsidian-linux",
        },
      },
    },
  },

  {
    "SureshPradhana/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    build = "cd app && npm install && git restore .",

  },

  {
    'goolord/alpha-nvim',
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end
  },

  { -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'gruvbox',
        component_separators = '|',
        section_separators = '',
      },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    }
  },
})

local bufferline = require("bufferline");
require('bufferline').setup {
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
        local sym = e == "error" and " "
            or (e == "warning" and " " or "")
        s = s .. n .. sym
      end
      return s
    end,
  }
}

require('silicon').setup({
  font = 'Hack Nerd Font Mono=16',
  theme = 'Monokai Extended',
  output = {
    path = "/home/suresh/linuxshare/snapShots/",
  },
})
