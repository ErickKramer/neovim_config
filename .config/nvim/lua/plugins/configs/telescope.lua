require('telescope').setup {
  defaults = {
    prompt_prefix = "🔍 ",
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    }
  },
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden", "-g", "!.git", "--ignore-file",
        vim.fn.expand("$HOME/.config/nvim/.rignore") },
    },
    lsp_document_symbols = {
      show_line = true
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  },
}
-- pcall(require('telescope').load_extension, 'fzf')
require('telescope').load_extension('fzf')
require('telescope').load_extension('luasnip')
require('telescope').load_extension('live_grep_args')
