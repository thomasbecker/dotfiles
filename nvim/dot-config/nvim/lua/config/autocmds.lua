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

-- Dim inactive windows
vim.api.nvim_set_hl(0, "DimInactiveWindows", { fg = "#666666" })

-- When leaving a window, set all highlight groups to a "dimmed" hl_group
vim.api.nvim_create_autocmd({ "WinLeave" }, {
  callback = function()
    local highlights = {}
    for hl, _ in pairs(vim.api.nvim_get_hl(0, {})) do
      table.insert(highlights, hl .. ":DimInactiveWindows")
    end
    vim.wo.winhighlight = table.concat(highlights, ",")
  end,
})

-- When entering a window, restore all highlight groups to original
vim.api.nvim_create_autocmd({ "WinEnter" }, {
  callback = function()
    vim.wo.winhighlight = ""
  end,
})
