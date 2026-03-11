{ ... }:

{
  security.rtkit.enable = true;

  security.doas.enable = true;
  security.sudo.enable = false;

  security.doas.extraRules = [
    {
      users = [ "yari" ];
      setEnv = [
        "LANG"
        "LC_ALL"
        "PATH"
        "HOME"
      ];
      keepEnv = true;
      persist = true;
    }
  ];

  security.pam.services.swaylock = { };
  security.pam.services.login.enableGnomeKeyring = true;

  security.polkit.enable = true;
  security.polkit.extraConfig = ''
    polkit.addRule(function (action, subject) {
      if (
        subject.isInGroup("users") &&
        [
          "org.freedesktop.login1.reboot",
          "org.freedesktop.login1.reboot-multiple-sessions",
          "org.freedesktop.login1.power-off",
          "org.freedesktop.login1.power-off-multiple-sessions",
        ].indexOf(action.id) !== -1
      ) {
        return polkit.Result.YES;
      }
    });
  '';
}
