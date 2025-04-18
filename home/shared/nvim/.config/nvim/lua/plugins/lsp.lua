vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client == nil then
      return
    end

    local nmap = function(keys, func, desc)
      if desc then
        desc = "LSP: " .. desc
      end

      vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    end

    if client.server_capabilities.completionProvider then
      vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
    end
    if client.server_capabilities.definitionProvider then
      vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
    end

    nmap("<leader>r", vim.lsp.buf.rename, "[R]e[n]ame")
    nmap("<leader>a", vim.lsp.buf.code_action, "[C]ode [A]ction")

    nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
    nmap(
      "gr",
      require("telescope.builtin").lsp_references,
      "[G]oto [R]eferences"
    )
    nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
    nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
    nmap(
      "<leader>ds",
      require("telescope.builtin").lsp_document_symbols,
      "[D]ocument [S]ymbols"
    )
    nmap(
      "<leader>ws",
      require("telescope.builtin").lsp_dynamic_workspace_symbols,
      "[W]orkspace [S]ymbols"
    )
    nmap("K", vim.lsp.buf.hover, "Hover Documentation")
    nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    nmap(
      "<leader>wa",
      vim.lsp.buf.add_workspace_folder,
      "[W]orkspace [A]dd Folder"
    )
    nmap(
      "<leader>wr",
      vim.lsp.buf.remove_workspace_folder,
      "[W]orkspace [R]emove Folder"
    )
    nmap("<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, "[W]orkspace [L]ist Folders")

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
      vim.lsp.buf.format({ filter = function(cli) return cli.name ~= "vtsls" end })
    end, { desc = "Format current buffer with LSP" })
  end,
})

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
    "folke/neodev.nvim",
  },
  config = function()
    require("neodev").setup()

    local servers = {
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
      denols = {
        root_dir = require("lspconfig").util.root_pattern(
          "deno.json",
          "deno.jsonc"
        ),
      },
    }

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    -- Ensure the servers above are installed
    local mason_lspconfig = require("mason-lspconfig")

    mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(servers),
    })

    mason_lspconfig.setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({
          capabilities = capabilities,
          -- todo: Add server spesific autocmds:
          -- EslintFixAll
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
          root_dir = (servers[server_name] or {}).root_dir,
        })
      end,
    })
  end,
}
