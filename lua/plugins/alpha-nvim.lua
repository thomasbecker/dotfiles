return {
  {
    "goolord/alpha-nvim",
    opts = function(_, dashboard)
      local logo = [[ 
        I use Neovim by the way ...
      I use Colemak-DH by the way ...
I use a tiling window manager by the way ...

       (((    THIS IS THE WAY!    )))
      ]]
      dashboard.section.header.val = vim.split(logo, "\n")
    end,
  },
}
