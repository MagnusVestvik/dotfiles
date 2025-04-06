local dbee = require("dbee")

vim.keymap.set("n", "<leader>tdb", function()
	dbee.toggle()
end, { desc = "Toggle Dbee" })

vim.keymap.set("n", "<leader>sdb", function()
	dbee.focus()
end, { desc = "Setup dbee" })

vim.keymap.set("n", "<leader>eq", function()
	dbee.quit()
end, { desc = "Execute query on dbee" })
