local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local navic_status_ok, navic = pcall(require, "nvim-navic")

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = false,
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {},
		lualine_b = { { "filename", path = 1 } },
		-- lualine_b = { "buffers" },
		lualine_c = { { navic.get_location } },
		lualine_x = {},
		lualine_y = {},
		lualine_z = { diagnostics },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { diagnostics },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
