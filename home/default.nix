{config, pkgs, lib, inputs, vars, ...}:{
  imports = [
    #home-manager modules
    inputs.nix-index-database.hmModules.nix-index
    inputs.nixvim.homeManagerModules.nixvim
    inputs.catppuccin.homeManagerModules.catppuccin
    #aux files to make finding specific things easier
    ./nixvim
    ./sway.nix
    ./theming.nix
    ./packages.nix #general user packages not managed by home-manager but i want to install via hm anyways
    ./syncthing.nix #this is a big block of configuration, really dont feel like cluttering this file more than it already is
  ];
  home = rec {
    username = vars.user; #this is set in flake.nix 
    homeDirectory = "/home/${username}"; #change this if you use a non-standard home dir
    stateVersion = "23.11";
    file = {
      ".config/waybar/config".source = config.lib.file.mkOutOfStoreSymlink "${homeDirectory}/.config/nixos/home/waybar/config";
      ".config/waybar/style.css".source = config.lib.file.mkOutOfStoreSymlink "${homeDirectory}/.config/nixos/home/waybar/style.css";
    };
  };
  programs.home-manager.enable = (!vars.isNixOS); #value is set in flake.nix
  targets.genericLinux.enable = (!vars.isNixOS);
  programs.foot = {
    enable = true;
    settings.main.font = "monospace:size=10";
    #settings.colors.alpha = "0.8";
  };
  programs.ncmpcpp = {
    enable = true;
    settings = {
      tags_separator = ";";
    };
  };
  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (exts: [exts.pass-otp exts.pass-import]);
    settings = { PASSWORD_STORE_DIR = "~/sync/general/pass"; };
  };
    
  services.mpd = {
    enable = true;
    musicDirectory = "/home/${vars.user}/Music";
    extraConfig = ''
      audio_output {
        type "pipewire"
	name "default pipewire"
      }
    '';
  };
  services.syncthing.enable = (vars.useSyncthing);
  
  services.mpd-mpris = {
    enable = true;
  };
  programs.waybar = {
    enable = true;
  };
  programs.git = {
    enable = true;
    userName = "beanigen";
    userEmail = "beanigit@protonmail.com";
    extraConfig = {
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/id_ed25519.pub";
      init.defaultBranch = "main";
    };
  };
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
    configPackages = [ pkgs.xdg-desktop-portal-wlr ];
  };
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  };
}
