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

-- Subtle dimming for inactive windows
vim.api.nvim_set_hl(0, "DimInactiveText", { fg = "#a6adc8" }) -- Slightly dimmed text

-- Apply subtle dimming only to text-related highlights in inactive windows
vim.api.nvim_create_autocmd({ "WinLeave" }, {
  callback = function()
    local text_highlights = {
      "Normal",
      "Comment",
      "LineNr",
      "Identifier",
      "Function",
      "String",
      "Keyword",
    }
    local highlights = {}
    for _, hl in ipairs(text_highlights) do
      table.insert(highlights, hl .. ":DimInactiveText")
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

-- Reset only active window highlights when lazygit closes
vim.api.nvim_create_autocmd({ "TermClose", "TermOpen", "TermEnter", "TermLeave" }, {
  pattern = "*lazygit*",
  callback = function()
    -- Small delay to ensure proper window handling
    vim.defer_fn(function()
      local current_win = vim.api.nvim_get_current_win()
      -- Reset highlights only for active window
      vim.wo[current_win].winhighlight = ""
    end, 10)
  end,
})
