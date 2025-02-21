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

        "org/gnome/settings-daemon/plugins/color" = {
          night-light-enabled = true;
          night-light-temperature = lib.hm.gvariant.mkUint32 4700;          
          night-light-schedule-to = lib.hm.gvariant.mkDouble 3.9999;
          night-light-schedule-from = lib.hm.gvariant.mkDouble 4.00;
          night-light-schedule-automatic = false;
        };

#-------------------------------

      };
    };
  };
}
