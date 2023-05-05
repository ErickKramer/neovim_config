-- Remap format keymap to uncrustify
vim.keymap.set('n', '<leader>cb', ":! cargo build <CR>", { desc = '[C]argo [B]uild - Compile package' })
vim.keymap.set('n', '<leader>cr', ":! cargo run <CR>", { desc = '[C]argo [R]un - Compile and execute package ' })
vim.keymap.set('n', '<leader>cc', ":! cargo check <CR>",
    { desc = '[C]argo [C]heck - Compiles without generating executable' })
vim.keymap.set('n', '<leader>Cr', ":terminal cargo run <CR>", { desc = 'terminal [C]argo [Run - Use a separate terminal to accept user inputs' })
vim.keymap.set('n', '<leader>ct', ":! cargo test <CR>", { desc = '[C]argo [T]est - Run unit tests' })

vim.keymap.set('n', '<leader>oc',require'rust-tools'.open_cargo_toml.open_cargo_toml , { desc = '[O]pen [C]argo toml file' })

vim.keymap.set('n', '<leader>rd',require'rust-tools'.debuggables.debuggables , { desc = '[R]un [D]ebuggables' })
vim.keymap.set('n', '<leader>rd',require'rust-tools'.debuggables.debuggables , { desc = '[R]un [D]ebuggables' })
vim.keymap.set('n', '<leader>rr',require'rust-tools'.runnables.runnables , { desc = '[R]un [R]unnables' })


