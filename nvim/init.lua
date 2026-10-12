local vim = vim
-- Options
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.clipboard:append("unnamedplus")
vim.opt.scrolloff = 15
vim.opt.autoread = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.diagnostic.config({ virtual_text = true })
vim.cmd 'colorscheme catppuccin'
-- vim.cmd "colorscheme gruvbox"
-- autocomplete options
vim.o.complete = ".,o" -- use buffer and omnifunc
vim.o.completeopt = "fuzzy,menuone,noselect" -- add 'popup' for docs (sometimes)
vim.o.pumheight = 7
vim.o.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- Fold when somthing is larger then 150 lines, you can open fold with za 
--vim.opt.foldminlines = 150
vim.o.foldenable = true
vim.opt.foldminlines = 1
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
-- lsp setup
vim.lsp.config['emmylua_ls'] = {
	-- Command and arguments to start the server.
	cmd = { 'emmylua_ls' },
	-- Filetypes to automatically attach to.
	filetypes = { 'lua' },
	-- Sets the workspace "root" to the directory where any of these files is found.
	-- Files sharing a root will reuse the LSP client/connection.
	-- Nested lists indicate equal priority, see |vim.lsp.Config|.
	root_markers = { { '.emmyrc.json', '.luarc.json' }, '.git' },
	-- Server-specific settings. https://github.com/EmmyLuaLs/emmylua-analyzer-rust/blob/main/docs/config/emmyrc_json_EN.md
	settings = {
		runtime = {
			version = 'LuaJIT'
		}
	}
}

vim.lsp.enable("emmylua_ls")

vim.lsp.config["gopls"] = {
	cmd = { 'gopls' },
	-- Filetypes to automatically attach to.
	filetypes = { 'go' },
	root_markers = { '.git' }
	-- Sets the workspace "root" to the directory where any of these files is found.
	-- Files sharing a root will reuse the LSP client/connection.
	-- Server-specific settings. https://github.com/EmmyLuaLs/emmylua-analyzer-rust/blob/main/docs/config/emmyrc_json_EN.md
}
vim.lsp.enable("gopls")

vim.lsp.enable("yaml-language-server")

vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/dmtrKovalenko/fff",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/morhetz/gruvbox",
	"https://github.com/nvim-mini/mini.icons",
	"https://github.com/lewis6991/gitsigns.nvim",
	'https://github.com/nvim-mini/mini.completion',
	'https://github.com/nvim-mini/mini.indentscope',
	"https://github.com/karb94/neoscroll.nvim",
	"https://github.com/rachartier/tiny-glimmer.nvim",
	"https://github.com/stevearc/oil.nvim",
})


vim.pack.add({
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-mini/mini.nvim',            
    'https://github.com/MeanderingProgrammer/render-markdown.nvim',
    'https://github.com/rachartier/tiny-code-action.nvim',
})
vim.pack.add({
	{
		src = 'https://github.com/JavaHello/spring-boot.nvim',
		version = '218c0c26c14d99feca778e4d13f5ec3e8b1b60f0'
	},
	'https://github.com/MunifTanjim/nui.nvim',
	'https://github.com/mfussenegger/nvim-dap',

	'https://github.com/nvim-java/nvim-java'
})
require("oil").setup()
require("tiny-glimmer").setup()
require('mini.completion').setup()
require('mini.indentscope').setup()
require('neoscroll').setup({ mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>' } })

require('java').setup()
vim.lsp.enable('jdtls')

vim.api.nvim_create_autocmd('PackChanged', {
	callback = function (ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == 'fff' and (kind == 'install' or kind == 'update') then
			if not ev.data.active then vim.cmd.packadd('fff') end
			require('fff.download').download_or_build_binary()
		end
	end
})

vim.g.fff = { lazy_sync = true, debug = { enabled = true, show_scores = true } }

-- Unifies icons
require('mini.icons').setup()
require('mini.icons').tweak_lsp_kind()

vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'go', 'java' },
	callback = function () vim.treesitter.start() end
})

local conform_is_setup = false

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "java" },
	callback = function ()
		if conform_is_setup then
			return
		end
		require("conform").setup({
			formatters_by_ft = {
				java = { "google-java-format-custom" }
				--xml = { "xmlformatter" }
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
					stdin = false
				},
				xmlformatter = {
					args = { "--indent", "4" }
				}
			},
			format_on_save = {
				timeout_ms = 2000,
				lsp_fallback = true
			}
		})
		conform_is_setup = true
	end
})

