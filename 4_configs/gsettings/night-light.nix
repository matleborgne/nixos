{ config, lib, pkgs, ... }:

{
  "org/gnome/settings-daemon/plugins/color" = {
    night-light-enabled = true;
    night-light-temperature = lib.hm.gvariant.mkUint32 4700;          
    night-light-schedule-to = lib.hm.gvariant.mkDouble 3.9999;
    night-light-schedule-from = lib.hm.gvariant.mkDouble 4.00;
    night-light-schedule-automatic = false;
  };
}
