local colors = require("../config/colors")

local catppuccin = {
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
        theme = catppuccin,
      },
      sections = {
        lualine_x = {
          -- showmode shown in lualine e.g. for macro recording messages
          {
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
            color = { fg = colors.teal },
          },
          {
            "rest",
            icon = "",
            fg = "#428890",
          },
        },
      },
    },
  },
}
