return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function(plugin)
      if vim.fn.executable("npx") == 1 then
        vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
      else
        vim.cmd([[Lazy load markdown-preview.nvim]])
        vim.fn["mkdp#util#install"]()
      end
    end,
    init = function()
      if vim.fn.executable("npx") == 1 then
        vim.g.mkdp_filetypes = { "markdown" }
      end
    end,
  },
  {
    "vinnymeller/swagger-preview.nvim",
    build = "npm install -g swagger-ui-watcher",
    opts = {},
  },
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gdiffsplit", "Gvdiffsplit" },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = function(_, opts)
      local prev_on_attach = opts.on_attach
      opts.on_attach = function(bufnr)
        if prev_on_attach then
          prev_on_attach(bufnr)
        end
        local gs = require("gitsigns")
        vim.keymap.set("n", "<leader>gp", gs.preview_hunk, { buffer = bufnr, desc = "Preview Hunk" })
        vim.keymap.set("n", "<leader>gt", gs.toggle_current_line_blame, { buffer = bufnr, desc = "Toggle Line Blame" })
      end
    end,
  },
}
