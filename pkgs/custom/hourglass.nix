# https://gitlab.com/Alxhr0/hourglass/-/archive/1.2/hourglass-1.2.tar
{ lib, rustPlatform, fetchFromGitLab }:

rustPlatform.buildRustPackage rec {
  pname = "hourglass";
  version = "1.2";

  src = fetchFromGitLab {
    owner = "alxhr0";
    repo = "hourglass";
    rev = "${version}";
    hash = "sha256-3LKCKQr7KwGS+HeOmmK3pbW0wYdDihnSAyi8IDANSxw=";
  };

  cargoHash = "sha256-igdwaGrYGLsarAdcvjBAPHt8saOx+BV/XM04nbnpp+I=";

  meta = {
    description = "";
    homepage = "https://gitlab.com/alxhr0/hourglass";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ alxhr0 ];
    mainProgram = "hourglass";
  };
}

