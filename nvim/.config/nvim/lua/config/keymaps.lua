-- GoLand-style keymaps, layered on top of LazyVim's defaults.
-- Leader is Ctrl-S (see options.lua). "Shift+Shift" has no terminal keycode
-- equivalent, so Ctrl-P alone covers find-files (matches prior muscle memory).
local map = vim.keymap.set

local function telescope(builtin)
  return function()
    require("telescope.builtin")[builtin]()
  end
end

-- Ctrl+P: find files
map("n", "<C-p>", telescope("find_files"), { desc = "Find Files" })
-- Ctrl+Shift+F: search text in all files
map("n", "<C-S-f>", telescope("live_grep"), { desc = "Live Grep" })

-- Alt+Enter: code action / quick fix
map({ "n", "v" }, "<M-CR>", vim.lsp.buf.code_action, { desc = "Code Action" })

-- Ctrl+B / F12: go to definition
map("n", "<C-b>", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "<F12>", vim.lsp.buf.definition, { desc = "Go to Definition" })

-- Shift+F6: rename symbol
map("n", "<S-F6>", vim.lsp.buf.rename, { desc = "Rename Symbol" })

-- Ctrl+Alt+L: format document
map({ "n", "v" }, "<C-M-l>", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format Document" })

-- Alt+F7: find references
map("n", "<M-F7>", telescope("lsp_references"), { desc = "Find References" })

-- Ctrl+Shift+T: go to / run nearest test (neotest for Go, vim-test elsewhere)
map("n", "<C-S-t>", function()
  if vim.bo.filetype == "go" then
    require("neotest").run.run()
  else
    vim.cmd("TestNearest")
  end
end, { desc = "Run Nearest Test" })
