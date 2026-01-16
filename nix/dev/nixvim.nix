{ pkgs, lib, ... }:
let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    # If you are not running an unstable channel of nixpkgs, select the corresponding branch of Nixvim.
    # ref = "nixos-25.11";
  });
in
{
  imports = [
    # For NixOS
    nixvim.nixosModules.nixvim
  ];

  programs.nixvim.enable = true;

  programs.nixvim = {
  globals.mapleader = " ";
  colorschemes.mini-hues.enable = true;
  colorschemes.mini-hues.settings = {
  autoadjust = true;
  background = "#2b1a33";
  foreground = "#c9c5cb";
  
  };
  colorscheme = "miniautumn";

  clipboard = {
    providers.wl-copy.enable = true; 
    register = "unnamedplus";
  };

   plugins.treesitter = {
    enable = true;

    settings.highlight.enable = true;

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      go
      gomod
      gosum
      gowork
      lua
      vim
      bash
      markdown
      nix
      zig
      cpp
      c
      tsx
      javascript
      typescript
      rust
      cpp
      json
      svelte
      java
      scala
      kotlin
      yaml
      toml
      python
    ];
  }; 
  plugins.treesitter-context.enable = true;
  treesitter-textobjects = {
   enable = true;
   select = {
     enable = true;
     lookahead = true;
   };
 };

  	plugins.yazi.enable = true;
	plugins.blink-cmp.enable = true;
	plugins.tiny-glimmer.enable = true;
	plugins.fff.enable = true;
	plugins.gitgutter.enable = true;
	plugins.neoscroll.enable = true;
	plugins.smear-cursor.enable = true;
	plugins.colorizer.enable = true;

	plugins.blink-cmp.setupLspCapabilities = true;
	opts = {
		number = true;	
		relativenumber = true; 
		shiftwidth = 2;
	};

	keymaps = [
		{
			mode = "n";
			key = "gl";
			action = "$";
		}
		{
			mode = "n";
			key = "gh";
			action = "^";
		}
		{
			mode = "v";
			key = "gl";
			action = "$";
		}
		{
			mode = "v";
			key = "gh";
			action = "^";
		}
		{
			mode = "n";
			key = "<C-Up>";
			action = ":resize +2 <CR>";
		}
		{
			mode = "n";
			key = "<C-Down>";
			action = ":resize -2 <CR>";
		}
                {
                  	mode = "n";
                  	key = "<leader>e";
                  	action.__raw = "vim.diagnostic.open_float";
                  	options.desc = "Show diagnostic [E]rror messages";
                }
                {
                  	mode = "n";
                  	key = "<leader>q";
                  	action.__raw = "vim.diagnostic.setloclist";
                  	options.desc = "Open diagnostic [Q]uickfix list";
                }
                {
                  	mode = "n";
                  	key = "<leader>,";
			action = ":FFFFind<CR>";
                }
		{
                  	mode = "n";
                  	key = "-";
			action = ":Yazi<CR>";
                }
	];

        plugins.lsp = {
          enable = true;
          
          servers = {
            lua_ls = {
              enable = true;
              settings.Lua = {
                runtime.version = "LuaJIT";
              };
            };
            
            rust_analyzer = {
              enable = true;
              installCargo = false;
              installRustc = false;
              settings = {
                cargo.allFeatures = true;
              };
            };
            
            gopls.enable = true;
            
            html.enable = true;
            
            cssls.enable = true;
            
            jsonls.enable = true;
            
            elixirls.enable = true;
            
            nil_ls.enable = true;
            
            eslint.enable = true;
          };
        };
  };
}
