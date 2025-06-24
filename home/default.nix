{config, pkgs, lib, inputs, vars, ...}:{
  imports = [
    #aux files to make finding specific things easier
    ./nixvim
    ./sway.nix
    ./theming.nix
    ./niri.nix
    ./packages.nix #general user packages not managed by home-manager but i want to install via hm anyways
    ./syncthing.nix #this is a big block of configuration, really dont feel like cluttering this file more than it already is
  ];
  home = rec {
    username = vars.user; #this is set in flake.nix 
    homeDirectory = "/home/${username}"; #change this if you use a non-standard home dir
    stateVersion = "23.11";
    sessionVariables = { PASSWORD_STORE_DIR = "$HOME/sync/general/pass"; ELECTRON_OZONE_PLATFORM_HINT = "auto";};
    shell.enableBashIntegration = true;
    file = {
      ".config/waybar/config".source = config.lib.file.mkOutOfStoreSymlink "${homeDirectory}/.config/nixos/home/waybar/config";
      ".config/waybar/style.css".source = config.lib.file.mkOutOfStoreSymlink "${homeDirectory}/.config/nixos/home/waybar/style.css";
    };
  };
  programs.home-manager.enable = (!vars.isNixOS); #value is set in flake.nix
  programs.foot.enable = true;
  programs.foot.settings.main.font = "monospace:size=10";
  programs.foot.settings.colors.alpha = 0.8;

  programs.ncmpcpp.enable = true;
  programs.ncmpcpp.settings.tags_separator = ";";

  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (exts: [exts.pass-otp exts.pass-import]);
    settings = { PASSWORD_STORE_DIR = "$HOME/sync/general/pass"; };
  };
    
  services.mpd-discord-rpc.enable = true;
  services.mpd = {
    enable = true;
    musicDirectory = "/home/${vars.user}/Music";
    extraConfig = ''
      audio_output {
        type "pipewire"
	name "default pipewire"
      }
      audio_output {
        type "alsa"
	name "ALSA Direct"
	mixer_type "hardware"
	mixer_control "PCM"
	auto_resample "no"
	device "hw:0,0"
      }
    '';
  };
  services.syncthing.enable = (vars.useSyncthing);

  services.mpd-mpris.enable = true;

  programs.waybar.enable = true;

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
  programs.irssi = {
    enable = true;
    networks = {
      classicconnect = { 
        nick = "maya";
        server = {
	  address = "irc.classicconnect.net";
	  port = 6677;
	  autoConnect = true;
	  ssl.enable = false;
	};
	channels = {
	  nick.autoJoin = true;
	};
      };
    };
  };


#  programs.obs-studio = {
#    enable = true;
#    plugins = with pkgs.obs-studio-plugins; [
#      wlrobs
#      obs-backgroundremoval
#      obs-pipewire-audio-capture
#    ];
#  };
}
