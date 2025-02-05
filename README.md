# Welcome to my Nix flake!
![](/assets/desktop.png)
This is my repo I use to store my flake for my NixOS and non-NixOS systems, it includes a home-manager configuration that ~~(should)~~ DOES!!! work both standalone and as a NixOS module, which manages an MPD server, swayfx (hyprland has godawful vram management and i will die on this hill), waybar, and some other stuff that I can't think of on the top of my head lmao

## PLEASE NOTE ALL MY BINDINGS ARE MADE WITH THE [COLEMAK](https://colemak.org) KEYBOARD LAYOUT IN MIND AS I USE IT ON MY MACHINES

# General layout:
I store the configuration.nix and hardware-configuration.nix files in the base directory, they can be detached from the flake and used as a non-graphical configuration.

The home directory is where all the home-manager configuration goes and everything that is managed by it, sway, waybar, theming etc.

### /home/
In here, there is a default.nix file which ~~should~~ does work as a standalone home-manager config and is the entrypoint for it

packages.nix - general packages not managed by home-manager but I want to be installed by it as it is graphical or a hm-configured thing uses it

swayfx - This is where the swayfx-specific stuff goes as I cannot declaratively configure this due to the nature of home-manager

sway.nix - This is my sway configuration, REMEMBER THE BINDS ARE IN COLEMAK

theming.nix - This is the file I use for general theme configuration.

#### /home/waybar/
This directory stores my waybar configuration. It is not configured in Nix as I am endlessly tweaking it and do not wish to rebuild for every change.

Please note that I have specifically used mkOutOfStoreSymlink to configure waybar's files so I do not need to rebuild for any change.

~~also im pretty proud of my waybar config~~
![](/assets/waybar.gif)

### /base/
This directory has many different Nix files that I import based on what I want or don't want in my configuration.

The format is /base/hostname/default.nix (i will get into this)

fonts.nix - self explanatory, configures fonts for the system.

overrides.nix - I try to keep my package overrides in here where possible as it makes it easier to find.

ssh.nix - This is where I configure the SSH server. I have password authentication off and exclusively use keys.

substituters.nix - This is where all the substituters I use go.

syncthing.nix - This is where I store my syncthing configuration, I plan to move this over to home-manager when I get the motivation but that's a problem for Future Me&trade;

#### /base/hostname/
This is where I store the configurations for each of my hosts.

configuration.nix & hardware-configuration.nix - self explanatory

default.nix - This is where my flake.nix imports the config from. It imports configuration.nix and any of the various .nix files in /base/ that I want (or dont want!)

### /assets/
This folder is for general assets e.g. wallpapers or stuff I want to show in this document.

### Things I need to figure out
- [ ] Manage shell via home-manager so standalone configs will have hm-managed stuff in the path
- [ ] Move Syncthing config to home-manager so it's across all hosts
- [x] Find a way to only declare username once in home.nix so changing username is only one line
- [ ] MAYBE tune sway + waybar configs for touchscreen use (like Sxmo on postmarketOS)
- [ ] Move stuff like git email and other personally identifiable information to a secret managing system
