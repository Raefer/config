{ config, pkgs, lib, ... }:
{
    environment.systemPackages = with pkgs; [
        texlab
        texliveMedium
    ];
}
