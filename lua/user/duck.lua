local status_ok, duck = pcall(require, "duck")
if not status_ok then
	return
end

duck.setup()
