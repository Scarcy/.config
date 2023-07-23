vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
vim.keymap.set("n", "<leader>gh", ":diffget //2<CR>", { desc = "Git diff get left" })
vim.keymap.set("n", "<leader>gl", ":diffget //3<CR>", { desc = "Git diff get right" })
