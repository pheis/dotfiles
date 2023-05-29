local nvim_lsp = require("lspconfig")

local lsp_formatting = function()
  vim.lsp.buf.format {
  	filter = function(client) return client.name ~= "tsserver" end
  }
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
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
  buf_set_keymap("n", "<space>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<space>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  -- buf_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>", opts)
  -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local function get_nvim_config_rt_path()
  local runtime_path = vim.split(package.path, ";")

  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")

  return runtime_path
end

local servers = {
  "pyright",
  "terraformls",
  "rust_analyzer",
  "ccls",
  "hls",
  -- hls = {
  --   settings = {
  --     haskell = { -- haskell-language-server options
  --       hlintOn = true,
  --       formattingProvider = "ormolu",
  --       -- ...
  --     }
  --   }
  -- },
  "eslint",
  "gopls",
	"tailwindcss",
  -- tsserver = {
  --   root_dir = nvim_lsp.util.root_pattern("package.json"),
  --   autostart = false,
  -- -- },
  -- denols = {
  --   root_dir = nvim_lsp.util.root_pattern("deno.json"),
  --   -- autostart = false,
  --   init_options = {
  --     enable = true,
  --     lint = true,
  --     unstable = false
  --   },
  -- },
  "tsserver",
  -- sumneko_lua = {
  --   settings = {
  --     Lua = {
  --       runtime = {
  --         version = "LuaJIT",
  --         path = get_nvim_config_rt_path(),
  --       },
  --       diagnostics = {
  --         globals = { "vim" },
  --       },
  --       workspace = {
  --         library = vim.api.nvim_get_runtime_file("", true),
  --       },
  --       telemetry = {
  --         enable = false,
  --       },
  --     },
  --   },
  -- },
}

for key, value in pairs(servers) do
  local has_config = type(key) == "string"

  local lsp = has_config and key or value
  local extra_config = has_config and value or {}

  -- cmp?
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

  local base_config = {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = capabilities
  }

  local config = vim.tbl_extend("error", base_config, extra_config)
  nvim_lsp[lsp].setup(config)
end

-- vim.cmd([[
-- autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()
-- autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync()
-- autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync()
-- autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync()
-- autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync()
-- autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync()
-- autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync()
-- autocmd BufWritePre *.json lua vim.lsp.buf.formatting_sync()
-- ]])
