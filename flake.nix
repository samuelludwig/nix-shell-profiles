{

  description = "Shell environments for various types of tasks";



  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };



  outputs = { self, nixpkgs, flake-utils }:
  flake-utils.lib.eachDefaultSystem (system:
  let
    pkgs = (import nixpkgs { inherit system; });

    mkEnvironment = packageSet: pkgs.mkShell {
      buildInputs = import packageSet { inherit pkgs; };
    };

    environments = {
      spreadsheets = mkEnvironment ./package-sets/record-keeping.nix;
      phpDev = mkEnvironment ./package-sets/phpDev.nix;
    };

    output = rec {
      packages = environments;
      defaultPackage = packages.spreadsheets;
    };

  in output
  );


}
