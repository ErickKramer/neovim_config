vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = 'Open all folds' })
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = 'Close all folds' })
vim.keymap.set("n", "zP", function()
    local winid = require("ufo").peekFoldedLinesUnderCursor()
    if not winid then
      vim.lsp.buf.hover()
    end
  end,
  { desc = "Peek Folded lines " }
)


-- Using tree-sitter for folds
require('ufo').setup({
  provider_selector = function(_, ft, _)
    local lspWithOutFolding = { "markdown", "bash", "sh", "bash", "zsh", "css" }
    if vim.tbl_contains(lspWithOutFolding, ft) then
      return { "treesitter", "indent" }
    else
      return { "lsp", "indent" }
    end
  end,
  -- open opening the buffer, close these fold kinds
  -- use `:UfoInspect` to get available fold kinds from the LSP
  close_fold_kinds = { "comment", "imports" },
  open_fold_hl_timeout = 500,
  -- fold_virt_text_handler = foldTextFormatter,
  preview = {
    win_config = {
      winhighlight = 'Normal:Folded',
      winblend = 0
    },
    mappings = {
      scrollU = '<C-u>',
      scrollD = '<C-d>',
      jumpTop = '[',
      jumpBot = ']'
    }
  },
})
