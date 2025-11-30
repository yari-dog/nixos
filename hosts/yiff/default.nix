{ lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.monado = {
    enable = true;
    defaultRuntime = true;
    highPriority = true;
  };

  systemd.user.services.monado.environment = {
    STEAMVR_LH_ENABLE = "1";
    XRT_COMPOSITOR_COMPUTE = "1";
    U_PACING_COMP_MIN_TIME_MS = "5";
  };

  environment.systemPackages = with pkgs; [
    # steamvr
    procps
    usbutils
    wlx-overlay-s
    monado-vulkan-layers
    libsurvive
    basalt-monado
    wayvr-dashboard
  ];
}
