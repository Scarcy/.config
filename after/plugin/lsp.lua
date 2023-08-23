local lsp_zero = require("lsp-zero")
local lsp_config = require("lspconfig")

lsp_zero.preset("minimal")

lsp_zero.ensure_installed({
	"tsserver",
	"eslint",
	"lua_ls",
	"clangd",
})

-- Fix Undefined global 'vim'
lsp_zero.configure("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
-- lsp_zero.skip_server_setup({ "clangd" })
-- require("clangd_extensions").prepare()
local on_attach = function(_, bufnr)
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, { buffer = bufnr, desc = "Go to definition" })
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, { buffer = bufnr, desc = "Show hover" })
	vim.keymap.set("n", "<leader>e", function()
		vim.diagnostic.open_float()
	end, { buffer = bufnr, desc = "Show diagnostics" })
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_prev()
	end, { buffer = bufnr, desc = "Go to previous diagnostic" })
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_next()
	end, { buffer = bufnr, desc = "Go to next diagnostic" })
	vim.keymap.set("n", "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, { buffer = bufnr, desc = "Show code actions" })
	vim.keymap.set("n", "<leader>gr", function()
		vim.lsp.buf.references()
	end, { buffer = bufnr, desc = "Show references" })
	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, { buffer = bufnr, desc = "Rename" })
	-- vim.keymap.set({ "n", "i" }, "<C-b>", function()
	-- 	vim.lsp.buf.inlay_hint(0, nil)
	-- end, { buffer = bufnr, desc = "Show inlay hints" })
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, { buffer = bufnr, desc = "Show signature help" })
	vim.keymap.set("n", "<leader>dl", function()
		vim.diagnostic.setqflist()
	end, { buffer = bufnr, desc = "Show diagnostics in quickfix list" })
end

lsp_zero.on_attach(on_attach)

vim.diagnostic.config({
	virtual_text = true,
	signs = false,
})

lsp_config["dartls"].setup({
	on_attach = on_attach,
	settings = {
		dart = {
			analysisExcludedFolders = {
				vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
				vim.fn.expand("$HOME/.pub-cache"),
				vim.fn.expand("/opt/homebrew/"),
				vim.fn.expand("$HOME/tools/flutter/"),
			},
			updateImportsOnRename = true,
			completeFunctionCalls = true,
			showTodos = true,
			-- logToFile = true,
		},
	},
})
require("lspconfig").rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				enable = true,
			},
		},
	},
})
lsp_zero.setup()
-- require("clangd_extensions").setup({
-- 	server = {
-- 		-- options to pass to nvim-lspconfig
-- 		-- i.e. the arguments to require("lspconfig").clangd.setup({})
-- 	},
-- 	extensions = {
-- 		-- defaults:
-- 		-- Automatically set inlay hints (type hints)
-- 		autoSetHints = true,
-- 		-- These apply to the default ClangdSetInlayHints command
-- 		inlay_hints = {
-- 			inline = false,
-- 			-- Options other than `highlight' and `priority' only work
-- 			-- if `inline' is disabled
-- 			-- Only show inlay hints for the current line
-- 			only_current_line = false,
-- 			-- Event which triggers a refersh of the inlay hints.
-- 			-- You can make this { "CursorMoved" } or { "CursorMoved,CursorMovedI" } but
-- 			-- not that this may cause  higher CPU usage.
-- 			-- This option is only respected when only_current_line and
-- 			-- autoSetHints both are true.
-- 			only_current_line_autocmd = { "CursorHold" },
-- 			-- whether to show parameter hints with the inlay hints or not
-- 			show_parameter_hints = true,
-- 			-- prefix for parameter hints
-- 			parameter_hints_prefix = "<- ",
-- 			-- prefix for all the other hints (type, chaining)
-- 			other_hints_prefix = "=> ",
-- 			-- whether to align to the length of the longest line in the file
-- 			max_len_align = false,
-- 			-- padding from the left if max_len_align is true
-- 			max_len_align_padding = 1,
-- 			-- whether to align to the extreme right or not
-- 			right_align = false,
-- 			-- padding from the right if right_align is true
-- 			right_align_padding = 7,
-- 			-- The color of the hints
-- 			highlight = "Comment",
-- 			-- The highlight group priority for extmark
-- 			priority = 100,
-- 		},
-- 		ast = {
-- 			-- These are unicode, should be available in any font
-- 			role_icons = {
-- 				type = "🄣",
-- 				declaration = "🄓",
-- 				expression = "🄔",
-- 				statement = ";",
-- 				specifier = "🄢",
-- 				["template argument"] = "🆃",
-- 			},
-- 			kind_icons = {
-- 				Compound = "🄲",
-- 				Recovery = "🅁",
-- 				TranslationUnit = "🅄",
-- 				PackExpansion = "🄿",
-- 				TemplateTypeParm = "🅃",
-- 				TemplateTemplateParm = "🅃",
-- 				TemplateParamObject = "🅃",
-- 			},
-- 			highlights = {
-- 				detail = "Comment",
-- 			},
-- 		},
-- 		memory_usage = {
-- 			border = "none",
-- 		},
-- 		symbol_info = {
-- 			border = "none",
-- 		},
-- 	},
-- })

local cmp = require("cmp")
local luasnip = require("luasnip")
local cmp_mappings = cmp.mapping.preset.insert({
	["<C-b>"] = cmp.mapping.scroll_docs(-4),
	["<C-f>"] = cmp.mapping.scroll_docs(4),
	["<C-y>"] = cmp.mapping.complete(),
	["<C-e>"] = cmp.mapping.abort(),
	["<CR>"] = cmp.mapping.confirm({ select = false }),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings["<Tab>"] = vim.NIL
cmp_mappings["<S-Tab>"] = vim.NIL

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "luasnip" },
		{ name = "buffer", keyword_length = 5 },
	},
	window = {
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		fields = { "menu", "abbr", "kind" },
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = "λ",
				luasnip = "⋗",
				buffer = "Ω",
				path = "🖫",
			}

			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
	mapping = cmp_mappings,
})

require("fidget").setup({})
