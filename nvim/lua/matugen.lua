 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#141318',
    base01 = '#201f24',
    base02 = '#2b292f',
    base03 = '#938f9c',
    base04 = '#cac4d2',
    base05 = '#e6e1e8',
    base06 = '#e6e1e8',
    base07 = '#e6e1e8',
    base08 = '#ffb4ab',
    base09 = '#ffade5',
    base0A = '#cbc1e7',
    base0B = '#ccbeff',
    base0C = '#ffade5',
    base0D = '#ccbeff',
    base0E = '#cbc1e7',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e6e1e8',          bg = '#141318' })
  hi('TelescopeBorder',         { fg = '#938f9c',             bg = '#141318' })
  hi('TelescopePromptNormal',   { fg = '#e6e1e8',          bg = '#141318' })
  hi('TelescopePromptBorder',   { fg = '#938f9c',             bg = '#141318' })
  hi('TelescopePromptPrefix',   { fg = '#ccbeff',             bg = '#141318' })
  hi('TelescopePromptCounter',  { fg = '#cac4d2',  bg = '#141318' })
  hi('TelescopePromptTitle',    { fg = '#141318',             bg = '#ccbeff' })
  hi('TelescopePreviewTitle',   { fg = '#141318',             bg = '#cbc1e7' })
  hi('TelescopeResultsTitle',   { fg = '#141318',             bg = '#ffade5' })
  hi('TelescopeSelection',      { fg = '#e6e1e8',          bg = '#2b292f' })
  hi('TelescopeSelectionCaret', { fg = '#ccbeff',             bg = '#2b292f' })
  hi('TelescopeMatching',       { fg = '#ccbeff',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
