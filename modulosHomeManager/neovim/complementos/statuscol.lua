local builtin = require("statuscol.builtin")

require("statuscol").setup({
	thousands = true,
	segments = {
		{ text = { "%s", " " }, click = "v:lua.ScSa" },
		{
			text = { builtin.lnumfunc, " " },
			condition = { true, builtin.not_empty },
			click = "v:lua.ScLa",
		},
		{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
		{
			sign = { name = { ".*" }, maxwidth = 1, colwidth = 1, auto = true },
			click = "v:lua.ScSa",
		},
		{
			text = { " " },
		},
	},
})
