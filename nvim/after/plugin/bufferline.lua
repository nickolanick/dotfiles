vim.opt.termguicolors = true require("bufferline").setup{
	options = {
		offsets = {
			{
				filetype = "NvimTree",
				text="",
				separator= true,
				text_align = "left"
			}
		}
	}
}
