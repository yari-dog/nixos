{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

let
  # Construction du paquet cosmic-ext-alternative-startup
  cosmic-ext-alternative-startup = pkgs.rustPlatform.buildRustPackage {
    pname = "cosmic-ext-alternative-startup";
    version = "0.1.0";
    src = inputs.cosmic-ext-alternative-startup;

    cargoLock = {
      lockFile = "${inputs.cosmic-ext-alternative-startup}/Cargo.lock";
    };

    nativeBuildInputs = with pkgs; [ pkg-config ];
    buildInputs = with pkgs; [ libxkbcommon ];

    meta = with lib; {
      description = "Alternative startup extension for COSMIC Desktop";
      homepage = "https://github.com/Drakulix/cosmic-ext-alternative-startup";
      license = licenses.gpl3;
      platforms = platforms.linux;
    };
  };
in
{
  environment.systemPackages = [ cosmic-ext-alternative-startup ];
}
