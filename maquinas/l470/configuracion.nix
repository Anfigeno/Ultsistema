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

  services.flatpak.enable = true;
  services.displayManager.gdm.enable = true;
  services.gvfs.enable = true;
}
