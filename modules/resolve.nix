{
  pkgs,
  lib,
  ...
}:

# let
#   davinci-resolve-studio = pkgs.davinci-resolve-studio.overrideAttrs (oldAttrs: {
#     postFixup = (oldAttrs.postFixup or "") + ''
#       		sh -c "cd $out/libs && mkdir disabled-libraries && mv libglib* libgio* libgmodule* disabled-libraries"
#       		echo "HEY PETER stage 1: $out"
#       		perl -pi -e 's/\x03\x00\x89\x45\xFC\x83\x7D\xFC\x00\x74\x11\x48\x8B\x45\xC8\x8B/\x03\x00\x89\x45\xFC\x83\x7D\xFC\x00\xEB\x11\x48\x8B\x45\xC8\x8B/' $out/bin/resolve
#
#       		echo 2/3
#       		perl -pi -e 's/\x74\x11\x48\x8B\x45\xC8\x8B\x55\xFC\x89\x50\x58\xB8\x00\x00\x00/\xEB\x11\x48\x8B\x45\xC8\x8B\x55\xFC\x89\x50\x58\xB8\x00\x00\x00/' $out/bin/resolve
#
#       		echo 3/3
#       		perl -pi -e 's/\x41\xb6\x01\x84\xc0\x0f\x84\xb0\x00\x00\x00\x48\x85\xdb\x74\x08\x45\x31\xf6\xe9\xa3\x00\x00\x00/\x41\xb6\x00\x84\xc0\x0f\x84\xb0\x00\x00\x00\x48\x85\xdb\x74\x08\x45\x31\xf6\xe9\xa3\x00\x00\x00/' $out/bin/resolve
#
#       		echo -e 'LICENSE blackmagic davinciresolvestudio 999999 permanent uncounted\n  hostid=ANY issuer=CGP customer=CGP issued=28-dec-2023\n  akey=0000-0000-0000-0000 _ck=00 sig=\"00\"' | tee $out/.license/blackmagic.lic
#       		'';
#   });
#
#   # davinci-resolve-studio = pkgs.davinci-resolve-studio.override {
#   #   inherit davinci-resolve-studio;
#   # };
# in

{
  environment.systemPackages = with pkgs; [
    # (davinci-resolve-studio.overrideAttrs (_: {
    #   src = ./resolve-build.nix;
    # }))
    (pkgs.callPackage ./resolve-build.nix { studioVariant = true; })
  ];
}

# license can go in .local/share/DaVinciResolve/license
