-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

map("n", "<C-d>", "<C-d>zz", { desc = "Move half page down and center cursor" })
map("n", "<C-u>", "<C-u>zz", { desc = "Move half page up and center cursor" })

map("n", "o", 'o<ESC>0"_Di', { desc = "Insert new line below cursor" })
map("n", "O", 'O<ESC>0"_Di', { desc = "Insert new line above cursor" })

-- Move lines - Weird thing is it works witn A-T-j ... figure out why
map("n", "<C-T-j>", ":m .+<CR>==", { desc = "Move line down" })
map("n", "<C-T-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("v", "<C-T-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "<C-T-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
map("i", "<C-T-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
map("i", "<C-T-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })

-- Add word to spell list and jump to next misspelled word
map("n", "zg", "zg]s", { desc = "Add word to spell list and jump to next misspelled word" })

map("n", "<leader>cn", "<cmd>cnext<cr>", { desc = "Go to next quickfix item" })
map("n", "<leader>cp", "<cmd>cprev<cr>", { desc = "Go to previous quickfix item" })
-- work in progsess
-- map("n", "<leader>rs", "<cmd>g;<c-r><c-w>; s;[a-z]@<=[A-Z];_l&;g<cr>", { desc = "Replace camel case with snake case" })
