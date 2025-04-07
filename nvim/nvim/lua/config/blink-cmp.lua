config = function()
    require("blink.cmp").setup({
        completion = {
            menu = {
                draw = {
                    -- We don't need label_description now because label and label_description are already
                    -- combined together in label by colorful-menu.nvim.
                    columns = { { "kind_icon" }, { "label", gap = 1 } },
                    components = {
                        label = {
                            text = function(ctx)
                                return require("colorful-menu").blink_components_text(ctx)
                            end,
                            highlight = function(ctx)
                                return require("colorful-menu").blink_components_highlight(ctx)
                            end,
                        },
                    },
                },
            },
        },
    })
end


-- Put this in your init.lua or a file required by it
-- (e.g., lua/custom/plugins/blink-config.lua if using LazyVim structure)

-- Define the highlights specifically for Kanagawa
local function setup_blink_highlights_for_kanagawa()
  -- Define colors based on Kanagawa Wave palette (adjust if needed)
  -- You can find these hex codes in the kanagawa.nvim source or by inspecting
  -- elements in Neovim using :Inspect after loading the theme.
  local colors = {
    -- Backgrounds/Foregrounds
    bg = "#1f1f28", -- sumiInk1 (Menu background)
    fg = "#dcd7ba", -- fujiWhite (Default text)
    fg_dark = "#727169", -- sumiInk5 (Dim text, e.g., File/Folder)
    border = "#54546d", -- sumiInk4 (Border color)
    selection_bg = "#2d4f67", -- waveBlue6 (Selected item background)
    match_fg = "#e6c384", -- autumnYellow (Matching characters)

    -- Syntax/Kind Colors
    blue = "#7e9cd8", -- waveBlue1
    cyan = "#7fb4ca", -- waveAqua1
    green = "#98bb6c", -- springGreen
    orange = "#ffa066", -- autumnOrange
    purple = "#957fb8", -- waveViolet1
    red = "#ff5d62", -- autumnRed
    yellow = "#e6c384", -- autumnYellow (same as match)
  }

  -- Helper function for setting highlights
  local set_hl = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Apply blink.cmp highlights
  set_hl('BlinkCmpMenu', { fg = colors.fg, bg = colors.bg })
  set_hl('BlinkCmpMenuBorder', { fg = colors.border, bg = colors.bg }) -- Border fg, bg same as menu
  set_hl('BlinkCmpMenuSelection', { bg = colors.selection_bg, bold = true })
  set_hl('BlinkCmpLabelMatch', { fg = colors.match_fg, bold = true }) -- Highlight matching chars

  -- Kind Icons (using Kanagawa colors)
  -- Assign colors based on semantic meaning, feel free to adjust!
  set_hl('BlinkCmpKindText', { fg = colors.fg })
  set_hl('BlinkCmpKindMethod', { fg = colors.blue })
  set_hl('BlinkCmpKindFunction', { fg = colors.blue })
  set_hl('BlinkCmpKindConstructor', { fg = colors.purple })
  set_hl('BlinkCmpKindField', { fg = colors.green })
  set_hl('BlinkCmpKindVariable', { fg = colors.cyan }) -- Using cyan to differentiate from fg
  set_hl('BlinkCmpKindClass', { fg = colors.orange })
  set_hl('BlinkCmpKindInterface', { fg = colors.orange })
  set_hl('BlinkCmpKindModule', { fg = colors.green })
  set_hl('BlinkCmpKindProperty', { fg = colors.green })
  set_hl('BlinkCmpKindUnit', { fg = colors.cyan })
  set_hl('BlinkCmpKindValue', { fg = colors.cyan })
  set_hl('BlinkCmpKindEnum', { fg = colors.purple })
  set_hl('BlinkCmpKindKeyword', { fg = colors.red })
  set_hl('BlinkCmpKindSnippet', { fg = colors.yellow })
  set_hl('BlinkCmpKindColor', { fg = colors.red })
  set_hl('BlinkCmpKindFile', { fg = colors.fg_dark })
  set_hl('BlinkCmpKindReference', { fg = colors.purple })
  set_hl('BlinkCmpKindFolder', { fg = colors.fg_dark })
  set_hl('BlinkCmpKindEnumMember', { fg = colors.purple })
  set_hl('BlinkCmpKindConstant', { fg = colors.orange })
  set_hl('BlinkCmpKindStruct', { fg = colors.orange })
  set_hl('BlinkCmpKindEvent', { fg = colors.yellow })
  set_hl('BlinkCmpKindOperator', { fg = colors.red })
  set_hl('BlinkCmpKindTypeParameter', { fg = colors.red })

  -- Optional: Link selected kinds to slightly different colors if desired
  -- set_hl('BlinkCmpKindFunctionSel', { fg = colors.blue, bg = colors.selection_bg, bold = true })
  -- set_hl('BlinkCmpKindVariableSel', { fg = colors.cyan, bg = colors.selection_bg, bold = true })
  -- ... and so on for other kinds if you want selected kinds to change foreground too

  print("Applied custom blink.cmp highlights for Kanagawa.")
end

-- Create an autocommand group to ensure it's cleared on reload
vim.api.nvim_create_augroup('KanagawaBlinkHighlights', { clear = true })

-- Create the autocommand to apply highlights when Kanagawa is loaded
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = 'kanagawa', -- Only run when kanagawa is the colorscheme
  callback = setup_blink_highlights_for_kanagawa,
  group = 'KanagawaBlinkHighlights',
  desc = 'Setup blink.cmp highlights for Kanagawa',
})

-- Optional: If Kanagawa might already be loaded when this config runs,
-- call the function directly once.
if vim.g.colors_name == "kanagawa" then
  setup_blink_highlights_for_kanagawa()
end
