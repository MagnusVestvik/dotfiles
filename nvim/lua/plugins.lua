vim.pack.add({
	-- lsp
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/saghen/blink.cmp",                         version = "v1.10.1" },
	{ src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
	{ src = "https://github.com/rachartier/tiny-glimmer.nvim" },
	{ src = "https://codeberg.org/mfussenegger/nvim-jdtls" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },

	-- dap and tests
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/igorlfs/nvim-dap-view" },
	{ src = "https://github.com/nvim-neotest/neotest" },
	{ src = "https://github.com/rcasia/neotest-java" },
	-- neotest-java dependencies: (Does currently not work with nightly...)
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/rcarriga/nvim-dap-ui" },
	{ src = "https://github.com/theHamsta/nvim-dap-virtual-text" },

	-- linting
	{ src = "https://github.com/iamkarasik/sonarqube.nvim" },

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
	{ src = "https://github.com/folke/todo-comments.nvim" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/CopilotC-Nvim/CopilotChat.nvim" },
	{ src = "https://github.com/Wansmer/symbol-usage.nvim" },

	-- colorschemes and ui <3
	{ src = "https://github.com/scottmckendry/cyberdream.nvim" },
	{ src = "https://github.com/sainnhe/gruvbox-material" },
	{ src = "https://github.com/marko-cerovac/material.nvim" },
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/tiagovla/tokyodark.nvim" },
	{ src = "https://github.com/loctvl842/monokai-pro.nvim" },
	{ src = "https://github.com/rachartier/tiny-cmdline.nvim" },
	{ src = "https://github.com/rebelot/kanagawa.nvim" },
	{ src = "https://github.com/MagnusVestvik/tiny-code-action.nvim" },

})
