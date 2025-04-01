-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Setup nvim-tree
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	update_focused_file = {
		enable = true,
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},

	log = {
		enable = true,
		truncate = true,
		types = {
			diagnostics = true,
		},
	},
	view = {
		width = 40,
		side = "left",
		signcolumn = 'yes',
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	}
})

vim.opt.fillchars:append { eob = " " }

vim.g.nvim_tree_respect_buf_cwd = 1
