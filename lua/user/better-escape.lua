local status_ok, better_escape = pcall(require, "better_escape")
if not status_ok then
  return
end

better_escape.setup({
  default_mappings = false,
  mappings = {
    i = {
      j = { k = "<Esc>" },
      k = { j = "<Esc>" },
    },
  },
})
