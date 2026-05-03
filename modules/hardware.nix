{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.steam-hardware.enable = true;
  hardware.firmware = [ pkgs.linux-firmware ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
        FastConnectable = true;
        #uncomment after first connec
        Enable = "Source,Sink,Media,Socket";
        # ControllerMode = "bredr";
      };
      Police = {
        AutoEnable = true;
      };
    };
  };

  hardware.keyboard.qmk.enable = true;
}
