{config, pkgs, ...}:{
  imports = [
    ./configuration.nix
    ../overrides.nix
    ../ssh.nix
    ../syncthing.nix
    ../substituters.nix
    ../fonts.nix
  ];
}
