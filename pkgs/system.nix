{ config, pkgs, ... }:

{
  config = {
    programs = {
      # Enable Z-Shell
      zsh = {
        enable = true;

        # Syntax Highlighting
        syntaxHighlighting = {
          enable = true;
        };

        # Autosuggestions
        autosuggestions = {
          enable = true;
          async = true;
          highlightStyle = "fg=cyan";
          strategy = ["completion"];
        };

        # Oh my Zsh
        ohMyZsh = {
          enable = true;
          plugins = [
            "history-substring-search"
            "systemd"
          ];
        };
      };

      # Bye bye, Nano!
      nano = {
        enable = false;
      };

      # SUID wrapper
      mtr = {
        enable = true;
      };

      gnupg = {
        agent = {
          enable = true;
          enableSSHSupport = true;
        };
      };
    };


    # Define the system packages here
    environment = {
      systemPackages = with pkgs; [
        brave
        btop
        eza
        fastfetch
        kitty
        lm_sensors
        neovim
        nextcloud-client
        nh
        ntfs3g
        pciutils
        pfetch
        protonvpn-gui
        starship
        tdesktop
        unzip
        vlc
        wget
      ];
    };
  };
}
