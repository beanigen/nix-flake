{pkgs, vars, ...}:{
  home.packages = with pkgs; [
    prismlauncher
    libgpod
    ark
    qv4l2
    nextcloud-client
    blender-hip
    cinny-desktop
    libimobiledevice
    mpc
    strawberry
#    lmms
    kanshi
    emacs
    comma
    openscad
    openutau
    wlr-randr
    grim
    slurp
    swaynotificationcenter
    udiskie
    gtklock
    swaybg
    gzdoom
    fzf
    openrct2
    wl-clipboard
    brightnessctl
    nemo
    xfce.ristretto
    xfce.tumbler
    inkscape
    hyfetch
    pamixer
    pavucontrol
    gimp
    prusa-slicer
    gamescope
    vlc
    playerctl
    firefox
    v4l-utils
    libreoffice
  ] ++ (if !vars.isNixOS then [nixgl.nixGLIntel] else []);
}
