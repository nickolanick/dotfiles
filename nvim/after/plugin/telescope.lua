local builtin = require('telescope.builtin')

function test(...)
	local a = require 'plenary.async'
	local sender, receiver = a.control.channel.mpsc()
		-
		a.run(function()
			sender.send(builtin.find_files())
		end)
	--local ret = rx()
	print(vim.api.nvim_buf_get_name(0))
	--print(builtin.search_history())
	--builtin.buffers()
	--result=builtin.oldfiles()
	vim.cmd(":NvimTreeCollapseKeepBuffers")
	print(vim.api.nvim_buf_get_name(0))
end

require('telescope').setup {
	defaults = {
		file_ignore_patterns = { "vendor" }
	}
}


--	builtin.find_files(...)
--vim.keymap.set('n', '<leader>ff', test)
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
