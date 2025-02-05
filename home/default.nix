{config, pkgs, lib, inputs, vars, ...}:{
  imports = [
    #home-manager modules
    inputs.nix-index-database.hmModules.nix-index
    inputs.nvf.homeManagerModules.default
    inputs.catppuccin.homeManagerModules.catppuccin
    #aux files to make finding specific things easier
    ./sway.nix
    ./theming.nix
    ./packages.nix #general user packages not managed by home-manager but i want to install via hm anyways
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
   programs.nvf = {
      enable = true;
      settings.vim = {
        statusline.lualine = {
          enable = true;
          theme = "dracula";
        };
        autocomplete.nvim-cmp.enable = true;
        languages = {
	       enableFormat = true;
	       enableLSP = true;
          #enableTreesitter = true; disabled until it fixes itself
	       nix.enable = true;
	       clang.enable = true;
	       html.enable = true;
          css.enable = true;
	       python.enable = true;
	     };
      };
    };
}
