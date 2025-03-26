require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		java = { "google-java-format" },
		-- Conform will run multiple formatters sequentially
		rust = { "rustfmt", lsp_format = "fallback" },
		-- Conform will run the first available formatter
		javascript = { "prettierd", "prettier", stop_after_first = true },
		yaml = { "yamlfmt" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 150,
		lsp_format = "fallback",
	},
})
