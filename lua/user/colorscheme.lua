--[[ vim.g.catppuccin_flavour = "frappe" ]]
-- local colorscheme = "catppuccin"

vim.cmd [[set background=dark]]
-- vim.cmd [[let g:everforest_background = "hard"]]
-- local colorscheme = "everforest"

local colorscheme = "nordfox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found")
  return
end

-- Autocommand that reloads neovim whenever you save the colorscheme.lua file
vim.cmd([[
  " augroup packer_user_config
	autocmd!
	autocmd BufWritePost colorscheme.lua source <afile>
  augroup end
]])
