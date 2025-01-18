return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        win = {
          input = {
            keys = {
              ["<a-h>"] = nil,
              ["<a-d>"] = { "toggle_hidden", mode = { "i", "n" } },
            },
          },
        },
      },
      dashboard = {
        preset = {
          header = [[ 
I use Neovim by the way ...
I use Colemak-DH by the way ...
I use a tiling window manager by the way ...
I DO NOT use Arch by the way ...

(((    THIS IS THE WAY!    )))
      ]],
        },
      },
    },
  },
}
