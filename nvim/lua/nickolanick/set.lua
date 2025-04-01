-- Show status
vim.cmd.laststatus = 2
-- Enabled tab/space highlights
vim.opt.list=true
vim.opt.listchars = { space = ' ', tab = '| ' , trail = "•", eol = "↲"}
-- Tab settings
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = false
-- Show line numbers
vim.opt.number = true
-- Show line numbers
vim.opt.relativenumber =  true
-- Always show first/last 8 lines
vim.opt.scrolloff = 8
-- No swap
vim.opt.swapfile = false
-- Max column width
vim.opt.colorcolumn = "120"
-- Vim-go settings
vim.g.go_build_tags = "e2e long_integration_test integration_test"
vim.g.syntastic_go_go_test_args = '-tags="e2e long_integration_test integration_test"'
vim.g.syntastic_go_go_build_args = '-tags="e2e long_integration_test integration_test"'
vim.o.splitright = true
vim.g.go_term_enabled = true
vim.g.go_term_mode = "vsplit"
vim.opt.splitright = true
-- Spelling
vim.opt.spelloptions = "camel"
vim.opt.spelllang = 'en_us'
vim.opt.spell = true
