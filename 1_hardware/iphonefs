{ config, lib, pkgs, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in
{
  services.usbmuxd.enable = true;

  environment.systemPackages = with pkgs; [
    unstable.libheif
    libimobiledevice
    ifuse # optional, to mount using 'ifuse /home/mleborgne/iphone'
  ];

}
