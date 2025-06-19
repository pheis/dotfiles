return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(bufnr)
        local gs = require("gitsigns")

        vim.keymap.set("n", "[c", function()
          gs.nav_hunk("prev")
        end, { buffer = bufnr, desc = "[G]o to [P]revious Hunk" })
        vim.keymap.set("n", "]c", function()
          gs.nav_hunk("next")
        end, { buffer = bufnr, desc = "[G]o to [N]ext Hunk" })
        vim.keymap.set(
          "n",
          "<leader>gU",
          gs.reset_hunk,
          { buffer = bufnr, desc = "Undo Hunk" }
        )
      end,
    },
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim", -- optional - Diff integration
    },
  },
}
