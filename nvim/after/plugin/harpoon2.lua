local harpoon = require("harpoon")

harpoon:setup({
	settings = {
		save_on_toggle = true,
	},
	global_settings = {
		-- set marks specific to each git branch inside git repository
		mark_branch = true,
  }})

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>r", function() harpoon:list():remove() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end)


-- TODO: figure out best way to navigate tabs 1-4, eg:
--vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
--vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
--vim.keymap.set("n", "<C-3>", function() harpoon:list():select(4) end)
--vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)
