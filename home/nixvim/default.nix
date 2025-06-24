{vars, lib, ...}:{
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin.enable = true;
    colorschemes.catppuccin.settings.flavour = "mocha";
    plugins = { 
      treesitter.enable = true;
      fidget.enable = true; 
      lualine.enable = true;
      lualine.settings.options.theme = "dracula";
      cmp = {
        enable = true;
        settings = {
	  performance.throttle = 30;
          sources = [{name = "nvim_lsp";}{name = "luasnip";}{name = "path";}{name = "buffer";}];
	  mapping = {
	    "<Tab>" = "cmp.mapping.select_next_item()";
	    "<S-Tab>" = "cmp.mapping.select_prev_item()";
	    "<C-space>" = "cmp.mapping.confirm({ select = false })";
	  };
	};
      };
      lsp = {
        enable = true;
	servers.cssls.enable = true;
	servers.clangd.enable = true;
	servers.pylsp.enable = true;
	servers.html = {
	  enable = true;
	};
	servers.nixd = {
	  enable = true;
	  extraOptions.offset_encoding = "utf-8";
	  settings.nixpkgs.expr = "import (builtins.getFlake \"/home/${vars.user}/.config/nixos\").inputs.nixpkgs {}";
	  settings.options = {
	    nixos.expr = "(builtins.getFlake \"/home/${vars.user}/.config/nixos\").nixosConfigurations.callisto.options";
	    home-manager.expr = "(builtins.getFlake \"/home/${vars.user}/.config/nixos\").nixosConfigurations.callisto.options.home-manager.users.type.getSubOptions []"; 
	    #niri.expr = "(builtins.getFlake \"/home/${vars.user}/.config/nixos\").nixosConfigurations.callisto.config.home-manager.users.${vars.user}.programs.niri.settings";
	  };
	};
      };
    };
  };
}
