-- Set color scheme with transparent background
vim.cmd.colorscheme('catppuccin-mocha')

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.opt.nu = true
vim.opt.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Highlight current line
vim.opt.cursorline = true

-- Render the column delimiter
vim.opt.colorcolumn = '100'

-- Prefer spaces of 2 over tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Render trailing spaces
-- vim.opt.listchars = 'trail:~'
vim.opt.listchars = {trail = '~', eol = '↵', tab = '>~'}
vim.opt.list = true

-- Share system clipboard
vim.opt.clipboard = "unnamedplus"

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- vim.g.mapleader = ' '
-- vim.g.maplocalleader = ' '

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

--  Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Relative line numbers
local numtogGrp = vim.api.nvim_create_augroup("NumberToggle", { clear = true })
vim.api.nvim_create_autocmd(
  { "BufEnter", "InsertLeave", "FocusGained" },
  { pattern = "*",
    callback = function()
      vim.opt.relativenumber = true
    end,
    group = numtogGrp,
    desc = "Turn on relative line numbering when the buffer is entered.",
  }
)
vim.api.nvim_create_autocmd(
  { "BufLeave", "InsertEnter", "FocusLost" },
  { pattern = "*",
    callback = function()
      vim.opt.relativenumber = false
    end,
    group = numtogGrp,
    desc = "Turn off relative line numbering when the buffer is exited.",
  }
)

-- Syntax highlighting for specific filetypes
vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { pattern = "*.service", command = "set filetype=systemd"}
)
vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { pattern = "*.xacro", command = "set filetype=xml"}
)
vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { pattern = "*.launch", command = "set filetype=xml"}
)
