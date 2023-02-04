local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
	return
end

neotest.setup({
	adapters = {
		require("neotest-python")({
			dap = { justMyCode = false },
		}),
		-- require("neotest-plenary"),
		-- require("neotest-vim-test")({
		--   ignore_file_types = { "python", "vim", "lua" },
		-- }),
	},
	diagnostic = {
		enabled = true,
	},
	discovery = {
		enabled = true,
	},
	floating = {
		border = "rounded",
		max_height = 0.6,
		max_width = 0.6,
		options = {},
	},
	highlights = {
		adapter_name = "NeotestAdapterName",
		border = "NeotestBorder",
		dir = "NeotestDir",
		expand_marker = "NeotestExpandMarker",
		failed = "NeotestFailed",
		file = "NeotestFile",
		focused = "NeotestFocused",
		indent = "NeotestIndent",
		namespace = "NeotestNamespace",
		passed = "NeotestPassed",
		running = "NeotestRunning",
		skipped = "NeotestSkipped",
		test = "NeotestTest",
	},
	icons = {
		child_indent = "│",
		child_prefix = "├",
		collapsed = "─",
		expanded = "╮",
		failed = "✖",
		final_child_indent = " ",
		final_child_prefix = "╰",
		non_collapsible = "─",
		passed = "✔",
		running = "🗘",
		skipped = "ﰸ",
		unknown = "?",
	},
	jump = {
		enabled = true,
	},
	output = {
		enabled = true,
		open_on_run = "short",
	},
	run = {
		enabled = true,
	},
	status = {
		enabled = true,
	},
	strategies = {
		integrated = {
			height = 40,
			width = 120,
		},
	},
	summary = {
		enabled = true,
		expand_errors = true,
		follow = true,
		mappings = {
			attach = "a",
			expand = { "<CR>", "<2-LeftMouse>" },
			expand_all = "e",
			jumpto = "i",
			output = "o",
			run = "r",
			short = "O",
			stop = "u",
		},
	},
})
