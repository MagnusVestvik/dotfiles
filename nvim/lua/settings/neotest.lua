require("neotest").setup({
	adapters = {
		require("neotest-java")({
			junit_jar = nil,
			jvm_args = { "-Xmx512m" },
			incremental_build = true,
			disable_update_notifications = false,
			test_classname_patterns = {
				"^.*Tests?$",
				"^.*IT$",
				"^.*Spec$",
				".*Test.*",
				".*test.*",
			},
		}),
	},
})
