local null_ls = require("null-ls")
-- TODO: configure null-ls
local opts = {
	source = {
		null_ls.builtins.formatting.gofumpt,
		null_ls.builtins.formatting.goimports_reviser,
	}
}

null_ls.opts = opts
