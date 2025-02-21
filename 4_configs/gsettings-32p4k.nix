{ config, lib, pkgs, ... }:

let
  cfgpath = import /etc/nixos/cfgpath.nix;
  machine = import /etc/machine.nix;

  config = import (builtins.toPath "${cfgpath}/0_settings/${machine}-conf.nix");
  username = config.username; 


in

{
  home-manager.users.${username} = { lib, ... }: {

    dconf = {
      enable = true;
      settings = {

        # Mouse and touchpad
        "org/gnome/desktop/peripherals/touchpad" = {
          tap-to-click = true;
          speed = .25;
        };

        "org/gnome/desktop/peripherals/mouse" = {
          speed = .25;
        };
          

        # Mutter / session
        "org/gnome/mutter" = {
          dynamic-workspaces = true;
          workspaces-only-on-primary = true;
        };

        "org/gnome/desktop/session" = {
          idle-delay = lib.hm.gvariant.mkUint32 0;
        };

        "org/gnome/desktop/background" = {
          picture-uri = "file:///home/wallpaper.jpg";
          picture-uri-dark = "file:///home/wallpaper.jpg";         
        };

        "org/gnome/terminal/legacy" = {
          theme-variant = "dark";
        };
        

        # Night mode
        "org/gnome/settings-daemon/plugins/color" = {
          night-light-enabled = true;
          night-light-temperature = lib.hm.gvariant.mkUint32 4700;          
          night-light-schedule-to = lib.hm.gvariant.mkDouble 3.9999;
          night-light-schedule-from = lib.hm.gvariant.mkDouble 4.00;
          night-light-schedule-automatic = false;
        };


        # Veille
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

        # Virt-manager
        "org/virt-manager/virt-manager" = {
          enable-libguestfs-vm-inspection = true;
          xmleditor-enabled = true;
        };

        "org/virt-manager/virt-manager/console" = {
          resize-guest = lib.hm.gvariant.mkUint32 1;
        };

        "org/virt-manager/virt-manager/details" = {
          show-toolbar = false;
        };

        "org/virt-manager/virt-manager/paths" = {
          image-default = "~/.local/share/libvirt/images";
        };


        # Nautilus
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


        # Epiphany
        "org/gnome/Epiphany/web" = {
          enable-webextensions = true;
        };


        # TextEditor
        "org/gnome/TextEditor" = {
          restore-session = false;
          show-line-numbers = true;
          discover-settings = false;
        };

        # Scanner
        "org/gnome/SimpleScan" = {
          jpeg-quality = lib.hm.gvariant.mkUint32 23;
        };


        # Activation des extensions
        "org/gnome/shell" = {
          disable-user-extensions = false;
          disabled-extensions = "disabled";
          enabled-extensions = [
            "pop-shell@system76.com"
            #"forge@jmmaranan.com"
            "user-theme@gnome-shell-extensions.gcampax.github.com"
            "appindicatorsupport@rgcjonas.gmail.com"
            "dash-to-panel@jderose9.github.com"
            "just-perfection-desktop@just-perfection"
            "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
            "Vitals@CoreCoding.com"
            #"smart-auto-move@khimaros.com"
          ];
          favorite-apps = [
            "librewolf.desktop"
            "thunderbird.desktop"
            "org.gnome.Nautilus.desktop"
            "virt-manager.desktop"
            "distro-manager.desktop"
            "separator1.desktop"
            "lw-dgfip.desktop"
            "codium.desktop"
            "drawio.desktop"
            "separator2.desktop"
            "blender.desktop"
            "steam.desktop"
            "discord.desktop"
            "lw-youtube.desktop"
            "separator3.desktop"
          ];
        };


        # Just perfection
        "org/gnome/shell/extensions/just-perfection" = {
          #animation = 4;
          search = false;
        };


        # User theme
        "org/gnome/shell/extensions/user-theme" = {
          name = "Fluent-round-Dark";
        };
        

#        # Forge
#        "org/gnome/shell/extensions/forge" = {
#          window-gap-size = lib.hm.gvariant.mkUint32 7;
#          focus-border-toggle = false;
#          move-pointer-focus-enabled = false;
#        };

        # Pop shell
        "org/gnome/shell/extensions/pop-shell" = {
          tile-by-default = true;
          gap-inner = lib.hm.gvariant.mkUint32 4;
          gap-outer = lib.hm.gvariant.mkUint32 4;
        };


        # Vitals
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
        

        # Appindicator
        "org/gnome/shell/extensions/appindicator" = {
          tray-pos = "center";
          icon-brightness = -0.3;
        };
        

        # Dash to panel
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


        
      };
    };
  };


}
