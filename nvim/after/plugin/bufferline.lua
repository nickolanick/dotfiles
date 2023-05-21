vim.opt.termguicolors = true
require("bufferline").setup{
	options = {
		offsets = {
			{
				filetype = "NvimTree",
				text="Tree",
				separator= true,
				text_align = "center"
			}
		}
	}
}
