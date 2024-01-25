-- vim.api.nvim_set_keymap('i', '<C-z>', '<Esc>:undo<CR>a', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', '<C-y>', '<Esc>:redo<CR>a', { noremap = true, silent = true })
-- 
-- vim.api.nvim_set_keymap('i', '<C-BS>', '<Esc>:normal! db<CR>a', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', '<C-Del>', '<Esc>:normal! de<CR>a', { noremap = true, silent = true })
-- 
-- vim.api.nvim_set_keymap('i', '<C-Space>', '<C-n>', { noremap = true, silent = true })
-- 
-- vim.api.nvim_set_keymap('i', '<C-k>', '<Esc>:NvimTreeToggle', { noremap = true, silent = true })
-- 
-- vim.api.nvim_set_keymap('n', '<C-k>', ':NvimTreeToggle', { noremap = true, silent = true })


if not vim.g.vscode then
	require("core")
end
