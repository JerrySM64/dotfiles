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
, cacert
}:

let
  curlHttp1 = curl.override { http2Support = false; };
in
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
      curlHttp1
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
      "-DPORTABLE=OFF"
      "-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
    ];

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin $out/share/Cemu $out/share/icons/hicolor/128x128/apps

      cemu_bin=$(find . .. -type f \( -name "Cemu_release" -o -name "Cemu" -o -name "CemuBin" -o -name "cemu" \) -executable | head -n 1)
      if [ -n "$cemu_bin" ]; then
        install -Dm755 "$cemu_bin" $out/bin/Cemu
      else
        echo "Error: Could not locate compiled Cemu executable!" >&2
        exit 1
      fi

      # Install resources and gameProfiles directly from source into both $out/bin and $out/share/Cemu
      if [ -d "$src/resources" ]; then
        cp -r "$src/resources" $out/bin/
        cp -r "$src/resources" $out/share/Cemu/
      fi
      if [ -d "$src/gameProfiles" ]; then
        cp -r "$src/gameProfiles" $out/bin/
        cp -r "$src/gameProfiles" $out/share/Cemu/
      fi

      ln -s $out/share/Cemu $out/share/cemu

      install -Dm644 $src/dist/linux/info.cemu.Cemu.png $out/share/icons/hicolor/128x128/apps/cemu.png
      runHook postInstall
    '';

  preFixup = ''
    gappsWrapperArgs+=(
      --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath [ vulkan-loader libX11 libXrandr bluez systemd ]}"
      --set SDL_JOYSTICK_HIDAPI_SWITCH "1"
      --set NIX_SSL_CERT_FILE "${cacert}/etc/ssl/certs/ca-certificates.crt"
      --set SSL_CERT_FILE "${cacert}/etc/ssl/certs/ca-certificates.crt"
      --set CURL_CA_BUNDLE "${cacert}/etc/ssl/certs/ca-certificates.crt"
    )
  '';

  postFixup = ''
    ln -sf $out/bin/Cemu $out/bin/cemu
    ln -sf $out/bin/Cemu $out/bin/Cemu_release
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
