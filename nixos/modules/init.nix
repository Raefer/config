{ config, pkgs, lib, ... }:
{
    imports = [
        ./bash-shell.nix
        ./compositor.nix
        ./development.nix
        ./language.nix
        ./user-programs.nix
    ];
}
