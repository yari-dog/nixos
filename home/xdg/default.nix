{ lib, ... }:
{
  xdg.autostart.entries = lib.mkDefault [
    ./com.valvesoftware.Steam.desktop
  ];
}
