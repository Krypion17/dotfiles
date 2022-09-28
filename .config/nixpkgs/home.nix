{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "krypion17";
  home.homeDirectory = "/home/krypion17";

  # Packages
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    firefox
    thunderbird
    steam
    kitty
    discord
    ventoy-bin
    eww
    rofi
    picom
    lxappearance
    # haskellPackages.xmonad haskellPackages.xmonad-contrib xdotool
    neofetch
    flameshot
    wine
    grapejuice
    spotify
    spotdl
    ytmdl
    element-desktop
    #aseprite-unfree
    feh
    #lutris
    baobab
    lightly-qt
    # latte-dock
    amberol
    blanket
    kcalc
    libreoffice
    minecraft
    playerctl
    inkscape
    opendrop
    gparted
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