-- Keybinds
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")
vim.api.nvim_set_keymap("n", "gh", "^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gl", "$", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "gh", "^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "gl", "$", { noremap = true, silent = true })

vim.keymap.set("n", "-", "<cmd>Oil<CR>")
vim.keymap.set("n", "nh", "<cmd>noh<CR>")
vim.keymap.set("n", "<leader>bl", "<cmd>Gitsigns blame_line<CR>")

vim.keymap.set("n", "<leader>f", require('fff').find_files)
vim.keymap.set("n", "<leader>rg", require('fff').live_grep)

-- Lsp keymaps
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references)
--vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set({ "n", "x", "v" }, "<leader>ca", function()
	require("tiny-code-action").code_action({
		-- Include source actions such as organize imports, along with quick fixes
		-- and refactorings.
		context = { only = { "quickfix", "refactor", "source" } },
	})
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>wd", vim.diagnostic.setloclist)
vim.keymap.set("n", "fb", vim.lsp.buf.format)



-- oil setup
require("oil").setup({
  -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
  -- Set to false if you want some other plugin (e.g. netrw) to open when you edit directories.
  default_file_explorer = true,
  -- Id is automatically added at the beginning, and name at the end
  -- See :help oil-columns
  columns = {
    "icon",
    "permissions",
    "size",
    "mtime",
  },
  -- Buffer-local options to use for oil buffers
  buf_options = {
    buflisted = false,
    bufhidden = "hide",
  },
  -- Window-local options to use for oil buffers
  win_options = {
    wrap = false,
    signcolumn = "no",
    cursorcolumn = false,
    foldcolumn = "0",
    spell = false,
    list = false,
    conceallevel = 3,
    concealcursor = "nvic",
  },
  -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
  delete_to_trash = false,
  -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
  skip_confirm_for_simple_edits = false,
  -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
  -- (:help prompt_save_on_select_new_entry)
  prompt_save_on_select_new_entry = true,
  -- Oil will automatically delete hidden buffers after this delay
  -- You can set the delay to false to disable cleanup entirely
  -- Note that the cleanup process only starts when none of the oil buffers are currently displayed
  cleanup_delay_ms = 2000,
  lsp_file_methods = {
    -- Enable or disable LSP file operations
    enabled = true,
    -- Time to wait for LSP file operations to complete before skipping
    timeout_ms = 1000,
    -- Set to true to autosave buffers that are updated with LSP willRenameFiles
    -- Set to "unmodified" to only save unmodified buffers
    autosave_changes = false,
  },
  -- Constrain the cursor to the editable parts of the oil buffer
  -- Set to `false` to disable, or "name" to keep it on the file names
  constrain_cursor = "editable",
  -- Set to true to watch the filesystem for changes and reload oil
  watch_for_changes = false,
  -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
  -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
  -- Additionally, if it is a string that matches "actions.<name>",
  -- it will use the mapping at require("oil.actions").<name>
  -- Set to `false` to remove a keymap
  -- See :help oil-actions for a list of all available actions
  keymaps = {
    ["g?"] = { "actions.show_help", mode = "n" },
    ["<CR>"] = "actions.select",
    ["<C-s>"] = { "actions.select", opts = { vertical = true } },
    ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
    ["<C-t>"] = { "actions.select", opts = { tab = true } },
    ["<C-p>"] = "actions.preview",
    ["<C-c>"] = { "actions.close", mode = "n" },
    ["<C-l>"] = "actions.refresh",
    ["-"] = { "actions.parent", mode = "n" },
    ["_"] = { "actions.open_cwd", mode = "n" },
    ["`"] = { "actions.cd", mode = "n" },
    ["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
    ["gs"] = { "actions.change_sort", mode = "n" },
    ["gx"] = "actions.open_external",
    ["g."] = { "actions.toggle_hidden", mode = "n" },
    ["g\\"] = { "actions.toggle_trash", mode = "n" },
  },
  -- Set to false to disable all of the above keymaps
  use_default_keymaps = true,
  view_options = {
    -- Show files and directories that start with "."
    show_hidden = false,
    -- This function defines what is considered a "hidden" file
    is_hidden_file = function(name, bufnr)
      local m = name:match("^%.")
      return m ~= nil
    end,
    -- This function defines what will never be shown, even when `show_hidden` is set
    is_always_hidden = function(name, bufnr)
      return false
    end,
    -- Sort file names with numbers in a more intuitive order for humans.
    -- Can be "fast", true, or false. "fast" will turn it off for large directories.
    natural_order = "fast",
    -- Sort file and directory names case insensitive
    case_insensitive = false,
    sort = {
      -- sort order can be "asc" or "desc"
      -- see :help oil-columns to see which columns are sortable
      { "type", "asc" },
      { "name", "asc" },
    },
    -- Customize the highlight group for the file name
    highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
      return nil
    end,
  },
  -- Extra arguments to pass to SCP when moving/copying files over SSH
  extra_scp_args = {},
  -- Extra arguments to pass to aws s3 when creating/deleting/moving/copying files using aws s3
  extra_s3_args = {},
  -- EXPERIMENTAL support for performing file operations with git
  git = {
    -- Return true to automatically git add/mv/rm files
    add = function(path)
      return false
    end,
    mv = function(src_path, dest_path)
      return false
    end,
    rm = function(path)
      return false
    end,
  },
  -- Configuration for the floating window in oil.open_float
  float = {
    -- Padding around the floating window
    padding = 2,
    -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    max_width = 0,
    max_height = 0,
    border = nil,
    win_options = {
      winblend = 0,
    },
    -- optionally override the oil buffers window title with custom function: fun(winid: integer): string
    get_win_title = nil,
    -- preview_split: Split direction: "auto", "left", "right", "above", "below".
    preview_split = "auto",
    -- This is the config that will be passed to nvim_open_win.
    -- Change values here to customize the layout
    override = function(conf)
      return conf
    end,
  },
  -- Configuration for the file preview window
  preview_win = {
    -- Whether the preview window is automatically updated when the cursor is moved
    update_on_cursor_moved = true,
    -- How to open the preview window "load"|"scratch"|"fast_scratch"
    preview_method = "fast_scratch",
    -- A function that returns true to disable preview on a file e.g. to avoid lag
    disable_preview = function(filename)
      return false
    end,
    -- Window-local options to use for preview window buffers
    win_options = {},
  },
  -- Configuration for the floating action confirmation window
  confirmation = {
    -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    -- min_width and max_width can be a single value or a list of mixed integer/float types.
    -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
    max_width = 0.9,
    -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
    min_width = { 40, 0.4 },
    -- optionally define an integer/float for the exact width of the preview window
    width = nil,
    -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    -- min_height and max_height can be a single value or a list of mixed integer/float types.
    -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
    max_height = 0.9,
    -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
    min_height = { 5, 0.1 },
    -- optionally define an integer/float for the exact height of the preview window
    height = nil,
    border = nil,
    win_options = {
      winblend = 0,
    },
  },
  -- Configuration for the floating progress window
  progress = {
    max_width = 0.9,
    min_width = { 40, 0.4 },
    width = nil,
    max_height = { 10, 0.9 },
    min_height = { 5, 0.1 },
    height = nil,
    border = nil,
    minimized_border = "none",
    win_options = {
      winblend = 0,
    },
  },
  -- Configuration for the floating SSH window
  ssh = {
    border = nil,
  },
  -- Configuration for the floating keymaps help window
  keymaps_help = {
    border = nil,
  },
})

vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
  callback = function()
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
    if not normal.bg then return end
    io.write(string.format("\027]11;#%06x\027\\", normal.bg))
  end,
})

