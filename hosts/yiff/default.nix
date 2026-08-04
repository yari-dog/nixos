{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./resolve.nix
  ];

  hardware.amdgpu.initrd.enable = true;
  hardware.enableRedistributableFirmware = true;

  boot.kernelParams = [
    "video=DP-1:3440x1440@143.923"
    "video=DP-2:3440x1440@75.050"
  ];

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      mesa.opencl # Enables Rusticl (OpenCL) support
      nvidia-vaapi-driver
    ];
  };

  hardware.amdgpu.opencl.enable = true;
  hardware.amdgpu.zluda.enable = true;

  hardware.nvidia = {
    open = false;
    # package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
    branch = "legacy_580";
    modesetting.enable = true;
    powerManagement.enable = true;
    nvidiaPersistenced = false;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # services.monado = {
  #   enable = true;
  #   defaultRuntime = true;
  #   highPriority = true;
  # };
  #
  # systemd.user.services.monado.environment = {
  #   STEAMVR_LH_ENABLE = "1";
  #   XRT_COMPOSITOR_COMPUTE = "1";
  #   U_PACING_COMP_MIN_TIME_MS = "5";
  # };

  environment.systemPackages = with pkgs; [
    # steamvr
    procps
    usbutils
    # wlx-overlay-s
    # monado-vulkan-layers
    # libsurvive
    # basalt-monado
    # wayvr-dashboard
    (xivlauncher-rb.override { useGameMode = true; })
    clinfo
    vtfedit
    liquidctl
  ];
}
