local builtin = require("statuscol.builtin")

require("statuscol").setup({
	thousands = true,
	segments = {
		{
			text = { builtin.lnumfunc, " " },
			condition = { true, builtin.not_empty },
			click = "v:lua.ScLa",
		},
		{
			sign = { name = { ".*" }, maxwidth = 1, colwidth = 1, auto = true },
			click = "v:lua.ScSa",
		},
		{
			text = { " " },
		},
	},
})
