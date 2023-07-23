vim.opt.splitright = true

vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", {desc = "Toggle NvimTree"})
vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>", {desc = "Refresh NvimTree"})
vim.keymap.set("n", "<leader>n", ":NvimTreeFindFile<CR>", {desc = "Find current file in NvimTree"})

require("nvim-tree").setup({
	update_focused_file = {
		enable = false,
		update_cwd = true,
	},
	disable_netrw = true,
	hijack_netrw = false,
})
