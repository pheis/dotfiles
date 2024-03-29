local config = function()
  require("telescope").setup({
    defaults = {
      mappings = {
        i = {
          ["<C-u>"] = false,
          ["<C-d>"] = "delete_buffer",
        },
      },
    },
  })

  -- Enable telescope fzf native
  pcall(require("telescope").load_extension, "fzf")

  -- See `:help telescope.builtin`
  vim.keymap.set(
    "n",
    "<leader>?",
    require("telescope.builtin").oldfiles,
    { desc = "[?] Find recently opened files" }
  )
  vim.keymap.set(
    "n",
    "<leader><space>",
    require("telescope.builtin").buffers,
    { desc = "[ ] Find existing buffers" }
  )

  -- vim.keymap.set("n", "<leader>/", function()
  --   -- You can pass additional configuration to telescope to change theme, layout, etc.
  --   require("telescope.builtin").current_buffer_fuzzy_find(
  --     require("telescope.themes").get_dropdown({
  --       winblend = 10,
  --       previewer = false,
  --     })
  --   )
  -- end, { desc = "[/] Fuzzily search in current buffer" })

  vim.keymap.set(
    "n",
    "<leader>gf",
    require("telescope.builtin").git_files,
    { desc = "Search [G]it [F]iles" }
  )
  vim.keymap.set(
    "n",
    "<leader>fs",
    require("telescope.builtin").find_files,
    { desc = "[S]earch [F]iles" }
  )
  vim.keymap.set(
    "n",
    "<leader>sh",
    require("telescope.builtin").help_tags,
    { desc = "[S]earch [H]elp" }
  )
  vim.keymap.set(
    "n",
    "<leader>sw",
    require("telescope.builtin").grep_string,
    { desc = "[S]earch current [W]ord" }
  )
  vim.keymap.set(
    "n",
    "<leader>/",
    require("telescope.builtin").live_grep,
    { desc = "Grep" }
  )
  vim.keymap.set(
    "n",
    "<leader>sd",
    require("telescope.builtin").diagnostics,
    { desc = "[S]earch [D]iagnostics" }
  )

  vim.keymap.set(
    "n",
    "<leader>*",
    require("telescope.builtin").lsp_references,
    { desc = "search refs" }
  )
end

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  config = config,
}
