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
    utils = (import ./utils.nix { inherit pkgs; });

    environments = {
      spreadsheets = utils.mkEnvironment ./package-sets/record-keeping.nix;
      phpDev = utils.mkEnvironment ./package-sets/php-dev.nix;
    };

    output = rec {
      packages = environments;
      defaultPackage = packages.spreadsheets;
    };

  in output
  );


}
