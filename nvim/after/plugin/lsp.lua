local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({buffer = bufnr})
end)

-- Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
-- Configure gopls lsp
require('lspconfig').gopls.setup({
	cmd = {"gopls", "serve"},
	filetypes = {"go", "gomod"},
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})

lsp.setup()

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	mapping = {
		-- `Enter` key to confirm completion
		['<Tab>'] = cmp.mapping.confirm({select = true}),

		-- Ctrl+Space to trigger completion menu
		['<C-c>'] = cmp.mapping.complete(),

		-- Navigate between snippet placeholder
		['<C-f>'] = cmp_action.luasnip_jump_forward(),
		['<C-b>'] = cmp_action.luasnip_jump_backward(),
	}
})

