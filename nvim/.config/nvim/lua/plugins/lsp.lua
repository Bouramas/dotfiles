-- Vue/TS use "hybrid mode": vtsls carries TS semantics inside .vue files via
-- the @vue/typescript-plugin addon, vue_ls handles templates/SFC features.
-- ("vue_ls" is the current nvim-lspconfig name for the Vue language server;
-- older nvim-lspconfig releases call it "volar" — rename if Mason/lspconfig
-- complains about an unknown server on your machine.)
local vue_language_server_path = vim.fn.stdpath("data")
  .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = {},
        cssls = {},
        jsonls = {},
        eslint = {},
        tailwindcss = {
          filetypes = { "html", "css", "vue", "typescript", "typescriptreact", "javascript", "javascriptreact" },
        },
        emmet_ls = {
          filetypes = { "html", "css", "scss", "vue", "javascriptreact", "typescriptreact" },
        },
        vue_ls = {},
        vtsls = {
          filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
            "vue",
          },
          settings = {
            vtsls = {
              tsserver = {
                globalPlugins = {
                  {
                    name = "@vue/typescript-plugin",
                    location = vue_language_server_path,
                    languages = { "vue" },
                    configNamespace = "typescript",
                  },
                },
              },
            },
          },
        },
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              analyses = {
                fieldalignment = true,
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              directoryFilters = { "-.git", "-node_modules" },
              semanticTokens = true,
            },
          },
        },
      },
    },
  },
}
