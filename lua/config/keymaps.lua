-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

map("n", "<C-d>", "<C-d>zz", { desc = "Move half page down and center cursor" })
map("n", "<C-u>", "<C-u>zz", { desc = "Move half page up and center cursor" })

map("n", "o", 'o<ESC>0"_D', { desc = "Insert new line below cursor" })
map("n", "O", 'O<ESC>0"_D', { desc = "Insert new line above cursor" })
