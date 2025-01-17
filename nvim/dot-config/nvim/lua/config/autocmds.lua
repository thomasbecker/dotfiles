-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- local function augroup(name)
--   return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
-- end

-- vim.api.nvim_create_autocmd("FileType", {
--   group = augroup("pencil"),
--   pattern = { "markdown", "mkd", "txt" },
--   callback = function()
--     vim.cmd("PencilHard")
--     vim.g["pencil#conceallevel"] = 2
--   end,
-- })

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  callback = function()
    vim.cmd("EslintFixAll")
    Utils.format({ force = true })
  end,
  group = autogroup_eslint_lsp,
})
