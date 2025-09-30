local fyler = require("fyler")

fyler.setup({
	icon_provider = "mini_icons",
})

vim.keymap.set("n", "<C-h>", function()
	fyler.toggle({
		kind = "split_left",
	})
end, { desc = "Fyler: Alternar explorador de archivos" })
