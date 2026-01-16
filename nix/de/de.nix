{ config, lib, pkgs, ... }:

{
  # GNOME, Plasma, whatever
  # packages that only make sense on a desktop
  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
  	pipewire
	hyprpwcenter
	rofi
	waybar
	yazi
	hyprpaper
	swww
	pavucontrol
  ];
  fonts = {
     enableDefaultPackages = true;
 
     packages = with pkgs; [
       nerd-fonts.jetbrains-mono
     ];
 
     fontconfig = {
       enable = true;
       defaultFonts = {
         monospace = [ "JetBrainsMono Nerd Font" ];
         sansSerif = [ "JetBrainsMono Nerd Font" ];
         serif = [ "JetBrainsMono Nerd Font" ];
       };
     };
   };
}
