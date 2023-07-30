return {
	-- the colorscheme should be available when starting Neovim
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	-- auto_dark_mode = require("auto-dark-mode").setup({
	-- 	update_interval = 1000,
	-- 	set_dark_mode = function()
	-- 		vim.api.nvim_set_option("background", "dark")
	-- 		vim.api.nvim_command("colorscheme darcula-dark")
	-- 	end,
	-- 	set_light_mode = function()
	-- 		vim.api.nvim_set_option("background", "light")
	-- 		vim.api.nvim_command("colorscheme darcula-dark")
	-- 	end,
	-- }),
}
