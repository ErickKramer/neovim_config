require('gitsigns').setup {
  signs                        = {
    add          = { text = '┃' },
    -- add          = { text = '+' },
    -- change       = { text = '*' },
    change       = { text = '┃' },
    delete       = { text = '' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir                 = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked          = true,
  current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts      = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority                = 6,
  update_debounce              = 100,
  status_formatter             = nil,   -- Use default
  max_file_length              = 40000, -- Disable if file is longer than this (in lines)
  preview_config               = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm                         = {
    enable = false
  },

  on_attach                    = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- -- Navigation
    -- map('n', ']c', function()
    --   if vim.wo.diff then return ']c' end
    --   vim.schedule(function() gs.next_hunk() end)
    --   return '<Ignore>'
    -- end, {expr=true})

    -- map('n', '[c', function()
    --   if vim.wo.diff then return '[c' end
    --   vim.schedule(function() gs.prev_hunk() end)
    --   return '<Ignore>'
    -- end, {expr=true})
    --
    -- Actions
    map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>hS', gs.stage_buffer, { desc = 'Gitsigns stage buffer', buffer = bufnr })
    map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'Gitsigns undo stage hunk', buffer = bufnr })
    map('n', '<leader>hR', gs.reset_buffer, { desc = 'Gitsigns reset buffer', buffer = bufnr })
    map('n', '<leader>hp', gs.preview_hunk, { desc = 'Gitsigns preview hunk', buffer = bufnr })
    map('n', '<leader>hb', function() gs.blame_line { full = true } end,
      { desc = 'Gitsigns blame line - full', buffer = bufnr })
    map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'Gitsigns blame line - inline', buffer = bufnr })
    map('n', '<leader>hd', gs.diffthis, { desc = 'Gitsigns diff this', buffer = bufnr })
    map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = 'Gitsigns diff previous commit', buffer = bufnr })
    map('n', '<leader>td', gs.toggle_deleted, { desc = 'Gitsigns toggle deleted lines', buffer = bufnr })
  end
}
