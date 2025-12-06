local fyler = require("fyler")

fyler.setup()

vim.keymap.set("n", "<C-n>", function()
	fyler.toggle({
		kind = "split_left",
	})
end, { desc = "Fyler: Alternar explorador de archivos" })
