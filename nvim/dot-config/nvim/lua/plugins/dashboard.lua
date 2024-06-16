return {
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      local logo = [[ 
I use Neovim by the way ...
I use Colemak-DH by the way ...
I use a tiling window manager by the way ...
I DO NOT use Arch by the way ...

(((    THIS IS THE WAY!    )))
      ]]
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
