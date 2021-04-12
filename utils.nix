{ pkgs }:
{
  mkEnvironment = packageSet: pkgs.mkShell {
    buildInputs = import packageSet { inherit pkgs; };
  };
}
