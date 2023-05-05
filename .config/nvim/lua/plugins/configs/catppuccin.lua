local cp = require('catppuccin.palettes').get_palette()
require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  background = {
    -- :h background
    light = "latte",
    dark = "mocha",
  },
  transparent_background = true,
  show_end_of_buffer = false, -- show the '~' characters after the end of buffers
  term_colors = false,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  no_italic = true, -- Force no italic
  no_bold = false,  -- Force no bold
  styles = {
    comments = {},
    conditionals = {},
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {},
  custom_highlights = {
    LineNr = { fg = cp.lavender },
    PmenuSel = { bg = cp.mantle, fg = cp.green },
    PmenuSbar = { bg = cp.lavender },                  -- Popup menu: scrollbar.
    PmenuThumb = { bg = cp.lavender },                  -- Popup menu: scrollbar.
    Visual = { bg = cp.surface2, style = { "bold" } },
    Whitespace = { fg = cp.red },                     -- "nbsp", "space", "tab" and "trail" in 'listchars'
    CursorLineNr = { fg = cp.green },
    WinSeparator = { fg = cp.blue },
    TelescopeNormal = {
      bg = cp.transparent_background,
    },
    TelescopeSelection = {
      style = { "italic" },
      bg = cp.mantle,
      fg = cp.green,
    },
    TelescopePromptNormal = {
      bg = cp.transparent_background,
    },
    TelescopeSelectionCaret = {
      fg = cp.green,
    }
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    fidget = true,
    markdown = true,
    mason = true,
    dap = {
      enabled = true,
      enabled_ui = true,
    },
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true,
    },
    which_key = true,
  },
})

vim.cmd.colorscheme('catppuccin-mocha')
