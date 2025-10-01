require("trouble").setup({
	auto_preview = false,
})

vim.keymap.set("n", "<leader>td", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble: Diagnosticos globales" })
vim.keymap.set(
	"n",
	"<leader>tD",
	"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
	{ desc = "Trouble: Diagnosticos locales" }
)
