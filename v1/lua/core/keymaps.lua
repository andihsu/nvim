-- Keymaps

vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")

keymap.set("n", "]b", ":bnext<CR>")
keymap.set("n", "[b", ":bprevious<CR>")

keymap.set("n", "<C-s>", ":wa<CR>")

-- Open Terminal
keymap.set({ "n", "i" }, "<F5>", ':FloatermNew  --name=main --autoclose=0 pwsh<CR>')
keymap.set({ "n", "i" }, "<F2>", ':FloatermKill main<CR>')

--Run Code.

-- Run zig code.
keymap.set({ "n", "i" }, "<leader>zb", ":FloatermNew --autoclose=0 zig build<CR>")
keymap.set({ "n", "i" }, "<leader>zr", ":FloatermNew --autoclose=0 zig build")
