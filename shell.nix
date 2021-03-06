{ pkgs ? import <nixpkgs> {}}:

pkgs.stdenv.mkDerivation {
  name = "cs323";
  buildInputs = with pkgs; [
    cgdb
    clang-tools
    clang_9
    cmake
    cppcheck
    cpplint
    gdb
    llvm_9
    pre-commit
    shellcheck
  ];
  NIX_ENFORCE_PURITY = "0";
  shellHook = ''
    if [ -d "$PWD"/.git ] && [ ! -f "$PWD"/.git/hooks/pre-commit ]; then
      pre-commit install
    fi
    export CAT_OUTPUT_DIR="$PWD/CAT"
    export PATH="$CAT_OUTPUT_DIR/bin:$PATH"
    if [ ! -d "$PWD"/build ]; then
      "$PWD"/run_me.sh
    fi
  '';
}