vim.api.nvim_create_autocmd("UILeave", {
  callback = function() io.write("\027]111\027\\") end,
})


vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim'
})

-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
    lualine_b = { 'filename', 'branch' },
    lualine_c = {
      '%=', --[[ add your center components here in place of this comment ]]
    },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}

require("tiny-code-action").setup({
  picker = {
    "buffer",
    opts = {
      hotkeys = true, -- Enable hotkeys for quick selection of actions
      hotkeys_mode = "text_diff_based", -- Modes for generating hotkeys
      auto_preview = false, -- Enable or disable automatic preview
      auto_accept = false, -- Automatically accept the selected action (with hotkeys)
      position = "cursor", -- Position of the picker window
      winborder = "single", -- Border style for picker and preview windows
      keymaps = {
        preview = "K", -- Key to show preview
        close = { "q", "<Esc>" }, -- Keys to close the window (can be string or table)
        select = "<CR>", -- Keys to select action (can be string or table)
        preview_close = { "q", "<Esc>" }, -- Keys to return from preview to main window (can be string or table)
      },
      custom_keys = {
        { key = 'm', pattern = 'Fill match arms' },
        { key = 'r', pattern = 'Rename.*' }, -- Lua pattern matching
      },
      group_icon = " └",
    },
  },
})
