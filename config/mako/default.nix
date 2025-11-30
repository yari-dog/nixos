{ inputs, pkgs, ... }:

{
  services.mako = {
    enable = true;
    settings = {
      anchor = "bottom-left";
      layer = "overlay";
      width = 800;
      height = 32;
      margin = 0;

      on-button-left = "dismiss";
      on-button-right = "none";

      background-color = "#504945FF";
      border-color = "#504945FF";
      progress-color = "source #d3869b";
      text-color = "#ebdbb2";

      default-timeout = 5000;
      max-visible = 5;

      icons = 1;
      max-icon-size = 25;
      icon-location = "right";

      markup = 1;

      "mode=do-not-disturb" = { invisible = 1; };
    };
  };
}
