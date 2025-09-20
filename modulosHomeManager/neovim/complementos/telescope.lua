require("telescope").setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",

		sorting_strategy = "ascending",
		layout_config = {
			horizontal = {
				prompt_position = "top",
			},
			height = 0.80,
		},
	},
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<space>ff", builtin.find_files, { desc = "Telescope: Encontrar archivos" })
vim.keymap.set("n", "<space>fg", builtin.live_grep, { desc = "Telescope: Grep" })
vim.keymap.set("n", "<space>fs", builtin.lsp_document_symbols, { desc = "Telescope: Simbolos" })
vim.keymap.set("n", "<space>fr", builtin.lsp_references, { desc = "Telescope: Encontrar referencias" })
