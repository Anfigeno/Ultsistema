vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.showcmd = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.shell = "fish"
vim.o.laststatus = 3
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.api.nvim_create_user_command("Hints", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, {})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "json" },
	callback = function()
		vim.api.nvim_set_option_value("formatprg", "jq", { scope = "local" })
	end,
})

vim.keymap.set("n", "<c-s>", "<cmd>w<cr>")
