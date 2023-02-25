local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
	autocmd!
	autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Dependencies for many plugins
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

	-- Colourschemes
	use("EdenEast/nightfox.nvim")
	use("ellisonleao/gruvbox.nvim")
	use("folke/tokyonight.nvim")
	use("sainnhe/everforest")
	use("jeffkreeftmeijer/vim-dim")
	use({
		"catppuccin/nvim",
		as = "catppuccin",
	})

	-- Image of code
	use({
		"narutoxy/silicon.lua",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("silicon").setup({})
		end,
	})

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

	-- Refactoring
	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("xiyaowong/telescope-emoji.nvim")

	-- Project
	use("ahmedkhalf/project.nvim")
	use("goolord/alpha-nvim")
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow") -- rainbow parentheses
	use("JoosepAlviste/nvim-ts-context-commentstring") -- context commentstring
	use("lukas-reineke/indent-blankline.nvim") -- indent guides

	-- Autopairs
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter

	-- Comments
	use("numToStr/Comment.nvim") -- Easily comment stuff

	-- git
	use("lewis6991/gitsigns.nvim")
	use("tpope/vim-fugitive")
	use("junegunn/gv.vim")
	use("idanarye/vim-merginal")
	use("tpope/vim-rhubarb")

	-- nvim-tree
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")

	-- bufferline
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")

	-- winbar
	-- use("fgheng/winbar.nvim")
	use({
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
	})

	-- lualine
	use("nvim-lualine/lualine.nvim")

	-- toggleterm
	use("akinsho/toggleterm.nvim")

	-- http
	--[[ use("NTBBloodbath/rest.nvim") ]]

	-- outline
	--[[ use("simrat39/symbols-outline.nvim") ]]

	-- surround
	use("ur4ltz/surround.nvim")

	-- testing
	use("vim-test/vim-test")
	use("mfussenegger/nvim-dap")
	use("mfussenegger/nvim-dap-python")
	use({
		"rcarriga/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"rcarriga/neotest-python",
		},
	})
	use({
		"rcarriga/nvim-dap-ui",
		requires = {
			"mfussenegger/nvim-dap",
		},
	})

	-- colours
	use("KabbAmine/vCoolor.vim")
	use("amadeus/vim-convert-color-to")
	use("norcalli/nvim-colorizer.lua")

	-- Impatient (startup time)
	use("lewis6991/impatient.nvim")

	-- Whichkey
	use("folke/which-key.nvim")

	-- Movement
	use("justinmk/vim-sneak")

	-- jk kj for escape
	use({ "jdhao/better-escape.vim", event = "InsertEnter" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
