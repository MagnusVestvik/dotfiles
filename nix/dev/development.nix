{ config, lib, pkgs, ... }:

{

imports =
    [ # Include the results of the hardware scan.
      ./lang.nix
      ./nixvim.nix
    ];
 # packages that only make sense on a desktop
  environment.systemPackages = with pkgs; [
  	git
	#neovim
	wezterm
	fish
	nushell
	starship
	zoxide
	fzf
	bat
	fd
	htop
	scala
	scala-cli
	sqlite
	go
	lazygit
	tldr
	gcc	
	tree-sitter
	wl-clipboard
  ];

    environment.variables = {
    CC = "${pkgs.gcc}/bin/gcc";
  };
}
