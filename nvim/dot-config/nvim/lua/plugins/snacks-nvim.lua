return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        layout = "default",
        matcher = {
          -- frecency = true,
        },
        win = {
          input = {
            keys = {
              ["<a-h>"] = nil,
              ["<a-m>"] = nil,
              ["<a-e>"] = { "toggle_hidden", mode = { "i", "n" } },
              ["<a-z>"] = { "toggle_maximize", mode = { "i", "n" } },
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
      explorer = {
        replace_netrw = true,
      },
    },
    keys = {
      { mode = { "n", "v" }, "<leader>e", "<cmd>lua Snacks.explorer()<cr>" },
    },
  },
}
