require("nvim-treesitter.configs").setup({
  -- List of languages to ensure parsers are installed for
  ensure_installed = { "c", "lua", "go"}, -- Add languages you use
  -- Automatically install missing parsers
  auto_install = true,
  -- Enable Treesitter features
  highlight = { enable = true }, -- Enables syntax highlighting
  indent = { enable = true },    -- Enables smart indentation
  -- Other optional modules like incremental_selection, textobjects, etc.
  -- You can enable these as needed.
})
