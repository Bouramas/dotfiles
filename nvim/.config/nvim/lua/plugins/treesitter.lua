return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "go",
        "gomod",
        "gowork",
        "gosum",
        "vue",
        "typescript",
        "tsx",
        "javascript",
        "html",
        "css",
        "scss",
        "json",
        "jsonc",
        "yaml",
        "graphql",
      })
    end,
  },
}
