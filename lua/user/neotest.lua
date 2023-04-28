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
		--[[ require("neotest-vim-test")({ ]]
      --[[ ignore_file_types = { "python", "vim", "lua" }, ]]
  --[[     allow_file_types = { "feature", "cucumber" } ]]
		--[[ }), ]]
	},
	diagnostic = {
		enabled = true,
	},
	discovery = {
		enabled = true,
	},
	output = {
		enabled = true,
		open_on_run = false,
	},
	quickfix = {
		open = false,
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
			clear_marked = "M",
			debug = "d",
			debug_marked = "D",
			expand = { "<CR>", "<2-LeftMouse>" },
			expand_all = "e",
			jumpto = "i",
			mark = "m",
			next_failed = "J",
			output = "o",
			prev_failed = "K",
			run = "r",
			run_marked = "R",
			short = "O",
			stop = "u",
		},
		icons = {
			running_animated = { "\\", "|", "/", "-", "\\", "|", "/", "-" },
		},
	},
})
