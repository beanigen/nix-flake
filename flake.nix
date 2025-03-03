{
  description = "various system flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixgl.url = "github:nix-community/nixGL";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url = "github:catppuccin/nix";
    nixvim.url = "github:nix-community/nixvim";
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ...}:{
    nixosConfigurations."apollo" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./base/apollo
	
	home-manager.nixosModules.home-manager {
	  #imports = [ inputs.nix-index-database.hmModules.nix-index ];
	  home-manager.extraSpecialArgs = {
	    inherit inputs;
	    vars = {
	      isNixOS = true;
	      class = "desktop";
              user = "maya"; #cursed way of setting username
	      useSyncthing = true; #if this is false, comment out the syncthing ports in ./base/firewall.nix
	    };
	  };
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;
	  home-manager.users.maya = ./home; #change username here too
	}
      ];
    };
    nixosConfigurations."hypermac" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./base/hypermac
        home-manager.nixosModules.home-manager {
          home-manager.extraSpecialArgs = {
            inherit inputs;
            vars = {
              isNixOS = true;
              class = "lowspec";
              user = "maya";
              useSyncthing = true;
            };
          };
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.maya = ./home;
        }];
      };

    #other confs go here, cant be assed rn
    homeConfigurations.generic = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs { system = "x86_64-linux"; overlays = [inputs.nixgl.overlay]; };
      modules = [ ./home ];
      extraSpecialArgs = { 
        inherit inputs; 
        vars = {
          isNixOS = false;
          class = "laptop";
          user = "maya";
	  useSyncthing = true;
        };
      };
    };

  };
}
