-- try neovide
if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font Mono:h14" -- text below applies for VimScript

  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0

  vim.g.neovide_transparency = 0.9
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("oil").setup()
