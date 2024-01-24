local on_attach = function(_, bufnr)
  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { buffer = false, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('<leader>gt', vim.lsp.buf.type_definition, 'Goto type [D]efinition')
  nmap('<leader>gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('<leader>gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
end


-- Autoinstall language servers
require("mason-lspconfig").setup {
  ensure_installed = { 'lua_ls', 'clangd', 'rust_analyzer', 'bashls', }
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- [ LSP SERVER SETUP ]
lspconfig['lua_ls'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    }
  },
}

lspconfig['clangd'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig['rust_analyzer'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false,
      }
    }
  }
}

lspconfig['bashls'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
