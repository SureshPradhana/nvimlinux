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
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',
  'github/copilot.vim',
  'preservim/nerdtree',
  'voldikss/vim-floaterm',
  'mfussenegger/nvim-dap',
  'nvim-tree/nvim-web-devicons',
  { 'folke/which-key.nvim',          opts = {} },
  --discord presence
  -- 'andweeb/presence.nvim',
  "folke/zen-mode.nvim",
  opts = {
    window = {
      backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
      -- height and width can be:
      -- * an absolute number of cells when > 1
      -- * a percentage of the width / height of the editor when <= 1
      -- * a function that returns the width or the height
      width = 120, -- width of the Zen window
      height = 1,  -- height of the Zen window
      -- by default, no options are changed for the Zen window
      -- uncomment any of the options below, or add other vim.wo options you want to apply
      options = {
        signcolumn = "no",      -- disable signcolumn
        number = false,         -- disable number column
        relativenumber = false, -- disable relative numbers
        cursorline = false,     -- disable cursorline
        cursorcolumn = false,   -- disable cursor column
        foldcolumn = "0",       -- disable fold column
        -- list = false, -- disable whitespace characters
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = "cd app && npm install",
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
  },

  {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end
  },

  { -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  -- Obsidian.nvim
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    ft = "markdown",
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

  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'folke/neodev.nvim',
    },
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
    config =
        function()
          local cmp = require("cmp")
          vim.opt.completeopt = { "menu", "menuone", "noselect" }

          local kind_icons = {
            -- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#basic-customisations
            Text = " ",
            Method = "󰆧",
            Function = "ƒ ",
            Constructor = " ",
            Field = "󰜢 ",
            Variable = " ",
            Constant = " ",
            Class = " ",
            Interface = "󰜰 ",
            Struct = " ",
            Enum = "了 ",
            EnumMember = " ",
            Module = "",
            Property = " ",
            Unit = " ",
            Value = "󰎠 ",
            Keyword = "󰌆 ",
            Snippet = " ",
            File = " ",
            Folder = " ",
            Color = " ",
          }

          cmp.setup({
            snippet = {
              expand = function(args)
                require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
              end,
            },
            window = {
              -- completion = cmp.config.window.bordered(),
              -- documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
              ["<C-b>"] = cmp.mapping.scroll_docs(-4),
              ["<C-f>"] = cmp.mapping.scroll_docs(4),
              ["<C-Space>"] = cmp.mapping.complete(),
              ["<C-e>"] = cmp.mapping.abort(),
              ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
              { name = "nvim_lsp" },
              { name = "nvim_lua" },
              { name = "luasnip" }, -- For luasnip users.
            }, {
              { name = "buffer" },
              { name = "path" },
            }, {
              { name = "neorg" },
            }),

            formatting = {
              format = function(entry, vim_item)
                -- Kind icons
                vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                -- Source
                vim_item.menu = ({
                  buffer = "[Buffer]",
                  nvim_lsp = "[LSP]",
                  luasnip = "[LuaSnip]",
                  nvim_lua = "[NvimAPI]",
                  path = "[Path]",
                })[entry.source.name]
                return vim_item
              end,
            },
          })

          cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
              { name = "path" },
            }, {
              { name = "cmdline" },
            }),
          })
        end
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
    },
  },
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',         opts = {} },

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
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require("toggleterm").setup {
        open_mapping = [[<c-\>]],
        size = 50,
        direction = 'vertical',
        persist_mode = true,
        start_in_insert = true
      }

      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      end

      vim.cmd('autocmd! TermOpen * lua set_terminal_keymaps()')
    end
  },
  --colroschemes
  'tanvirtin/monokai.nvim',
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
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

  -- custom plugins
  -- { import = 'custom.plugins' },

  {}
})
