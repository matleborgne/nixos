{ config, lib, pkgs, ... }:

{

  hardware.graphics = {
    enable = true;

    driSupport = lib.mkDefault true;
    extraPackages = with pkgs; [
      vaapiVdpau
    ];

    driSupport32Bit = lib.mkDefault true;
    extraPackages32 = with pkgs; [
      driversi686Linux.vaapiVdpau
    ];

  };


  services.xserver.videoDrivers = lib.mkDefault [ "nvidia" ];
  boot.kernelParams = [ "module_blacklist=amdgpu,i915" ];

  hardware.nvidia = {
    modesetting.enable = true;

    # Driver version : stable, beta, production (older), vulkan_beta, legacy_... (check nixpkgs website)
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # Enable the Nvidia settings menu, accessible via `nvidia-settings`
    nvidiaSettings = true;


    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

  };

}
