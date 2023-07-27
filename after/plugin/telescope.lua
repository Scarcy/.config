local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>tb", builtin.buffers, { desc = "buffers" })
vim.keymap.set("n", "<leader>to", builtin.oldfiles, { desc = "oldfiles" })
vim.keymap.set("n", "<leader>tlb", function()
	builtin.git_branches({ show_remote_tracking_branches = false })
end, { desc = "local branches" })

local wk = require("which-key")

wk.register({
	["t"] = {
		name = "Telescope",
		b = { builtin.buffers, "buffers" },
		o = { builtin.oldfiles, "oldfiles" },
		l = { builtin.git_branches, "local branches" },
		r = { builtin.git_branches, "remote branches" },
		t = { builtin.git_branches, "local and remote branches" },
		g = { builtin.live_grep, "live grep" },
		h = { builtin.help_tags, "help tags" },
		c = { builtin.commands, "commands" },
		s = { builtin.lsp_document_symbols, "document symbols" },
		f = { builtin.find_files, "find files" },
	},
}, { prefix = "<leader>" })

-- vim.keymap.set("n", "<leader>tlrb", builtin.git_branches, {desc = "local and remote branches"})
-- vim.keymap.set("n", "<leader>tgg", builtin.live_grep, {desc = "live grep"})
-- vim.keymap.set("n", "<leader>th", builtin.help_tags, {desc = "help tags"})
-- vim.keymap.set("n", "<leader>tc", builtin.commands, {desc = "commands"})
-- --
-- vim.keymap.set("n", "<leader>ts", builtin.lsp_document_symbols, {desc = "document symbols"})
-- vim.keymap.set("n", "<leader>tf", builtin.find_files, {desc = "find files"})
-- vim.keymap.set("n", "<C-p>", builtin.git_files, {desc = "git files"})

require("telescope").setup({
	defaults = require("telescope.themes").get_dropdown({
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		mappings = {
			i = {
				["<C-x>"] = false,
			},
		},
	}),
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
		["ui-select"] = {
			specific_opts = {
				codeactions = false,
			},
		},
		-- dap = {},
		project = {
			base_dirs = {
				{ "~/.config/nvim/", max_depth = 2 },
			},
		},
	},
})
require("telescope").load_extension("luasnip")
require("telescope").load_extension("dap")
require("telescope").extensions.dap.configurations()
require("telescope").load_extension("fzy_native")
require("telescope").load_extension("ui-select")

Dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "< Dotfiles >",
		cwd = os.getenv("HOME") .. "/.config/nvim/",
	})
end
vim.api.nvim_command("command! Dotfiles lua Dotfiles()")
