local telescope = require("telescope")
telescope.load_extension("workspaces")

vim.keymap.set(
	"n",
	"<space>fR",
	telescope.extensions.rest.select_env,
	{ desc = "Telescope: Seleccionar entorno de REST" }
)

vim.keymap.set("n", "<leader>rr", "<cmd>Rest run<cr>", { desc = "Rest: Ejecutar petición" })
vim.keymap.set("n", "<leader>ra", "<cmd>Rest open<cr>", { desc = "Rest: Abrir panel de resultados" })
vim.keymap.set("n", "<leader>ru", "<cmd>Rest last<cr>", { desc = "Rest: Ejecutar ultima petición" })
