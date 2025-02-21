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

        "org/gnome/Epiphany/web" = {
          enable-webextensions = true;
        };

#-------------------------------

      };
    };
  };
}
