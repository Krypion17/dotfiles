{ config, pkgs, ... }:

{
  networking = {
    hostName = "nixos";

    # wireless.enable = false;

    networkmanager = {
      enable = true;

      wifi = {
        powersave = false;
      };
    };

    useDHCP = false;

    interfaces = {
      eno1.useDHCP = true;
      wlan0.useDHCP = true;
    };
  };

}
