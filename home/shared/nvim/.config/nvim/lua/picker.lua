return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require("fzf-lua")
    fzf.setup({})

    vim.keymap.set("n", "<leader>fs", fzf.files, { silent = true })
    vim.keymap.set("n", "<leader><leader>", fzf.buffers, { silent = true })
    vim.keymap.set(
      "n",
      "<leader>/",
      ":FzfLua grep_project<CR>",
      { silent = true }
    )
    vim.keymap.set("n", "<leader>?", ":FzfLua oldfiles<CR>", { silent = true })
  end,
}
