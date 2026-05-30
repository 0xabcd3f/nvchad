local snacks_config = require "configs.snacks"

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = snacks_config.opts,
    keys = snacks_config.keys,
    init = snacks_config.init,
  },

  {
    "gbprod/yanky.nvim",
    lazy = false,
    recommended = true,
    desc = "Better Yank/Paste",
    opts = require "configs.yanky",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
  },

  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "BufReadPost",
    opts = {
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
    },
  },
}
