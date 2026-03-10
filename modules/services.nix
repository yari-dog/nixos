{ pkgs, ... }:
{
  services.lact.enable = true;

  services.ratbagd.enable = true;

  services.irqbalance.enable = true;

  services.flatpak.enable = true;

  services.udev = {
    packages = with pkgs; [

      qmk
      qmk-udev-rules
      via
      vial
    ];
    extraRules = ''
            KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="6964", ATTRS{idProduct}=="0075", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl" 
      SUBSYSTEM=="usb", ATTR{idVendor}=="096e", TAG+="uaccess"
      SUBSYSTEM=="usb", ATTR{idVendor}=="096e", MODE="0664", GROUP="users"
    '';
  };
  services.mpd.enable = true;
  # services.usbmuxd.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
    # If you want to use JACK applications, uncomment this

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  services.tailscale.enable = true;
  networking.firewall.checkReversePath = "loose";

  services.udisks2.enable = true;

  services.gvfs.enable = true;
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # disable mouse accel ? maybe ?
  services.libinput = {
    enable = true;
    mouse = {
      accelProfile = "flat";
    };
  };

  # services.displayManager.gdm.enable = true;
  services.displayManager.lemurs.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.epson-escpr2 ];
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
}
