{pkgs, ...}:{
   environment.systemPackages = with pkgs; [
    
    (lutris.override {
       extraPkgs = pkgs: [
         wine
         gamescope
       ];

       extraLibraries =  pkgs: [
         nspr
         xorg.libXdamage
         xorg.libXfixes
	 openal
	 gnutls
	 libidn2
	 libssh2
	 libpsl
	 brotli
         pkgsi686Linux.expat
         pkgsi686Linux.openal
         pkgsi686Linux.nvidia_cg_toolkit
         pkgsi686Linux.tcp_wrappers
         pkgsi686Linux.libasyncns
         pkgsi686Linux.libapparmor
         pkgsi686Linux.xorg.libXrandr
         pkgsi686Linux.xorg.libxcb
         pkgsi686Linux.xorg.libXi
         pkgsi686Linux.libsndfile
         pkgsi686Linux.libmpg123
       ];
    })
  ];
}
