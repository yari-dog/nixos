{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

let
  originalScript = builtins.readFile "${inputs.cosmic-ext-extra-sessions}/niri/start-cosmic-ext-niri";

  modifiedScript =
    builtins.replaceStrings
      [
        "/usr/bin/bash"
        "/usr/bin/cosmic-session niri"
        "/usr/bin/dbus-run-session niri"
        # "exec dbus-run-session -- cosmic-session niri"
        # "exec cosmic-session niri"
      ]
      [
        "${pkgs.bash}/bin/bash"
        "cosmic-session niri --session"
        "dbus-run-session niri --session"
        # "exec dbus-run-session -- cosmic-session niri --session"
        # "exec cosmic-session niri --session"
      ]
      originalScript;

  originalDesktop = builtins.readFile "${inputs.cosmic-ext-extra-sessions}/niri/cosmic-ext-niri.desktop";

  modifiedDesktop =
    builtins.replaceStrings [ "/usr/local/bin/start-cosmic-ext-niri" ] [ "start-cosmic-ext-niri" ]
      originalDesktop;

  scriptPackage = pkgs.writeScriptBin "start-cosmic-ext-niri" modifiedScript;

  cosmicNiriDesktop = pkgs.writeTextFile {
    name = "cosmic-niri.desktop";
    destination = "/share/wayland-sessions/cosmic-niri.desktop";
    text = modifiedDesktop;
  };

  cosmicExtNiriSession = pkgs.symlinkJoin {
    name = "cosmic-ext-niri-session";
    paths = [
      scriptPackage
      cosmicNiriDesktop
    ];
    # Spécifier les noms des sessions fournies
    passthru.providedSessions = [ "cosmic-niri" ];
  };
in
{
  environment.systemPackages = [
    cosmicExtNiriSession
  ];

  services.displayManager.sessionPackages = [ cosmicExtNiriSession ];
}
