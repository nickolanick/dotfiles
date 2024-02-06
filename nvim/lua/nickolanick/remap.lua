-- remap <Ex>
vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- remap <Esc>
vim.keymap.set({"i"}, "jk", "<Esc>")
vim.keymap.set({"i"}, "kj", "<Esc>")

vim.keymap.set({"v"}, "<leader>f", "=")

-- nvimtree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader>g", ":NvimTreeCollapseKeepBuffers<cr>:NvimTreeFindFile<cr>")

-- gopls
vim.keymap.set("n", "<leader>r", ":GoRename<cr>")

-- toggleterm
vim.keymap.set("n", "<leader>t", ":ToggleTerm<cr>")

-- bufferline
vim.keymap.set("n", "<s-l>", ":bnext<cr>")
vim.keymap.set("n", "<s-h>", ":bprev<cr>")
vim.keymap.set("n", "<c-x>", ":Bdelete<cr>")

-- save file
vim.keymap.set("n", "<c-w>", ":w<cr>")

-- global clipboard yank
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+y")

-- Move in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Don't lose the buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

vim.g.go_build_tags = "e2e long_integration_test"
vim.g.syntastic_go_go_test_args = '-tags="e2e long_integration_test"'
vim.g.syntastic_go_go_build_args = '-tags="e2e long_integration_test"'


-- TODO add format.
-- vim.lsp.buf.format()
