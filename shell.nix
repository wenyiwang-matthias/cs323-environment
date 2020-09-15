{ pkgs ? import <nixpkgs> {}}:

pkgs.stdenv.mkDerivation {
  name = "cs323";
  CAT_OUTPUT_DIR = ./. + "/CAT";
  buildInputs = with pkgs; [
    pre-commit
    llvm_9
    clang_9
    cmake
    shellcheck
    cppcheck
  ];
  shellHook = ''
    if [ -d "$PWD"/.git ] && [ ! -f "$PWD"/.git/hooks/pre-commit ]; then
      pre-commit install
    fi
    export CAT_OUTPUT_DIR="$PWD/CAT"
    export PATH="$CAT_OUTPUT_DIR/bin:$PATH"
  '';
}
