{ config, pkgs, ... }:

{
  # Fonts
  fonts = {
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk
      noto-fonts-extra
      ipafont
      (nerdfonts.override { fonts = [ "SourceCodePro" "SpaceMono" ]; })
    ];

    fontDir.enable = true;
  };

  # Packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    neovim
    wget
    plasma-desktop
    libsForQt5.qtstyleplugin-kvantum
    flatpak
    git
    nodejs
    zsh
    networkmanager
    xclip
    python310Full
    rtw89-firmware
  ];
}
