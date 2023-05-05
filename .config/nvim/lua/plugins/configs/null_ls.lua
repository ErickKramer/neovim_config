local null_ls = require("null-ls")

local sources = {
  -- Python
  null_ls.builtins.formatting.black,
  null_ls.builtins.formatting.ruff,
  null_ls.builtins.diagnostics.ruff,

  -- C++
  null_ls.builtins.diagnostics.cpplint.with({
    args = { "--linelength=100", "--filter=-whitespace/braces", "$FILENAME", },
  }),

  null_ls.builtins.formatting.prettier,
  null_ls.builtins.formatting.xmlformat,
}

null_ls.setup({
  sources = sources,
  autostart = true,
  default_timeout = 10000,
})
