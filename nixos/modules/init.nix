{ config, pkgs, lib, ... }:
{
    imports = [
        ./bash-shell.nix
        ./compositor.nix
        ./development.nix
        ./language.nix
        ./latex.nix
        ./security.nix
        ./user-programs.nix
    ];
}
