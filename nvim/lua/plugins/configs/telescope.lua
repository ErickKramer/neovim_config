require('telescope').setup{
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
    -- Enable hidden files without the .git files
    find_files = {
      find_command = { "rg", "--files", "--hidden", "-g", "!.git", "--ignore-file", "/home/ekramer/.rignore" },
    },
  },
  extensions = {
    coc = {
      theme = 'ivy',
      prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
    },
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                     -- the default case_mode is "smart_case"
    }
  },
}
-- pcall(require('telescope').load_extension, 'fzf')
require('telescope').load_extension('fzf')
require('telescope').load_extension('luasnip')
