return {
  {
    "rasulomaroff/reactive.nvim",
    init = function()
      require("reactive").add_preset({
        name = "my-preset",
        init = function()
          -- making our cursor to use `MyCursor` highlight group
          --vim.opt.guicursor:append 'MyCursor'
          vim.opt.cursorline = true
        end,
        modes = {
          n = {
            winhl = {
              -- we use `winhl` because we want to highlight CursorLine only in a current window, not in all of them
              -- if you want to change global highlights, use the `hl` field instead.
              CursorLine = { bg = "#21202e" },
            },
            hl = {
              MyCursor = { bg = "#FFFFFF" },
            },
          },
          no = {
            -- You can also specify winhl and hl that will be applied with every operator
            winhl = {},
            hl = {},
            operators = {
              d = {
                winhl = {
                  CursorLine = { bg = "#450a0a" },
                },
                hl = {
                  MyCursor = { bg = "#fca5a5" },
                },
              },
              y = {
                winhl = {
                  CursorLine = { bg = "#0010c2" },
                },
                hl = {
                  MyCursor = { bg = "#fdba74" },
                },
              },
            },
          },
          i = {
            winhl = {
              CursorLine = { bg = "#042f2e" },
            },
            hl = {
              MyCursor = { bg = "#5eead4" },
            },
          },
        },
      })
    end,
  },
}
