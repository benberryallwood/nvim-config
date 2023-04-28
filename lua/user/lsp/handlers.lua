local M = {}

-- TODO: backfill this to template
M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = false,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
			false
		)
	end
end

vim.keymap.set("n", "gl", vim.diagnostic.open_float, bufopts)
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev({ border = "rounded" }) end, bufopts)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next({ border = "rounded" }) end, bufopts)
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, bufopts)

M.on_attach = function(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer=buffnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	-- vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", bufopts)

	vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", bufopts)
	vim.keymap.set("v", "<leader>ca", ":'<,'>lua vim.lsp.buf.code_action()<CR>", bufopts)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format { async = true }' ]])

	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end
	if client.name == "html" then
		client.server_capailities.documentFormattingProvider = false
	end
	if client.name == "sumneko_lua" then
		client.server_capabilities.documentFormattingProvider = false
	end

	lsp_highlight_document(client)

	if client.name ~= "emmet_ls" and client.name ~= "tailwindcss" and client.name ~= "eslint" and client.name ~= "ltex" and client.name ~= "cucumber_language_server" then
		local navic = require("nvim-navic")
		navic.attach(client, bufnr)
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
