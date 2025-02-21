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

        # Raccourcis
        "org/gnome/desktop/wm/keybindings" = {
          move-to-workspace-left = ["<Alt><Shift>Left"];
          move-to-workspace-right = ["<Alt><Shift>Right"];
          switch-to-workspace-left = ["<Alt>Left"];
          switch-to-workspace-right = ["<Alt>Right"];
        };

        # UI divers
        "org/gnome/desktop/interface" = {
          text-scaling-factor = lib.hm.gvariant.mkDouble 1.3;
          clock-show-weekday = true;
          font-name = "Ubuntu Regular 11";
          document-font-name = "Ubuntu Regular 11";
          monospace-font-name = "Ubuntu Mono Regular 12";
          gtk-theme = "adw-gtk3";
          icon-theme = "Papirus";
        }; 

        "org/gnome/desktop/wm/preferences" = {
          button-layout = ":minimize,close";
          titlebar-font = "Ubuntu Bold 11";
        };

#-------------------------------

      };
    };
  };
}
