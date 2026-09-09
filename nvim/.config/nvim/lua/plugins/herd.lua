return {
  {
    "MomePP/herd.nvim",
    event = "VeryLazy",
    opts = {
      keys = {
        toggle = "<C-S-h>",
        send = "<C-S-h>",
        hide = "<C-S-h>",
      },
    },
    keys = {
      { "<leader>h", function() require("herd").toggle() end, desc = "Toggle Herdr" },
    },
  },
}
