local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)

-- Telescope
-- find files
-- keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
-- find text
-- keymap("n", "<leader>ft", "<cmd>Telescope live_grep<CR>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Rest.nvim
keymap("n", "<leader>hh", ":<Plug>RestNvim<CR>", opts)

-- Symbols outline
keymap("n", "<leader>o", ":SymbolsOutline<CR>", opts)

-- Testing
keymap("n", "<leader>tT", ":TestNearest<CR>", opts)
keymap("n", "<leader>tF", ":TestFile<CR>", opts)
keymap("n", "<leader>ta", ":TestSuite<CR>", opts)
keymap("n", "<leader>tl", ":TestLast<CR>", opts)
keymap("n", "<leader>tg", ":TestVisit<CR>", opts)

-- Git
-- keymap("n", "<leader>gg", ":G<CR>", opts)
-- keymap("n", "<leader>gl", ":lua _LAZYGIT_TOGGLE()<CR>", opts)
-- keymap("n", "<leader>gb", ":Telescope git_branches<CR>", opts)

-- Run
keymap("n", "<leader>rp", ":!python %<CR>", opts)  -- run python
keymap("n", "<leader>rs", ":!sh %<CR>", opts)  -- run shell


-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Keep yanked text when pasting over other text
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- Not included for clear
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
