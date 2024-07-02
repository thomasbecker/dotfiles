return {
  {
    "chrisgrieser/nvim-various-textobjs",
    lazy = false,
    opts = {
      useDefaultKeymaps = true,
      disabledKeymaps = { "n" },
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
