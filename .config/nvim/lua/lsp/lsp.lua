local on_attach = require("lsp.on_attach")

-- Autoinstall language servers
require("mason-lspconfig").setup {
  ensure_installed = { 'lua_ls', 'clangd', 'jdtls', 'csharp_ls', 'rust_analyzer' }
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed

local lspconfig = require('lspconfig')

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

lspconfig['jdtls'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig['csharp_ls'].setup {
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
