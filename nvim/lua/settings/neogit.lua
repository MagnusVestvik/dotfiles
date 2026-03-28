local neogit = require('neogit')

-- Wrap in a function to pass additional arguments
vim.keymap.set(
    "n",
    "<leader>gg",
    function() neogit.open({ kind = "floating" }) end,
    { desc = "Open Neogit UI" }
)
