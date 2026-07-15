{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  qt6,
  obs-studio,
}:

stdenv.mkDerivation rec {
  pname = "obs-branch-output";
  version = "1.0.9";

  src = fetchFromGitHub {
    owner = "OPENSPHERE-Inc";
    repo = "branch-output";
    rev = version;
    sha256 = "sha256-dnSRCQjVB7W93isFuW93NVQNllmRb3Xu8Vs5nFSeiOw=";
  };

  nativeBuildInputs = [
    cmake
  ];
  buildInputs = [
    obs-studio
    qt6.qtbase
  ];

  #  cmakeFlags = [
  #
  # ]
  dontWrapQtApps = true;

  postInstall = ''
    # mkdir -p $out/lib $out/share
    # mv $out/obs-plugins/64bit $out/lib/obs-plugins
    # rm -rf $out/obs-plugins
    # mv $out/data $out/share/obs
  '';

  meta = with lib; {
    description = "branch output";
    homepage = "https://github.com/OPENSPHERE-Inc/branch-output";
    maintainers = with maintainers; [ flexiondotorg ];
    license = licenses.gpl2Plus;
    platforms = [
      "x86_64-linux"
      "i686-linux"
    ];
  };
}
