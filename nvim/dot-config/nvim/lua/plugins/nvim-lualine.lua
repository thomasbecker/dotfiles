local colors = dofile(os.getenv("HOME") .. "/.config/themes/colors.lua")

local catppuccin_mocha = {
  normal = {
    a = { bg = colors.mauve, fg = colors.surface0, gui = "bold" },
    b = { bg = colors.surface1, fg = colors.mauve },
    c = { bg = colors.surface0, fg = colors.text },
  },
  insert = {
    a = { bg = colors.sky, fg = colors.surface0, gui = "bold" },
    b = { bg = colors.surface1, fg = colors.sky },
    c = { bg = colors.surface0, fg = colors.text },
  },
  visual = {
    a = { bg = colors.blue, fg = colors.surface0, gui = "bold" },
    b = { bg = colors.surface1, fg = colors.blue },
    c = { bg = colors.surface0, fg = colors.text },
  },
  replace = {
    a = { bg = colors.red, fg = colors.surface0, gui = "bold" },
    b = { bg = colors.surface1, fg = colors.red },
    c = { bg = colors.surface0, fg = colors.text },
  },
  command = {
    a = { bg = colors.maroon, fg = colors.surface0, gui = "bold" },
    b = { bg = colors.surface1, fg = colors.maroon },
    c = { bg = colors.surface0, fg = colors.text },
  },
  inactive = {
    a = { bg = colors.teal, fg = colors.surface0, gui = "bold" },
    b = { bg = colors.surface1, fg = colors.teal },
    c = { bg = colors.surface0, fg = colors.text },
  },
}

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = catppuccin_mocha,
      },
      sections = {
        lualine_x = {
          {
            require("noice").api.status.message.get_hl,
            cond = require("noice").api.status.message.has,
          },
          {
            require("noice").api.status.command.get,
            cond = require("noice").api.status.command.has,
            color = { fg = "#ff9e64" },
          },
          {
            require("noice").api.status.mode.get,
            cond = require("noice").api.status.mode.has,
            color = { fg = "#ff9e64" },
          },
          {
            require("noice").api.status.search.get,
            cond = require("noice").api.status.search.has,
            color = { fg = "#ff9e64" },
          }, -- showmode shown in lualine e.g. for macro recording messages
          -- TODO: it's useful as it shows the current env being used in rest, but it prevents rest from lazy starting and rest loads telescope as well, etc.
          -- {
          --   "rest",
          --   icon = "",
          --   fg = "#428890",
          -- },
        },
      },
    },
  },
}
