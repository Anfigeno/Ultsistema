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

  services.displayManager.gdm.enable = true;
  services.gvfs.enable = true;

  networking.networkmanager = {
    enable = true;
    settings = {
      connection-wifi = {
        match-device = "type:wifi";
        "ipv4.route-metric" = 100;
        "ipv6.route-metric" = 100;
      };

      connection-ethernet = {
        match-device = "type:ethernet";
        "ipv4.route-metric" = 400;
        "ipv6.route-metric" = 400;
      };
    };
  };
}
