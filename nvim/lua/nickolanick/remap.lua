-- remap <Ex>
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- remap <Esc>
vim.keymap.set({"i"}, "jk", "<Esc>")
vim.keymap.set({"i"}, "kj", "<Esc>")

-- nvimtree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")

-- toggleterm
vim.keymap.set("n", "<leader>t", ":ToggleTerm<cr>")

-- bufferline
vim.keymap.set("n", "<s-l>", ":bnext<cr>")
vim.keymap.set("n", "<s-h>", ":bprev<cr>")
vim.keymap.set("n", "<c-x>", ":Bdelete<cr>")

-- save file
vim.keymap.set("n", "<c-w>", ":w<cr>")

-- global climboard yan
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+y")
