{ lib
, stdenv
, fetchFromGitHub
, cmake
, qt6
, copyDesktopItems
, makeDesktopItem
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "spoon-save-editor";
  version = "2.0.0";

  src = fetchFromGitHub {
    owner = "tvyrval";
    repo = "Spoon-Save-Editor";
    rev = "v${finalAttrs.version}";
    hash = "sha256-ru1T7JlUNHXv13y39H+IlmmFMcPNFnqKJ0Xxm4LEdPg=";
  };

  nativeBuildInputs = [
    cmake
    qt6.wrapQtAppsHook
    copyDesktopItems
  ];

  buildInputs = [
    qt6.qtbase
  ];

  desktopItems = [
    (makeDesktopItem {
      name = "spoon-save-editor";
      exec = "Spoon-Save-Editor";
      icon = "spoon-save-editor";
      desktopName = "Spoon Save Editor";
      genericName = "Save Editor for Splatoon";
      comment = "Save editor for Splatoon";
      categories = [ "Game" "Utility" ];
    })
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin $out/share/pixmaps

    # Copy the compiled binary into $out/bin/Spoon-Save-Editor
    if [ -f Spoon-Save-Editor ]; then
      install -Dm755 Spoon-Save-Editor $out/bin/Spoon-Save-Editor
    elif [ -f spoon-save-editor ]; then
      install -Dm755 spoon-save-editor $out/bin/Spoon-Save-Editor
    else
      find . -maxdepth 2 -type f -executable -not -name "*.so" -exec install -Dm755 {} $out/bin/Spoon-Save-Editor \;
    fi

    # Install application icon
    install -Dm644 $src/images/icon.png $out/share/pixmaps/spoon-save-editor.png

    # Copy ID definition text files alongside the binary for runtime
    if [ -d "$src/ids" ]; then
      cp -r $src/ids $out/bin/
    fi

    runHook postInstall
  '';

  meta = with lib; {
    description = "A save editor for Splatoon";
    homepage = "https://github.com/tvyrval/Spoon-Save-Editor";
    license = licenses.gpl3Only;
    platforms = platforms.linux;
    mainProgram = "Spoon-Save-Editor";
  };
})
