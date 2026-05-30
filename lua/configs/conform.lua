return {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports", "gofumpt" },
    yaml = { "yamlfmt" },
    yml = { "yamlfmt" },
  },

  formatters = {
    yamlfmt = {
      inherit = true,
      prepend_args = {
        "-formatter",
        "type=basic,indent=2,indentless_arrays=true,retain_line_breaks=true,eof_newline=true",
      },
    },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}
