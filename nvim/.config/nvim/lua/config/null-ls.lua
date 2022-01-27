local null_ls = require("null-ls")

local sources = {
	null_ls.builtins.formatting.black,
	null_ls.builtins.diagnostics.mypy,
	null_ls.builtins.diagnostics.flake8,

	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.prettier.with({
		only_local = "node_modules/.bin",
	}),
}

null_ls.setup({ sources = sources })