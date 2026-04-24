require("todo-comments").setup({
	signs = false,
})
require('render-markdown').setup({})
require("tiny-cmdline").setup({
	on_reposition = require("tiny-cmdline").adapters.blink,
})

require("CopilotChat").setup(
	{
		window = {
			layout = 'float',
			width = 110, -- Fixed width in columns
			height = 50, -- Fixed height in rows
			border = 'rounded', -- 'single', 'double', 'rounded', 'solid'
			title = '🤖 AI Assistant',
			zindex = 100, -- Ensure window stays on top
		},
		sticky = { "#buffer:listed" },

		-- See Configuration section for options
	}
)
