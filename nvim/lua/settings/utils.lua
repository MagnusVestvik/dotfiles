require("todo-comments").setup({
	signs = false,
})
require('render-markdown').setup({})
require("tiny-cmdline").setup({
	on_reposition = require("tiny-cmdline").adapters.blink,
})
