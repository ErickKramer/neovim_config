-- ====================================================
-- Generic
-- ====================================================
vim.keymap.set("n", "<leader>so", ":source $MYVIMRC<CR>", { desc = "Source neovim config" })

-- Improve motions
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-l>", "<C-W>l")

-- Window resizing
vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]])   -- make the window biger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]])   -- make the window smaller vertically
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

-- Improve pasting
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Preserve previous word when pasting" })

vim.keymap.set("n", "<leader>k", ":cn<CR>")
vim.keymap.set("n", "<leader>j", ":cp<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic in floating window" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Send diagnostic to loclist" })
vim.keymap.set("n", "<leader>dd", vim.diagnostic.disable, { desc = "[D]isable [D]iagnostics" })
vim.keymap.set("n", "<leader>de", vim.diagnostic.enable, { desc = "[D]isable [E]nable" })


-- Change workingdir
vim.keymap.set("n", "<leader>cw", ":cd %:p:h<CR>:pwd<CR>", { desc = "Change current workding dir" })

-- vim.keymap.set("n", "<C-c>", ":q<CR>", { desc = "Close window" })

-- Fix forward jump after setting <TAB>
-- https://github.com/neovim/neovim/issues/20126
vim.keymap.set("n", "<C-I>", "<C-I>", { noremap = true })

-- Change language spelling
vim.api.nvim_create_user_command("UseSpanish", ":setlocal spell spelllang=es", {})
vim.api.nvim_create_user_command("UseEnglish", ":setlocal spell spelllang=en", {})
vim.keymap.set("n", "<F13>", ":set spell!<CR>", { desc = "Toggle spell checks - <S-F1>" })

-- Editor experience
vim.keymap.set("n", "<C-s>", ":write<CR>", { desc = "Save file" })
vim.keymap.set({ "i", "n" }, "<C-s><C-s>", "<cmd>silent! xa<cr><cmd>qa<cr>", { desc = "Save all and quit" })


-- ====================================================
-- Telescope
-- ====================================================
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
    previewer = false,
    sorting_strategy = "ascending",
  })
end, { desc = "[/] Fuzzily search in current buffer]" })

vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sp", require("telescope.builtin").spell_suggest, { desc = "[S][P]ell suggestion" })
vim.keymap.set("n", "<leader>sk", require("telescope.builtin").keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
vim.keymap.set("n", "<leader>sc", require("telescope.builtin").git_commits, { desc = "[S]earch git [C]ommits" })

-- ====================================================
-- Nvim Tree
-- ====================================================
vim.keymap.set("n", "<leader>ff", ":NvimTreeFindFile<CR>", { desc = "NvimTree [F]ind [F]ile" })
vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>", { desc = "NvimTree [T]ree [T]oggle" })

-- ====================================================
-- Execute over files
-- ====================================================
vim.keymap.set("n", "<leader>ru", ":w<CR>:!%:p", { desc = "[R][U]n current file" })
vim.keymap.set("n", "<leader>me", ":!chmod +x %:p<CR>", { desc = "[M]ake current file [E]xecutable" })

-- ====================================================
-- Spectre
-- ====================================================
vim.keymap.set("n", "<leader>P", require("spectre").open, { desc = "Open Search and Replace" })

-- ====================================================
-- LSP
-- ====================================================
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader><Tab>", "<cmd>lua require('luasnip').jump(1)<CR>", { desc = "Jump to the next placeholder" })
vim.keymap.set("n", "<leader><S-Tab>", "<cmd>lua require('luasnip').jump(-1)<CR>",
  { desc = "Jump to the previous placeholder" })
vim.keymap.set("n", "<leader>dc", "<cmd>Neogen<CR>", { desc = "Generate docstring" })

-- ====================================================
-- Fugitive
-- ====================================================
vim.keymap.set("n", "<leader>G", ":G<CR>", { desc = "Fugitive - Git" })
vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Fugitive - Git push" })
vim.keymap.set("n", "<leader>gpf", ":Git push --force-with-lease<CR>", { desc = "Fugitive - Git push force with lease" })
vim.keymap.set("n", "<leader>gpb", ":Git publish<CR>", { desc = "Fugitive - Git publish" })
vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git commit" })
vim.keymap.set("n", "<leader>gl", ":Git log<CR>", { desc = "Git log" })
vim.keymap.set("n", "<leader>gll",
  ":Git log --pretty='%C(yellow)%h %C(cyan)%cd %Cblue%aN%C(auto)%d %Creset%s' --graph --date=relative --date-order <CR>",
  { desc = "Git log oneline" })

-- ====================================================
-- Trouble
-- ====================================================
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  { silent = true, noremap = true, desc = "Toggle trouble window" }
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  { silent = true, noremap = true, desc = "Trouble diagnostics for the whole workspace" }
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  { silent = true, noremap = true, desc = "Trouble diagnostics for current document" }
)

