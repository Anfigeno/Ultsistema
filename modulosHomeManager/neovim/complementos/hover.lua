require("hover").setup({
	init = function()
		require("hover.providers.lsp")
		require("hover.providers.gh")
		require("hover.providers.gh_user")
		require("hover.providers.fold_preview")
		require("hover.providers.diagnostic")
		require("hover.providers.dictionary")
	end,
	preview_opts = {
		border = "single",
	},
	preview_window = false,
	title = true,
})

-- Setup keymaps
vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
