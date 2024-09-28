{pkgs ? import <nixpkgs> {}}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "evremap";
  version = "cc618e8b973f5c6f66682d1477b3b868a768c545";
  src = pkgs.fetchFromGitHub {
    owner = "wez";
    repo = pname;
    rev = version;
    hash = "sha256-aAAnlGlSFPOK3h8UuAOlFyrKTEuzbyh613IiPE7xWaA=";
  };

  cargoHash = "sha256-RoATm6snxb6tX7ii6qpr/4qNFv+KGDkJCox/+/Wj46w=";

  # NOTE: If i am not mistaken, buildInputs are runtime deps, while nativeBuildInputs are compiletime deps
  buildInputs = [
    pkgs.libevdev
  ];

  nativeBuildInputs = [
    pkgs.pkg-config
  ];

  meta = with pkgs.lib; {
    description = "A keyboard input remapper for Linux/Wayland systems, written by @wez";
    homepage = "https://github.com/wez/evremap";
    license = licenses.mit;
  };
}
