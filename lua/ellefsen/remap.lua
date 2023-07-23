
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>h", ":wincmd h<CR>", {desc = "[Split] Move to left window"})
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>", {desc = "[Split] Move to bottom window"})
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>", {desc = "[Split] Move to top window"})
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>", {desc = "[Split] Move to right window"})
vim.keymap.set("n", "<leader>q", ":q<CR>", {desc = "Quit current window"})
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = "Move line up/down in visual mode"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = "Move line up/down in visual mode"})
vim.cmd('command! RunC lua require("run-c").run()')
local wk = require("which-key")
wk.register({
  S = {
    name = "Split Screen",
    h = "Split horizontally",
    v = "Split vertically",
  },
  s = {
    name = "Search",
    s = "Search and replace",
  },
}, {prefix = "<leader>"})

vim.keymap.set("n", "<leader>Sh", ":split <CR>", {desc = "Split horizontally"})
vim.keymap.set("n", "<leader>Sv", ":vsplit <CR>", {desc = "Split vertically"})

-- Navigation
vim.keymap.set({"n", "v"}, "H", "^", {desc = "Move to beginning of line"})
vim.keymap.set({"n", "v"}, "L", "$", {desc = "Move to end of line"})
vim.keymap.set({"n","v"}, "<M-k>", "5k", {desc = "Move up 5 lines"})
vim.keymap.set({"n","v"}, "<M-j>", "5j", {desc = "Move down 5 lines"})
vim.keymap.set("x", "p", "pgvy")

vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc = "Move down half page"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc = "Move up half page"})

-- Using :Format now from formatter.nvim
-- vim.keymap.set("n", "<leader>f", function()

-- end, { noremap = true })
--
vim.keymap.set("n", "<leader>f", ":Format<CR>", {desc = "Format current file / Flutter"})

vim.keymap.set("n", "<S-d>", "<cmd>cnext<CR>zz", {desc = "Move to next quickfix"})
vim.keymap.set("n", "<S-u>", "<cmd>cprev<CR>zz", {desc = "Move to previous quickfix"})

vim.keymap.set("n", "<C-f>", ":silent !tmux neww tmux-sessionizer<CR>", {desc = "Open tmux sessionizer"})
vim.keymap.set("n", "<leader>ft", ":silent !flutter-test %:p<CR>", {desc = "Run flutter test"})
vim.keymap.set("n", "<leader>ss", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", {desc = "Search and replace"})
