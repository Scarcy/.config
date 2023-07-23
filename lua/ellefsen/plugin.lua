local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	},
	-- Startup Plugin
	{
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				-- config
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	-- {'Scarcy/run-c', opts = {
	--     compiler = 'clang',
	--     placement = 'v',
	--     keymap = '<leader>rc',
	--   }},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},
	"mhartington/formatter.nvim",
	-- File and folder management
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-fzy-native.nvim",
	"nvim-telescope/telescope-ui-select.nvim",
	"ThePrimeagen/harpoon",
	-- Shade for inactive window
	-- 'sunjon/shade.nvim',

	-- POG
	{
		"jiaoshijie/undotree",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	-- Learning game
	"ThePrimeagen/vim-be-good",
	-- File explorer
	--  "ryanoasis/vim-devicons",
	-- "kyazdani42/nvim-tree.lua",
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	},
	-- Snippets
	"RobertBrunhage/flutter-riverpod-snippets",
	"Neevash/awesome-flutter-snippets",
	-- Language support
	"dart-lang/dart-vim-plugin",

	{
		"nvim-treesitter/nvim-treesitter",
	},
	-- {
	-- 	dir = "~/personal/projects/nvim-treesitter",
	-- },
	"nvim-treesitter/nvim-treesitter-context",
	-- { dir = "~/personal/projects/nvim-treesitter-context" },
	-- Nice to have
	"numToStr/Comment.nvim",
	"github/copilot.vim",
	{ "j-hui/fidget.nvim", tag = "legacy" },
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	-- Git
	"tpope/vim-fugitive",
	"lewis6991/gitsigns.nvim",

	-- UI
	"f-person/auto-dark-mode.nvim",
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},

	-- { -- Throws an Error when command is run
	--   'sudormrfbin/cheatsheet.nvim',
	--   dependencies = {
	--     {'nvim-telescope/telescope.nvim'},
	--     {'nvim-lua/popup.nvim'},
	--     {'nvim-lua/plenary.nvim'},
	--   }
	-- },
}
require("lazy").setup(plugins, {})