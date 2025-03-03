{config, pkgs, ...}:{
  imports = [
    ./configuration.nix
    ../overrides.nix
    ../ssh.nix
    ../firewall.nix
    ../substituters.nix
    ../fonts.nix
  ];
}
