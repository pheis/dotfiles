vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    -- builtin keys:
    -- gri --> implementation
    -- gra --> code actions
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true })

    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    if client == nil then
      return
    end

    -- if client:supports_method("textDocument/completion") then
    --   vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    -- end
  end,
})

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()

    local servers = {
      denols = {
        root_dir = require("lspconfig").util.root_pattern(
          "deno.json",
          "deno.jsonc"
        ),
      },
    }

    local mason_lspconfig = require("mason-lspconfig")

    mason_lspconfig.setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
          root_dir = (servers[server_name] or {}).root_dir,
        })
      end,
    })
  end,
}
