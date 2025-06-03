{
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];
  networking.firewall.allowedTCPPorts = [ 22000 ];
  services.syncthing.openDefaultPorts = true;
}
