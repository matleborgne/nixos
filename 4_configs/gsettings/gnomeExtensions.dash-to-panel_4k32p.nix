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

        "org/gnome/shell/extensions/dash-to-panel" = {
          dot-style-focused = "DASHES";
          dot-style-unfocused = "DOTS";
          dot-position = "TOP";
          focus-highlight-opacity = 15;
          panel-sizes = ''{"0":40,"1":40}'';
          panel-positions = ''{"0":"TOP","1":"TOP"}'';
          stockgs-keep-dash = true;
          trans-panel-opacity = 0.0;
          trans-use-custom-opacity = true;
          animate-appicon-hover = false;
          appicon-padding = 4;
          appicon-margin = 1;
          show-favorites = false;
          show-activities-button = false;
          tray-size = 20;
          status-icon-padding = 4;
          panel-element-positions = ''{"0":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":true,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"dateMenu","visible":true,"position":"centerMonitor"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":false,"position":"stackedBR"}],"1":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":true,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"dateMenu","visible":true,"position":"centerMonitor"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":false,"position":"stackedBR"}]}'';
        };

#-------------------------------

      };
    };
  };
}
