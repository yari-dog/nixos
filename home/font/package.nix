{
  lib,
  stdenv,
  fetchzip,
  unzip,
}:

stdenv.mkDerivation rec {
  pname = "sarasa-gothic-nerd-fonts";
  version = "1.0.37-0";

  srcs = [
    (fetchzip {
      stripRoot = false;
      url = "https://github.com/jonz94/Sarasa-Gothic-Nerd-Fonts/releases/download/v${version}/sarasa-fixed-j-nerd-font.zip";
      hash = "sha256-US3lsp5xHyOYaDFS/2klsd4+ognWey5sNkbfugIGbEQ=";
      name = "fixed";
    })

    (fetchzip {
      stripRoot = false;
      url = "https://github.com/jonz94/Sarasa-Gothic-Nerd-Fonts/releases/download/v${version}/sarasa-fixed-slab-j-nerd-font.zip";
      hash = "sha256-tH6MyW0f5V/gRyKPTQDNChJ2NtsGtnuntHc8ci7gZk0=";
      name = "fixed-slab";
    })

    (fetchzip {
      stripRoot = false;
      url = "https://github.com/jonz94/Sarasa-Gothic-Nerd-Fonts/releases/download/v${version}/sarasa-gothic-j-nerd-font.zip";
      hash = "sha256-9cN7ySXMaqUO+VrdFlwMPfX+G+F4W78oBlfpGAbYHZ4=";
      name = "gothic";
    })

    (fetchzip {
      stripRoot = false;
      url = "https://github.com/jonz94/Sarasa-Gothic-Nerd-Fonts/releases/download/v${version}/sarasa-mono-j-nerd-font.zip";
      hash = "sha256-i5uK5WPcdlbByK3B8yKxd3Jp5iDG6nROYQ0QXKbjF0k=";
      name = "mono";
    })

    (fetchzip {
      stripRoot = false;
      url = "https://github.com/jonz94/Sarasa-Gothic-Nerd-Fonts/releases/download/v${version}/sarasa-mono-slab-j-nerd-font.zip";
      hash = "sha256-Y+bx1PF5V5vKFqgc7BYOsMOOclXwRuows3LOwoiXuFA=";
      name = "mono-slab";
    })

    (fetchzip {
      stripRoot = false;
      url = "https://github.com/jonz94/Sarasa-Gothic-Nerd-Fonts/releases/download/v${version}/sarasa-term-j-nerd-font.zip";
      hash = "sha256-UZpo7RYPfO40RFXZkDfeQsD9a07INDM6Ue9ILwoLihQ=";
      name = "term";
    })

    (fetchzip {
      stripRoot = false;
      url = "https://github.com/jonz94/Sarasa-Gothic-Nerd-Fonts/releases/download/v${version}/sarasa-term-slab-j-nerd-font.zip";
      hash = "sha256-EFtaNfUlClWaof3idxOJuAQt+25JVRLbcACrMQFnvKY=";
      name = "term-slab";
    })

    (fetchzip {
      stripRoot = false;
      url = "https://github.com/jonz94/Sarasa-Gothic-Nerd-Fonts/releases/download/v${version}/sarasa-ui-j-nerd-font.zip";
      hash = "sha256-a2ChcQzafWfm8x5kzS55ZQwZpEmqUN76Ei2tcnHTzHU=";
      name = "ui";
    })
  ];

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/truetype
    install -m444 -Dt $out/share/fonts/truetype ${lib.concatMapStrings (x: x + "/*.ttf ") srcs}

    runHook postInstall
  '';

}
