require("lensline").setup({
	profiles = {
		{
			name = "default",
			providers = {
				{
					name = "usages",
					enabled = true,
					include = { "refs" },
					breakdown = true,
					show_zero = true,
					labels = {
						refs = "refs",
						impls = "impls",
						defs = "defs",
						usages = "usos",
					},
					icon_for_single = "󰌹 ",
					inner_separator = ", ",
				},
				{
					name = "last_author",
					enabled = true,
					cache_max_files = 50,
				},
			},
			style = {
				separator = " • ",
				highlight = "Comment",
				prefix = " ",
				placement = "above",
				use_nerdfont = true,
				render = "all",
			},
		},
	},
})
