
require("ellefsen.plugin")
require("ellefsen.remap")
require("ellefsen.sets")
require("ellefsen.color")
require("ellefsen.commands")

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local yank_group = augroup("HighlightYank", {})

-- Autoformat on save
vim.cmd([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]])
-- Auto open NvimTree
vim.cmd([[
  autocmd VimEnter * lua vim.defer_fn(function() vim.cmd('NvimTreeOpen') end, 100)
]])

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

P = function(v)
	print(vim.inspect(v))
	return v
end

if pcall(require, "plenary") then
	RELOAD = require("plenary.reload").reload_module

	R = function(name)
		RELOAD(name)
		return require(name)
	end
end
