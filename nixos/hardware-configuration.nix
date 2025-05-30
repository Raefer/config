# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/4c677ac3-2231-4305-8770-e6861f42b72c";
      fsType = "ext4";
    };

  fileSystems."/stg" =
    { device = "/dev/disk/by-uuid/6dc2d086-333e-406f-b3a1-eaaab461f5b0";
      fsType = "ext4";
    };

  fileSystems."/bak" =
    { device = "/dev/disk/by-uuid/a8bf8cfa-c78d-4470-b340-7d7fe39e0348";
      fsType = "ext4";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/a61a5f82-5baa-4544-b0a0-10a801f54fd0";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/5570-ADD7";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  fileSystems."/tmp" =
    { device = "/dev/disk/by-uuid/b7ff57c4-7c4d-4154-afe8-65bf6e1358d8";
      fsType = "ext4";
    };

  fileSystems."/var" =
    { device = "/dev/disk/by-uuid/df51fbc7-3c47-47f4-a0d7-d7edda6f9b1c";
      fsType = "ext4";
    };

  fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/5e1a64e7-7f09-4f68-82d3-c5ae68254fcd";
      fsType = "ext4";
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp7s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
