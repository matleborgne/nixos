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

        "org/gnome/desktop/peripherals/touchpad" = {
          tap-to-click = true;
          speed = .25;
        };

        "org/gnome/desktop/peripherals/mouse" = {
          speed = .25;
        };

#-------------------------------

      };
    };
  };
}
