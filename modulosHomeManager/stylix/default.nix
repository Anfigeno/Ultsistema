{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modulosHomeManager.stylix;
in
{
  options.modulosHomeManager.stylix = {
    activar = lib.mkEnableOption "Activa el módulo de stylix";
  };

  config = lib.mkIf cfg.activar {
    stylix = {
      enable = true;
      base16Scheme = import ./../../lib/temaBase16.nix;
      targets = {
        yazi.enable = false;
        hyprland.enable = false;
        kitty.enable = false;
        wofi.enable = false;
        neovim.enable = false;
        dunst.enable = false;
      };
      fonts = {
        sizes = {
          applications = 11;
          desktop = 11;
          popups = 11;
          terminal = 11;
        };

        serif = {
          package = pkgs.ubuntu-classic;
          name = "Ubuntu";
        };

        sansSerif = {
          package = pkgs.ubuntu-classic;
          name = "Ubuntu";
        };

        monospace = {
          package = pkgs.iosevka;
          name = "Iosevka";
        };

        emoji = {
          package = pkgs.noto-fonts-color-emoji;
          name = "Noto Color Emoji";
        };
      };
      icons = {
        enable = true;
        package = pkgs.whitesur-icon-theme;
        dark = "WhiteSur";
        light = "WhiteSur";
      };
    };
  };
}
