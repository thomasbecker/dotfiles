local colors = require("../config/colors")

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "palenight",
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
