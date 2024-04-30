-- LSP settings.
-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

-- A helper function to define mappings more concisely
local function set_lsp_keymaps(bufnr)
  local lsp_buf = vim.lsp.buf
  local telescope_builtin = require('telescope.builtin')
  local keymap = vim.keymap.set
  local opts = { buffer = bufnr, desc = "LSP" }

  -- Define key mappings and their corresponding actions
  local mappings = {
    ['<leader>rn'] = { lsp_buf.rename, 'Rename' },
    ['<leader>ca'] = { lsp_buf.code_action, 'Code Action' },
    ['gd'] = { lsp_buf.definition, 'Goto Definition' },
    ['gr'] = { telescope_builtin.lsp_references, 'Goto References' },
    ['gI'] = { lsp_buf.implementation, 'Goto Implementation' },
    ['<leader>D'] = { lsp_buf.type_definition, 'Type Definition' },
    ['<leader>ds'] = { telescope_builtin.lsp_document_symbols, 'Document Symbols' },
    ['<leader>ws'] = { telescope_builtin.lsp_dynamic_workspace_symbols, 'Workspace Symbols' },
    ['K'] = { lsp_buf.hover, 'Hover Documentation' },
    ['<C-k>'] = { lsp_buf.signature_help, 'Signature Help' },
    ['gD'] = { lsp_buf.declaration, 'Goto Declaration' },
    ['<leader>wa'] = { lsp_buf.add_workspace_folder, 'Add Workspace Folder' },
    ['<leader>wr'] = { lsp_buf.remove_workspace_folder, 'Remove Workspace Folder' },
    ['<leader>wl'] = { function() print(vim.inspect(lsp_buf.list_workspace_folders())) end, 'List Workspace Folders' }
  }

  -- Apply all mappings
  for keys, action_desc in pairs(mappings) do
    keymap('n', keys, action_desc[1], { buffer = bufnr, desc = 'LSP: ' .. action_desc[2] })
  end
end

-- Example usage in LSP on_attach
local on_attach = function(_, bufnr)
  set_lsp_keymaps(bufnr)
end

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Enable the following language servers
local servers = {
  svelte = {},
  clangd = {},
  gopls = {},
  html = {},
  astro = {},
  pyright = {},
  rust_analyzer = {},
}

local handlers = {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
  -- Next, you can provide targeted overrides for specific servers.
  ["denols"] = function()
    require("lspconfig").denols.setup {
      init_options = {
        lint = true,
        unstable = true,
      },
      root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
    }
  end,
  ["tsserver"] = function()
    require("lspconfig").tsserver.setup {
      root_dir = require("lspconfig").util.root_pattern("package.json"),
      single_file_support = false
    }
  end,
  ["lua_ls"] = function()
    require("lspconfig").lua_ls.setup {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    }
  end
}

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}
local ensure_installed = vim.tbl_keys(servers or {})

require('mason-tool-installer').setup { ensure_installed = ensure_installed }
mason_lspconfig.setup_handlers(handlers)
