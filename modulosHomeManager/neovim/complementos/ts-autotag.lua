local ts_autotag = require("ts-autotag")

ts_autotag.setup()

vim.keymap.set("n", "<leader>er", function()
	if not ts_autotag.renam() then
		vim.lsp.buf.rename()
	end
end, { desc = "Ts Autotag: Renombrar etiqueta" })
