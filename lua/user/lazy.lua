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

	-- Image of code
	{
		"michaelrommel/nvim-silicon",
		lazy = true,
		cmd = "Silicon",
		config = function()
			require("silicon").setup({
				-- Configuration here, or leave empty to use defaults
				font = "Hack Nerd Font Mono=34;",
			})
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

	-- Mini
	{ "echasnovski/mini.nvim", version = "*" },

	-- Refactoring
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			require("refactoring").setup()
		end,
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
	},

	-- Project
	{ "goolord/alpha-nvim" },
	{ "antoinemadec/FixCursorHold.nvim" }, -- This is needed to fix lsp doc highlight

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{ "p00f/nvim-ts-rainbow" }, -- rainbow parentheses
	{ "JoosepAlviste/nvim-ts-context-commentstring" }, -- context commentstring
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", lazy = false }, -- indent guides

	-- Comments
	{ "numToStr/Comment.nvim" }, -- Easily comment stuff

	-- git
	{ "lewis6991/gitsigns.nvim" },
	{ "tpope/vim-fugitive" },
	{ "junegunn/gv.vim" },
	{ "tpope/vim-rhubarb" },
	{ "sindrets/diffview.nvim" },

	-- nvim-tree
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},

	-- bufferline
	{ "akinsho/bufferline.nvim" },
	{ "moll/vim-bbye" },

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
		"nvim-neotest/neotest",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/nvim-nio",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-python",
			"nvim-neotest/neotest-vim-test",
			"nvim-neotest/neotest-plenary",
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

	-- Impatient (startup time)
	{ "lewis6991/impatient.nvim" },

	-- Whichkey
	{ "folke/which-key.nvim" },

	-- Movement
	{ "justinmk/vim-sneak" },

	-- jk kj for escape
	{ "max397574/better-escape.nvim", event = "InsertEnter" },
})
