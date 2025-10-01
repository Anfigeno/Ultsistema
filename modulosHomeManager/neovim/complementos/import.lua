local import = require("import")

import.setup({ picker = "telescope" })

vim.keymap.set("n", "<leader>fi", import.pick, { desc = "Telescope: Importar" })
