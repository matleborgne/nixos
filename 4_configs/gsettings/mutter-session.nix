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
        "org/gnome/mutter" = {
          dynamic-workspaces = true;
          workspaces-only-on-primary = true;
        };

        "org/gnome/desktop/session" = {
          idle-delay = lib.hm.gvariant.mkUint32 0;
        };

        "org/gnome/terminal/legacy" = {
          theme-variant = "dark";
        };

        "org/gnome/settings-daemon/plugins/power" = {
          sleep-inactive-battery-type = "nothing";
          sleep-inactive-ac-type = "nothing";
        };

#-------------------------------

      };
    };
  };
}
