require("conform").setup({
  formatters_by_ft = {
    java = { "google-java-format-custom" },
  },
  formatters = {
    ["google-java-format-custom"] = {
      command = "/usr/bin/google-java-format_linux-x86-64",
      args = { 
        "--skip-reflowing-long-strings",
        "--skip-javadoc-formatting",
        "--replace",
        "$FILENAME"
      },
      stdin = false,
    },
  },
  format_on_save = {
    timeout_ms = 2000,
    lsp_fallback = true,
  },
})
