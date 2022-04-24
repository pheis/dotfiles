local nvim_lsp = require("lspconfig")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(serverName)
  return function(client, bufnr)
    if serverName == "tsserver" then
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
    end

    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local function buf_set_option(...)
      vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "gK", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    buf_set_keymap("n", "<space>ak", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "<space>aj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
    -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>", opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
end

local function get_nvim_config_rt_path()
  local runtime_path = vim.split(package.path, ";")

  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")

  return runtime_path
end

local servers = {
  "pyright",
  "rust_analyzer",
  "ccls",
  "eslint",
  -- tsserver = { root_dir = nvim_lsp.util.root_pattern("package.json") },
  "tsserver",
  denols = {
    autostart = false,
    init_options = {
      enable = true,
      lint = true,
      unstable = false,
    },
  },
  sumneko_lua = {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = get_nvim_config_rt_path(),
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
}

for key, value in pairs(servers) do
  local has_config = type(key) == "string"

  local lsp = has_config and key or value
  local extra_config = has_config and value or {}

  local base_config = {
    on_attach = on_attach(lsp),
    flags = {
      debounce_text_changes = 150,
    },
  }

  local config = vim.tbl_extend("error", base_config, extra_config)
  nvim_lsp[lsp].setup(config)
end

vim.cmd([[
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync()
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync()
autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync()
autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync()
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync()
autocmd BufWritePre *.json lua vim.lsp.buf.formatting_sync()
]])
