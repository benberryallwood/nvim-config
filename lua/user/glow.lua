local status_ok, glow = pcall(require, "glow")
if not status_ok then
	return
end

glow.setup({
	install_path = "/usr/local/Cellar",
})
