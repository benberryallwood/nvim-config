-- Automatically install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

require("lazy").setup({
	-- Main colourscheme
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme nordfox]])
		end,
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},

	-- Dependencies for many plugins
	{ "nvim-lua/popup.nvim" }, -- An implementation of the Popup API from vim in Neovim
	{ "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins

	-- Colourschemes
	{ "folke/tokyonight.nvim" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},

	-- Image of code
	{
		"narutoxy/silicon.lua",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("silicon").setup({})
		end,
	},

	-- Markdown rendering
	{
		"ellisonleao/glow.nvim",
		config = true,
		cmd = "Glow",
	},

	-- cmp plugins
	{ "hrsh7th/nvim-cmp" }, -- The completion plugin
	{ "hrsh7th/cmp-buffer" }, -- buffer completions
	{ "hrsh7th/cmp-path" }, -- path completions
	{ "hrsh7th/cmp-cmdline" }, -- cmdline completions
	{ "saadparwaiz1/cmp_luasnip" }, -- snippet completions
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lua" },

	-- snippets
	{ "L3MON4D3/LuaSnip" }, -- snippet engine
	{ "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use

	-- LSP
	{ "neovim/nvim-lspconfig" }, -- enable LSP
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
	},
	{ "williamboman/mason-lspconfig.nvim" },
	{ "jose-elias-alvarez/null-ls.nvim" }, -- for formatters and linters

	-- Refactoring
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},

	-- Telescope
	{ "nvim-telescope/telescope.nvim" },
	{ "xiyaowong/telescope-emoji.nvim" },

	-- Project
	{ "ahmedkhalf/project.nvim" },
	{ "goolord/alpha-nvim" },
	{ "antoinemadec/FixCursorHold.nvim" }, -- This is needed to fix lsp doc highlight

	-- Notes
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{ "p00f/nvim-ts-rainbow" }, -- rainbow parentheses
	{ "JoosepAlviste/nvim-ts-context-commentstring" }, -- context commentstring
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", lazy = false }, -- indent guides

	-- Autopairs
	{ "windwp/nvim-autopairs" }, -- Autopairs, integrates with both cmp and treesitter

	-- Comments
	{ "numToStr/Comment.nvim" }, -- Easily comment stuff

	-- git
	{ "lewis6991/gitsigns.nvim" },
	{ "tpope/vim-fugitive" },
	{ "junegunn/gv.vim" },
	{ "idanarye/vim-merginal" },
	{ "tpope/vim-rhubarb" },
	{ "sindrets/diffview.nvim" },

	-- nvim-tree
	{ "kyazdani42/nvim-web-devicons", lazy = true },
	{ "kyazdani42/nvim-tree.lua" },

	-- bufferline
	{ "akinsho/bufferline.nvim" },
	{ "moll/vim-bbye" },

	-- winbar
	-- use("fgheng/winbar.nvim")
	{
		"SmiteshP/nvim-navic",
		dependencies = "neovim/nvim-lspconfig",
	},

	-- lualine
	{ "nvim-lualine/lualine.nvim" },

	-- toggleterm
	{ "akinsho/toggleterm.nvim" },

	-- outline
	{ "simrat39/symbols-outline.nvim" },

	-- surround
	{ "ur4ltz/surround.nvim" },

	-- testing
	{ "vim-test/vim-test" },
	{ "mfussenegger/nvim-dap" },
	{ "mfussenegger/nvim-dap-python" },
	{
		"rcarriga/neotest",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"rcarriga/neotest-python",
			"rcarriga/neotest-vim-test",
			"rcarriga/neotest-plenary",
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},

	-- colours
	{ "KabbAmine/vCoolor.vim" },
	{ "amadeus/vim-convert-color-to" },
	{ "norcalli/nvim-colorizer.lua" },

	-- duck
	{ "tamton-aquib/duck.nvim" },

	-- Impatient (startup time)
	{ "lewis6991/impatient.nvim" },

	-- Whichkey
	{ "folke/which-key.nvim" },

	-- Movement
	{ "justinmk/vim-sneak" },

	-- jk kj for escape
	{ "jdhao/better-escape.vim", event = "InsertEnter" },
})
