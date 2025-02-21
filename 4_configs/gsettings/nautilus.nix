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

        "org/gnome/nautilus/preferences" = {
          show-hidden-files = true;
          show-delete-permanently = true;
          show-create-link = true;
          default-folder-viewer = "list-view";
        };

        "org/gnome/nautilus/list-view" = {
          default-zoom-level = "small";
          default-visible-columns = "['name', 'size', 'type', 'owner', 'group', 'permissions', 'date_modified', 'starred']";
        };

        "org/gtk/Settings/FileChooser" = {
          show-hidden = true;
          sort-directories-first = true;
        };

#-------------------------------

      };
    };
  };
}
