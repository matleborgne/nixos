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

#-------------------------------

      };
    };
  };
}
