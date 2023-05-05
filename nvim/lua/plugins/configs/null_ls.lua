local null_ls = require("null-ls")

local sources = {
  -- Python
  null_ls.builtins.formatting.black,
  null_ls.builtins.formatting.ruff,
  -- null_ls.builtins.formatting.isort.with({
  --   args = { "--quiet", "-" },
  --   extra_args = { "--profile", "--black" },
  -- }),   -- This was breaking black format for the headers
  -- null_ls.builtins.diagnostics.flake8,
  null_ls.builtins.diagnostics.ruff,

  -- C++
  null_ls.builtins.diagnostics.cpplint.with({
    args = { "--linelength=100", "--filter=-whitespace/braces", "$FILENAME", },
  }),

  null_ls.builtins.formatting.prettier,
  null_ls.builtins.formatting.xmlformat,

  -- Markdown
  null_ls.builtins.diagnostics.markdownlint,
  -- Spelling
  -- null_ls.builtins.diagnostics.cspell,
  -- null_ls.builtins.diagnostics.cspell.with({
  --     -- extra_args = { "-c ~/.config/nvim/cspell.json" }
  -- }),
  -- null_ls.builtins.code_actions.cspell.with({
  --     config = {
  --         -- this is specific to cspell and so belongs under the config key
  --         find_json = function(_)
  --             return vim.fn.expand("~/.config/nvim/cspell.json")
  --         end,
  --     },
  --     -- works for all sources, not just cspell
  --     -- on_success = function(_)
  --     --     os.execute(
  --     --         "cat ~/.config/nvim/cspell.json | jq -S '.words |= sort' | tee ~/.config/nvim/cspell.json > /dev/null"
  --     --     )
  --     -- end,
  -- })
}

null_ls.setup({
  sources = sources,
  autostart = true,
  default_timeout = 10000,
})
