{ config, pkgs, ... }:

{
  imports = [
    {
      config.modulosNixos = {
        hyprland.activar = true;
      };
    }
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  hardware = {
    graphics.enable = true;
    bluetooth.enable = true;
  };

  services = {
    displayManager.gdm.enable = true;
    gvfs.enable = true;
    upower.enable = true;
  };

  programs.steam.enable = true;
  hardware.steam-hardware.enable = true;
}