-- ====================================================
-- Debugging -> dap
-- ====================================================
vim.keymap.set("n", "<F2>", ":lua require('dapui').toggle()<CR>")
vim.keymap.set("n", "<F3>", ":lua require('dap').continue()<CR>")
vim.keymap.set("n", "<F4>", ":lua require('dap').step_over()<CR>")
vim.keymap.set("n", "<F5>", ":lua require('dap').step_into()<CR>")
vim.keymap.set("n", "<F6>", ":lua require('dap').step_out()<CR>")
vim.keymap.set("n", "<F7>", ":DapTerminate<CR>")
vim.keymap.set("n", "<leader>br", ":lua require('dap').toggle_breakpoint()<CR>")
vim.api.nvim_create_user_command("DapPytestMethod", ":lua require('dap-python').test_method()", {})


-- ====================================================
-- barbar --> Tabs management
-- ====================================================
vim.keymap.set("n", "<A-,>", "<cmd>BufferPrevious<cr>",
  { silent = true, noremap = true, desc = "Go to previous tab" }
)
vim.keymap.set("n", "<A-.>", "<cmd>BufferNext<cr>",
  { silent = true, noremap = true, desc = "Go to next tab" }
)
vim.keymap.set("n", "<A-<>", "<cmd>BufferMovePrevious<cr>",
  { silent = true, noremap = true, desc = "Move tab to the left" }
)
vim.keymap.set("n", "<A->>", "<cmd>BufferMoveNext<cr>",
  { silent = true, noremap = true, desc = "Move tab to the right" }
)
vim.keymap.set("n", "<A->>", "<cmd>BufferMoveNext<cr>",
  { silent = true, noremap = true, desc = "Move tab to the right" }
)
vim.keymap.set("n", "<A-c>", "<cmd>BufferClose<cr>",
  { silent = true, noremap = true, desc = "Close current buffer" }
)
local opts = { noremap = true, silent = true }
-- Goto buffer in position...
vim.keymap.set('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
vim.keymap.set('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
vim.keymap.set('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
vim.keymap.set('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
vim.keymap.set('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
vim.keymap.set('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
vim.keymap.set('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
vim.keymap.set('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
vim.keymap.set('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
vim.keymap.set('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- ====================================================
-- ToggleTerm
-- ====================================================
vim.keymap.set("n", "<F15>", ":ToggleTerm size=20 direction=float<cr>",
  { desc = "Changes toggleterm to floating view - <S-F3>" })
vim.keymap.set("n", "<F16>", ":ToggleTerm size=80 direction=vertical<cr>",
  { desc = "Changes toggleterm to vertical view - <S-F4>" })
vim.keymap.set("n", "<F17>", ":ToggleTerm size=20 direction=horizontal<cr>",
  { desc = "Changes toggleterm to horizontal view - <S-F5>" })
--- Continue with the other terminals!
