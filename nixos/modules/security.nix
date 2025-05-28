{ config, pkgs, lib, ... }:
{
    # Lock down nix access to only @wheel
    nix.settings.allowed-users = [ "@wheel" ];

    # Limit sudo to @wheel only
    security.sudo.execWheelOnly = true;

    # Noexec filesystems
    fileSystems."/tmp".options = [ "noexec" ];
    fileSystems."/var/log".options = [ "noexec" ];
}
