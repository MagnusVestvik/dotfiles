vim.pack.add({
	-- lsp
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/saghen/blink.cmp",                      version = "v1.10.1" },
	{ src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
	{ src = "https://github.com/rachartier/tiny-glimmer.nvim" },
	{ src = "https://codeberg.org/mfussenegger/nvim-jdtls" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },

	-- dap and tests
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/igorlfs/nvim-dap-view" },

	-- formatter
	{ src = "https://github.com/stevearc/conform.nvim" },

	-- git integration
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/neogitorg/neogit" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/m00qek/baleia.nvim" },
	{ src = "https://github.com/esmuellert/codediff.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },

	-- files and navigation
	{ src = "https://github.com/mikavilpas/yazi.nvim" },
	{ src = "https://github.com/dmtrKovalenko/fff.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },

	-- utilities
	{ src = "https://github.com/nvim-mini/mini.surround" },

	-- colorschemes
	{ src = "https://github.com/scottmckendry/cyberdream.nvim" },
	{ src = "https://github.com/sainnhe/gruvbox-material" },
	{ src = "https://github.com/marko-cerovac/material.nvim" },
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/tiagovla/tokyodark.nvim" },

})


vim.api.nvim_create_autocmd('PackChanged', {
	callback = function(event)
		if event.data.updated then
			require('fff.download').download_or_build_binary()
		end
	end,
})

-- the plugin will automatically lazy load
vim.g.fff = {
	lazy_sync = true, -- start syncing only when the picker is open
	debug = {
		enabled = true,
		show_scores = true,
	},
}

vim.keymap.set(
	'n',
	'ff',
	function() require('fff').find_files() end,
	{ desc = 'FFFind files' }
)
