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

local mappings = {
	{
		"<leader>a",
		"<cmd>Alpha<cr>",
		desc = "Alpha",
	},
	{
		"<leader>b",
		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		desc = "Buffers",
	},
	{
		"<leader>c",
		group = "Close",
	},
	{
		"<leader>cb",
		"<cmd>Bd!<cr>",
		desc = "Buffer",
	},
	{
		"<leader>co",
		"<cmd>%bd|e#|bd#<cr>",
		desc = "Other buffers",
	},
  { "<leader>d", group = "Debug"},
  { "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" },
  { "<leader>db", "<cmd>lua require'dap'.step_back()<cr>", desc = "Step Back" },
	{ "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue" },
	{ "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<cr>", desc = "Run To Cursor" },
	{ "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", desc = "Disconnect" },
	{ "<leader>dg", "<cmd>lua require'dap'.session()<cr>", desc = "Get Session" },
	{ "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into" },
	{ "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over" },
	{ "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out" },
	{ "<leader>dU", "<cmd>lua require'dapui'.toggle()<cr>", desc = "Toggle UI" },
	{ "<leader>dp", "<cmd>lua require'dap'.pause()<cr>", desc = "Pause" },
	{ "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Toggle Repl" },
	{ "<leader>ds", "<cmd>lua require'dap'.continue()<cr>", desc = "Start" },
	{ "<leader>dq", "<cmd>lua require'dap'.close()<cr>", desc = "Quit" },
  { "<leader>D", vim.diagnostic.setloclist, desc = "Diagnostics list" },
  { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
  { "<leader>f", group = "Find" },
  { "<leader>fc", "<cmd>lua require('telescope.builtin').colorscheme()<cr>", desc = "Colourscheme" },
  { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Files" },
  { "<leader>ft", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "Text" },
  { "<leader>F", "<cmd>lua vim.lsp.buf.format()<CR>", desc = "Format" },
  { "<leader>g", group = "Git" },
  { "<leader>gl", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", desc = "Lazygit" },
  { "<leader>gg", "<cmd>Git<CR>", desc = "Fugitive" },
  { "<leader>gb", "<cmd>lua require 'telescope.builtin'.git_branches()<CR>", desc = "Branches" },

  { "<leader>q", "<cmd>q<cr>", desc = "Quit" },

  { "<leader>t", group = "Test" },
  { "<leader>td", "<cmd>lua require 'neotest'.run.run({strategy = \"dap\"})<cr>", desc = "Debug" },
  { "<leader>tD", '<cmd>lua require \'neotest\'.run.run({vim.fn.expand("%"), strategy = "dap"})<cr>', desc = "Debug file" },
  { "<leader>te", "<cmd>lua require 'neotest'.summary.toggle()<cr>", desc = "Explorer" },
  { "<leader>tf", "<cmd>lua require 'neotest'.run.run(vim.fn.expand('%'))<cr>", desc = "File" },
  { "<leader>ts", "<cmd>lua require 'neotest'.run.stop()<cr>", desc = "Stop nearest" },
  { "<leader>tt", "<cmd>lua require 'neotest'.run.run()<cr>", desc = "Nearest" },
  { "<leader>tp", "<cmd>lua require('neotest').output_panel.toggle()<cr>", desc = "Output panel" },
  { "<leader>to", "<cmd>lua require('neotest').output.open({ enter = true })<cr>", desc = "Output" },

  { "<leader>w", "<cmd>w<cr>", desc = "Write" },
}

which_key.setup(setup)
which_key.add(mappings)
