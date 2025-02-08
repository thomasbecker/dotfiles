return {
  {
    "chrisgrieser/nvim-various-textobjs",
    opts = {
      keymaps = {
        useDefaults = true,
        disabledDefaults = { "n" },
      },
    },
    keys = {
      {
        mode = { "o", "x" },
        "iE",
        "<cmd>lua require('various-textobjs').nearEoL('inner','inner')<CR>",
        desc = "Near end of line",
      },
    },
  },
}
