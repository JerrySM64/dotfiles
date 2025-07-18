{
  lib,
  rustPlatform,
  fetchFromGitLab,
}:

rustPlatform.buildRustPackage rec {
  pname = "hourglass";
  version = "1.3";

  src = fetchFromGitLab {
    owner = "alxhr0";
    repo = "hourglass";
    rev = version;
    hash = "sha256-ZdafRzu3pOJr634GZPI+mlShvvkG0FOis0qncAjRzxw=";
  };

  cargoHash = "sha256-skXcHSqxWHiCOvvSrys3wjasKVMX/Zz5uxAJHs6dpDc=";

  meta = {
    description = "";
    homepage = "https://gitlab.com/alxhr0/hourglass";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "hourglass";
  };
}
