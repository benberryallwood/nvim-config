local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

gitsigns.setup {
  signs = {
    add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`

  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter_opts = {
    relative_time = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  yadm = {
    enable = false,
  },
  on_attach = function(bufnr)
    local keymap = vim.api.nvim_set_keymap

    -- Navigation
    keymap('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
    keymap('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})
  --
  --   -- Actions
    keymap('n', '<leader>hs', ':Gitsigns stage_hunk<CR>', {})
    keymap('v', '<leader>hs', ':Gitsigns stage_hunk<CR>', {})
    keymap('n', '<leader>hr', ':Gitsigns reset_hunk<CR>', {})
    keymap('v', '<leader>hr', ':Gitsigns reset_hunk<CR>', {})
  --   keymap('n', '<leader>hS', gs.stage_buffer, {})
    keymap('n', '<leader>hu', ':Gitsigns undo_stage_hunk<CR>', {})
  --   keymap('n', '<leader>hR', gs.reset_buffer, {})
    keymap('n', '<leader>hp', ':Gitsigns preview_hunk<CR>', {})
    keymap('n', '<leader>hb', ':Gitsigns blame_line<CR>', {})
  --   keymap('n', '<leader>tb', gs.toggle_current_line_blame, {})
    keymap('n', '<leader>hd', ':Gitsigns diffthis<CR>', {})
  --   keymap('n', '<leader>hD', function() gs.diffthis('~') end, {})
  --   keymap('n', '<leader>td', gs.toggle_deleted, {})
  --
  --   -- Text object
    keymap('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>', {})
    keymap('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>', {})
  end
}
