{ lib, pkgs, ... }:

{
  boot.kernelModules = [ "uinput" ];
  hardware.uinput.enable = true;

  # Set up udev rules for uinput
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';

  # Ensure the uinput group exists
  users.groups.uinput = { };

  # Add the Kanata service user to necessary groups
  systemd.services.kanata-internalKeyboard.serviceConfig = {
    SupplementaryGroups = [ "input" "uinput" ];
  };

  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [
          "/dev/input/by-path/pci-0000:05:00.3-usbv2-0:4:1.0-event-kbd "
          "/dev/input/by-path/pci-0000:05:00.3-usb-0:4:1.0-event-kbd"
        ];
        extraDefCfg = ''
          process-unmapped-keys yes
                  concurrent-tap-hold yes'';
        # have to use pre-xkb maps (qwerty)
        config = ''
          (defsrc
            j k l Semicolon
            IntlBackslash z x c v n m Comma Period Slash
          )
          (deflayer default
          _ _ _ _
          @sft1 @ctl1 @alt1 @fn1 @met1 @met2 @fn2 @alt2 @ctl2 @sft2

          )
          (deflayer fn-layer
            left down up right _
            _ _ _ _ _ _ _ _ _
          )
          (defalias
           fn1 (tap-hold $tap-time $hold-time c (layer-toggle fn-layer))
           fn2 (tap-hold $tap-time $hold-time m (layer-toggle fn-layer))
           met1 (tap-hold $tap-time $hold-time v lmet)
           met2 (tap-hold $tap-time $hold-time n rmet)
           alt1 (tap-hold $tap-time $hold-time x lalt)
           alt2 (tap-hold $tap-time $hold-time Comma lalt)
           ctl1 (tap-hold $tap-time $hold-time z lctl)
           ctl2 (tap-hold $tap-time $hold-time Period rctl)
           sft1 (tap-hold $tap-time $hold-time IntlBackslash lsft)
           sft2 (tap-hold $tap-time $hold-time Slash rsft)
          )
          (defvar
          tap-time 160
          hold-time 160
          )
          (defchordsv2
            (q w) esc $tap-time all-released ()
          )
        '';
      };
    };
  };
}
