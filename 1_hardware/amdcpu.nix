{ config, lib, pkgs, ... }:

{

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  boot = {
    kernelParams = [ "initcall_blacklist=acpi_cpufreq_init" ];
    kernelModules = [ "amd-pstate" "kvm-amd" ];
  };

}
