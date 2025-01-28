{lib, osConfig, pkgs, inputs, ...}:{
  wayland.windowManager.sway = {
    package = pkgs.swayfx;
    enable = true;
    checkConfig = false; #gles2 renderer error
    extraConfig = import ./swayfx;
    config = {
      modifier = "Mod4";
      terminal = "foot";
      #output = {
        #eDP-1.pos = "0 1362";
       # "Hewlett Packard HP W2371d 6CM2220CSQ".pos = "1366 1050";
       # "Samsung Electric Company SyncMaster HMDQ202016".pos = "1517 0";
     # };
      gaps = {
        inner = 5;
        outer = 7;
      };
      input = {
        "type:touchpad" = {
          accel_profile = "flat";
          dwt = "disabled";
          scroll_factor = "0.3";
        };
        "1739:0:Synaptics_TM3075-002" = {
          natural_scroll = "enabled";
          click_method = "clickfinger";
        };
        "2:10:TPPS/2_IBM_TrackPoint" = {
          scroll_factor = "0.3";
        };
        "type:pointer" = {
          accel_profile = "flat";
        };
	"4152:6202:SteelSeries_SteelSeries_Aerox_3_Wireless" = {
	  pointer_accel = "0.1";
	};
      };
      bars = [];
      defaultWorkspace = "workspace number 1";
      startup = [
        { command = "waybar"; }
        { command = "udiskie --appindicator -t"; }
        { command = "kanshi"; }
        { command = "swaync"; }
        { command = "swaybg -m fill -i ~/.config/nixos/assets/twilight.png"; }
        { command = "kde-indicator"; }
        { command = "blueman-applet"; }
      ];
      workspaceLayout = "default";
      keybindings = lib.mkOptionDefault {
        "Print" = "exec grim -g \"$(slurp)\" ~/Pictures/screenshots/screenshot-`date +%F-%T`.png";
        "Mod4+d" = "exec foot --title launch --app-id fzf-launcher bash -c 'compgen -c | sort -u | fzf | xargs swaymsg exec --'";
	"Mod4+t" = "exec foot --title music --app-id mpd-control ncmpcpp";
        "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ -l 1.0";
        "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86AudioPlay" = "exec playerctl play-pause";
        "XF86AudioNext" = "exec playerctl next";
        "XF86AudioPrev" = "exec playerctl previous";
        "XF86AudioStop" = "exec playerctl stop";
        "XF86AudioMicMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
        "XF86MonBrightnessDown" = "exec brightnessctl s 10%-";
        "XF86MonBrightnessUp" = "exec brightnessctl s +10%";
        "XF86AudioMedia" = "exec vlc";
        "XF86Launch1" = "exec nmcli device wifi rescan";
        "Shift_L+Control_L+B" = "exec playerctl position 10-";
        "Shift_L+Control_L+F" = "exec playerctl position 10+";
      };
      floating.criteria = [
        { app_id = "^fzf-launcher$";}
	{ app_id = "^mpd-control$";}
	{ con_mark = "DELTARUNE Chapter 1&2";}
      ];
#  colors = {
#    focused = import ./swaycolors.nix;
#    focused = {
#      border = "#cba6f7";
#    };
#    focusedInactive = import ./swaycolors.nix; 
#    focusedInactive = {
#      background = "#440c88"; 
#      indicator = "#440c88";
#    };
#    unfocused = import ./swaycolors.nix; 
#    unfocused = {
#      background = "#440c88";
#      indicator = "#440c88";
#    };
#  };
      window = {
        titlebar = false;
      };
    };
  };
}
