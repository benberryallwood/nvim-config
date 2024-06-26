local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "none", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = false, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	["a"] = { "<cmd>Alpha<cr>", "Alpha" },
	["b"] = {
		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"Buffers",
	},
	["c"] = {
		name = "Close",
		b = { "<cmd>Bd!<cr>", "Buffer" },
		o = { "<cmd>%bd|e#|bd#<cr>", "Other buffers" },
	},
	["d"] = {
		name = "Debug",
		t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
		b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
		c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
		C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
		d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
		g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
		i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
		o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
		u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
		U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
		p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
		r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
		s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
		q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
	},
	["D"] = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Diagnostics list" },
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	["f"] = {
		name = "Find",
		c = { "<cmd>lua require('telescope.builtin').colorscheme()<cr>", "Colourscheme" },
		f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Files" },
		t = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Text" },
		p = { "<cmd>Telescope projects<cr>", "Projects" },
	},
	-- ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
	["F"] = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format" },
	-- p = {
	--   name = "Packer",
	--   c = { "<cmd>PackerCompile<cr>", "Compile" },
	--   i = { "<cmd>PackerInstall<cr>", "Install" },
	--   s = { "<cmd>PackerSync<cr>", "Sync" },
	--   S = { "<cmd>PackerStatus<cr>", "Status" },
	--   u = { "<cmd>PackerUpdate<cr>", "Update" },
	-- },

	["g"] = {
		name = "Git",
		l = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		g = { "<cmd>Git<CR>", "Fugitive" },
		b = { "<cmd>lua require 'telescope.builtin'.git_branches()<CR>", "Branches" },
		--   j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		--   k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		--   l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		--   p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		--   r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		--   R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		--   s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		--   u = {
		--     "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
		--     "Undo Stage Hunk",
		--   },
		--   o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		--   b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		--   c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		--   d = {
		--     "<cmd>Gitsigns diffthis HEAD<cr>",
		--     "Diff",
		--   },
	},

	["p"] = {
		name = "Pets",
		c = {
			function()
				require("duck").hatch("🦀", 10)
			end,
			"Crab",
		},
		d = { require("duck").hatch, "Duck" },
		s = { require("duck").cook, "Stop" },
	},

	["q"] = { "<cmd>q<cr>", "Quit" },

	["t"] = {
		name = "Test",
		d = { "<cmd>lua require 'neotest'.run.run({strategy = \"dap\"})<cr>", "Debug" },
		D = { '<cmd>lua require \'neotest\'.run.run({vim.fn.expand("%"), strategy = "dap"})<cr>', "Debug file" },
		e = { "<cmd>lua require 'neotest'.summary.toggle()<cr>", "Explorer" },
		f = { "<cmd>lua require 'neotest'.run.run(vim.fn.expand('%'))<cr>", "File" },
		s = { "<cmd>lua require 'neotest'.run.stop()<cr>", "Stop nearest" },
		t = { "<cmd>lua require 'neotest'.run.run()<cr>", "Nearest" },
		p = { "<cmd>lua require('neotest').output_panel.toggle()<cr>", "Output panel" },
		o = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Output" },
	},

	["w"] = { "<cmd>w<cr>", "Write" },

	-- l = {
	--   name = "LSP",
	--   a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
	--   d = {
	--     "<cmd>Telescope lsp_document_diagnostics<cr>",
	--     "Document Diagnostics",
	--   },
	--   w = {
	--     "<cmd>Telescope lsp_workspace_diagnostics<cr>",
	--     "Workspace Diagnostics",
	--   },
	--   f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
	--   i = { "<cmd>LspInfo<cr>", "Info" },
	--   I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
	--   j = {
	--     "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
	--     "Next Diagnostic",
	--   },
	--   k = {
	--     "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
	--     "Prev Diagnostic",
	--   },
	--   l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
	--   q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
	--   r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
	--   s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
	--   S = {
	--     "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
	--     "Workspace Symbols",
	--   },
	-- },
}

which_key.setup(setup)
which_key.register(mappings, opts)
