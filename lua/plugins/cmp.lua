return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = function()
      return require "configs.conform"
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"

      cmp.setup.filetype({ "yaml", "yml" }, {
        sources = cmp.config.sources {
          {
            name = "nvim_lsp",
            entry_filter = function(entry)
              return entry:get_kind() ~= cmp.lsp.CompletionItemKind.Snippet
            end,
          },
          { name = "buffer" },
          { name = "path" },
        },
      })

      return opts
    end,
  },
}
