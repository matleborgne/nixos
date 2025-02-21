{ config, lib, pkgs, ... }:

{

  # Version stable 24.05
  # Dans les futures versions, remplacer hardware.opengl par hardware.graphics
  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      rocmPackages.clr.icd
    ];
  };  

#  hardware.hardware.extraPackages = with pkgs; [
#      rocmPackages.rocm-core
#      rocmPackages.rocm-runtime
#      rocmPackages.clr
#      rocmPackages.rpp-opencl
#      rocmPackages.rpp-hip
#    ];


  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Force RADV (vulkan-radeon) over amdvlk - via environment variable
  environment.variables.AMD_VULKAN_ICD = lib.mkDefault "RADV";

  # High Performance Software
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

}
