{ config, lib, pkgs, ... }:

let
  cfgpath = import /etc/nixos/cfgpath.nix;
  machine = import /etc/machine.nix;
  v = import (builtins.toPath "${cfgpath}/0_settings/${machine}-conf.nix");

in
{
  home-manager.users.${v.username} = { lib, ... }: {
    dconf = {
      settings = {

#-------------------------------
# Insert DCONF here
#-------------------------------

        "org/gnome/shell/extensions/vitals" = {
          update-time = 3;
          hide-icons = true;
          fixed-widths = true;
          show-system = false;
          show-fan = false;
          show-voltage = false;
          show-network = false;
          show-storage = false;
          show-battery = true;
          battery-slot = 1;
        };

#-------------------------------

      };
    };
  };
}
