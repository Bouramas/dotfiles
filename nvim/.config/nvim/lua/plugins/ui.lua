return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<C-n>", "<cmd>Neotree filesystem reveal left<cr>", desc = "Explorer NeoTree (reveal)" },
      { "<leader>bf", "<cmd>Neotree buffers reveal float<cr>", desc = "Buffers (float)" },
    },
  },
}
