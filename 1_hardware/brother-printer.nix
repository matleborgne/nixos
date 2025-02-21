{ config, lib, pkgs, ... }:

let
  cfgpath = import /etc/nixos/cfgpath.nix;
  machine = import /etc/machine.nix;
  v = import (builtins.toPath "${cfgpath}/0_settings/${machine}-conf.nix");

in
{

  environment.systemPackages = with pkgs; [
    cups brlaser
  ];

  hardware.sane = {
    enable = true;
    brscan4 = {
      enable = true;
      # TODO : Move that line into specific config file -> not related to hardware
      netDevices = { home = { model = "DCP-L2530DW"; ip = "10.22.0.4"; }; };
    };
  };


  services.printing.enable = true;
  services.printing.drivers = [ pkgs.brlaser ];
  programs.system-config-printer.enable = true;
  
  users.users.${v.username}.extraGroups = [ "scanner" "lp" "cups" "printer" ];

}
