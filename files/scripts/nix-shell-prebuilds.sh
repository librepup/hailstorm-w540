#!/usr/bin/env bash
# Nix-Shell Pre-Builds

# Haskell
nshs() {
    if [ "$1" = "h" ]; then
        echo -e "[ Usage ]:\n  nshs [haskellPackage1] [haskellPackage2] [...]"
        return 0
    fi
    if [ "$1" = "--help" ]; then
        echo -e "[ Usage ]:\n  nshs [haskellPackage1] [haskellPackage2] [...]"
        return 0
    fi
    if [ "$1" = "help" ]; then
        echo -e "[ Usage ]:\n  nshs [haskellPackage1] [haskellPackage2] [...]"
        return 0
    fi
    if [ $# -eq 0 ]; then
        echo "[ Please provide Haskell Packages ]"
        return 1
    fi
    haskellPackages="$@"
    export NSPY_PACKAGES="$haskellPackages"
    nix-shell -p "haskellPackages.ghcWithPackages (ps: with ps; [ $haskellPackages ])" --run "echo '[ Installed Packages: $haskellPackages ]' && exec zsh"
}

# Python
nspy() {
    if [ "$1" = "h" ]; then
        echo -e "[ Usage ]:\n  nspy [pythonPackage1] [pythonPackage2] [...]"
        return 0
    fi
    if [ "$1" = "--help" ]; then
        echo -e "[ Usage ]:\n  nspy [pythonPackage1] [pythonPackage2] [...]"
        return 0
    fi
    if [ "$1" = "help" ]; then
        echo -e "[ Usage ]:\n  nspy [pythonPackage1] [pythonPackage2] [...]"
        return 0
    fi
    if [ $# -eq 0 ]; then
        echo "[ Please provide Python Packages ]"
        return 1
    fi
    pythonPackages="$@"
    export NSPY_PACKAGES="$pythonPackages"
    nix-shell -p "python3.withPackages (ps: with ps; [ $pythonPackages ])" --run "echo '[ Installed Packages: $pythonPackages ]' && exec zsh"
}
