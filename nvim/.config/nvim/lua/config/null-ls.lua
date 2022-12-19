local null_ls = require("null-ls")

local sources = {
  null_ls.builtins.formatting.black,
  null_ls.builtins.diagnostics.mypy,
  null_ls.builtins.diagnostics.flake8,

  -- too irritating to use, git blame does not need to be here
  -- null_ls.builtins.code_actions.gitsigns,

  -- null_ls.builtins.formatting.stylua,
  null_ls.builtins.formatting.prettier.with({
    only_local = "node_modules/.bin",
  }),
}

local augroup = vim.api.nvim_create_augroup("NullLsFormatting", {})

null_ls.setup({ sources = sources,

  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
          vim.cmd "EslintFixAll"
        end,
      })
    end
  end,
})
