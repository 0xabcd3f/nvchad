require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "nvchad.configs.lspconfig"

local capabilities = vim.tbl_deep_extend("force", {}, lspconfig.capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = false

local servers = {
  jsonls = {
    on_attach = lspconfig.on_attach,
    on_init = lspconfig.on_init,
    capabilities = capabilities,
    settings = {
      json = {
        format = { enable = true },
        validate = { enable = true },
      },
    },
  },

  yamlls = {
    on_attach = function(client, bufnr)
      lspconfig.on_attach(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end,
    on_init = lspconfig.on_init,
    capabilities = capabilities,
    settings = {
      redhat = { telemetry = { enabled = false } },
      yaml = {
        keyOrdering = false,
        format = { enable = false },
        validate = { enable = true },
      },
    },
  },

  gopls = {
    on_attach = lspconfig.on_attach,
    on_init = lspconfig.on_init,
    capabilities = capabilities,
    settings = {
      analyses = { unusedparams = true },
      completeUnimported = true,
      usePlaceholders = true,
      staticcheck = true,
      gofumpt = true,
      hints = {
        parameterNames = true,
        compositeLiteralFields = true,
      },
    },
  },
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end
