{ pkgs }:
with pkgs;
let
  dev-tools = (import ./dev-tools.nix { inherit pkgs; });
  silerOverlay = final: prev: {
    php80 = php80;
  };
in
[
  php80
  php80Packages.psysh
  # Add composer2nix?
  # php80Packages.siler <- figure out how to add it
]
++ dev-tools
