return {

  -- trim.nvim [auto trim spaces]
  -- https://github.com/cappyzawa/trim.nvim
  {
    "cappyzawa/trim.nvim",
    lazy = true,
    keys = {
      { "<leader>cw", "<cmd>Trim<cr>", desc = "Trim trailing lines" },
    },
    opts = {
      trim_on_write = false,
    },
  },
  {
    "DreamMaoMao/yazi.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>fg", "<cmd>Yazi<CR>", desc = "Toggle Yazi" },
    },
  },
}
