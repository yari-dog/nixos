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
}
