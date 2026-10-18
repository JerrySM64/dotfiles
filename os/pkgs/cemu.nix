# I know there is a cemu package in nixpkgs, but it has issues with BOSS (SpotPass).
{ lib
, stdenv
, fetchFromGitHub
, cmake
, nasm
, ninja
, pkg-config
, wrapGAppsHook3
, copyDesktopItems
, makeDesktopItem
, bluez
, boost
, cubeb
, curl
, fmt
, glslang
, glm
, gtk3
, hidapi
, libarchive
, libpng
, libusb1
, libzip
, openssl
, pugixml
, rapidjson
, SDL2
, systemd
, vulkan-headers
, vulkan-loader
, wayland
, wayland-protocols
, wayland-scanner
, wxwidgets_3_2
, zstd
, gamemode
, libX11
, libXrandr
, libXext
, libXi
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "cemu";
  version = "2.6";

  src = fetchFromGitHub {
    owner = "cemu-project";
    repo = "Cemu";
    rev = "v${finalAttrs.version}";
    hash = "sha256-d8tnq+Cyjnh3sEn75MLL8Q7agzT1tDZEsDANIe0KK5s=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    cmake
    nasm
    ninja
    pkg-config
    wrapGAppsHook3
    copyDesktopItems
    wayland-scanner
  ];

  buildInputs = [
    bluez
    boost
    cubeb
    curl
    fmt
    glslang
    glm
    gtk3
    hidapi
    libarchive
    libpng
    libusb1
    libzip
    openssl
    pugixml
    rapidjson
    SDL2
    systemd
    vulkan-headers
    vulkan-loader
    wayland
    wayland-protocols
    wxwidgets_3_2
    zstd
    gamemode
    libX11
    libXrandr
    libXext
    libXi
  ];

  cmakeFlags = [
    "-DENABLE_VCPKG=OFF"
    "-DENABLE_WXWIDGETS=ON"
    "-DCEMU_ARCH=x86-64"
    "-DENABLE_WAYLAND=ON"
    "-DENABLE_FERAL_GAMEMODE=ON"
    "-DENABLE_DISCORD_RPC=ON"
    "-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin $out/share/cemu $out/share/icons/hicolor/128x128/apps

    # Dynamically locate the executable regardless of where CMake placed it
    cemu_bin=$(find . .. -type f \( -name "Cemu_release" -o -name "Cemu" -o -name "CemuBin" -o -name "cemu" \) -executable | head -n 1)

    if [ -n "$cemu_bin" ]; then
      install -Dm755 "$cemu_bin" $out/bin/Cemu
    else
      echo "Error: Could not locate compiled Cemu executable!" >&2
      exit 1
    fi

    # Symlinks for binary execution
    ln -s $out/bin/Cemu $out/bin/cemu
    ln -s $out/bin/Cemu $out/bin/Cemu_release

    # Copy resources & game profiles
    for res in resources gameProfiles; do
      res_dir=$(find . .. -maxdepth 3 -type d -name "$res" | head -n 1)
      if [ -n "$res_dir" ]; then
        cp -r "$res_dir" $out/bin/
        cp -r "$res_dir" $out/share/cemu/
      fi
    done

    # Desktop icon
    install -Dm644 $src/dist/linux/info.cemu.Cemu.png $out/share/icons/hicolor/128x128/apps/cemu.png

    runHook postInstall
  '';

  preFixup = ''
    gappsWrapperArgs+=(
      --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath [ vulkan-loader libX11 libXrandr bluez systemd ]}"
      --set SDL_JOYSTICK_HIDAPI_SWITCH "1"
    )
  '';

  desktopItems = [
    (makeDesktopItem {
      name = "info.cemu.Cemu";
      exec = "Cemu";
      icon = "cemu";
      comment = "Wii U Emulator";
      desktopName = "Cemu";
      categories = [ "Game" "Emulator" ];
    })
  ];

  meta = with lib; {
    description = "Cemu Wii U emulator";
    homepage = "https://cemu.info/";
    license = licenses.mpl20;
    maintainers = [ ];
    platforms = [ "x86_64-linux" ];
    mainProgram = "Cemu";
  };
})
