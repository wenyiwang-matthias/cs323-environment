{ pkgs ? import <nixpkgs> {}}:

pkgs.mkShell {
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
  '';
}
