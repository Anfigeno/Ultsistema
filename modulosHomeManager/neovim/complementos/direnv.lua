local direnv = require("direnv")

direnv.setup({
	autoload_direnv = true,
	keybindings = {},
})

vim.keymap.set("n", "<leader>da", direnv.allow_direnv, { desc = "Direnv: Permitir" })
vim.keymap.set("n", "<leader>dd", direnv.edit_envrc, { desc = "Direnv: Denegar" })
vim.keymap.set("n", "<leader>dr", direnv.check_direnv, { desc = "Direnv: Recargar" })
vim.keymap.set("n", "<leader>de", direnv.edit_envrc, { desc = "Direnv: Editar .envrc" })
