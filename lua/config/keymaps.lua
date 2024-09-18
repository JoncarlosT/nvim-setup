-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set

-- Normal Mode
keymap("n", "<S-j>", "10j", { desc = "Jump 10 Lines Down" })
keymap("n", "<S-k>", "10k", { desc = "Jump 10 Lines Up" })
keymap("n", "<leader>fs", ":w<cr>", { desc = "Save File" })

-- Insert Mode
keymap("i", "jk", "<ESC>", { desc = "Exit Insert Mode" })
keymap("i", "<C-h>", "<Left>", { desc = "Move Cursor Left" })
keymap("i", "<C-l>", "<Right>", { desc = "Move Cursor Right" })
keymap("i", "jk", "<ESC>", { desc = "Exit Insert Mode" })
