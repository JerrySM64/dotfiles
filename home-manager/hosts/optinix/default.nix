{ config, lib, pkgs, ... }:

{
  imports = [
    ./shell/default.nix
    ./wm/hyprland.nix
  ];

  home = {
    file = {
      # Make the update command work right out of the box
      ".local/bin/updates" = {
        executable = true;
        text = ''
          #!/usr/bin/env bash

          clear
          echo -e "\n\e[1m\e[31mWhat do you want to do?\e[0m"
          echo -e "\e[34m1. Update the Flake."
          echo -e "\e[34m2. Apply updates. \e[0m"
          echo -e "\e[34m3. Apply updates and reboot.\e[0m"
          echo -e "\e[34m4. Apply updates and shut down.\e[0m"
          echo -e "\e[34m5. Do nothing.\e[0m"

          read -p $'\n\e[96mChoose an option (1-5): \e[0m' option

          case $option in
            1)
              clear
              echo -e "\n\e[1m\e[34mUpdating the Flake... \e[0m\n"
              nix flake update /home/jerry/.config/flake
              echo -e "Flake updated."
              ;;

            2)    
              clear
              sudo -v
              echo -e "\n\e[1m\e[31m1/4 (25%) \e[34mUpdating Flatpaks... \e[0m\n"
              flatpak update -y

              echo -e "\n\e[1m\e[31m2/4 (50%) \e[34mUpdating Distroboxes... \e[0m\n"
              distrobox-upgrade -a

              echo -e "\n\e[1m\e[31m3/4 (75%) \e[34mUpdating the Flake... \e[0m\n"
              nix flake update $FLAKE

              echo -e "\n\e[1m\e[31m4/4 (100%) \e[34mUpdating the system... \e[0m\n"
              cd $FLAKE
              git add .
              nh os switch --hostname=optinix
              cd -
              echo -e "Updates applied."
              ;;
            3)
              clear
              sudo -v
              echo -e "\n\e[1m\e[31m1/4 (25%) \e[34mUpdating Flatpaks... \e[0m\n"
              flatpak update -y

              echo -e "\n\e[1m\e[31m2/4 (50%) \e[34mUpdating Distroboxes... \e[0m\n"
              distrobox-upgrade -a

              echo -e "\n\e[1m\e[31m3/4 (75%) \e[34mUpdating the Flake... \e[0m\n"
              nix flake update $FLAKE

              echo -e "\n\e[1m\e[31m4/4 (100%) \e[34mUpdating the system... \e[0m\n"
              cd $FLAKE
              git add .
              nh os boot --hostname=optinix

              echo "Updates applied. Press the Enter key to reboot!"
              read

              clear
              echo "Rebooting..."
              sleep 1
              reboot
              ;;
            4)
              clear
              sudo -v
              echo -e "\n\e[1m\e[31m1/4 (25%) \e[34mUpdating Flatpaks... \e[0m\n"
              flatpak update -y

              echo -e "\n\e[1m\e[31m2/4 (50%) \e[34mUpdating Distroboxes... \e[0m\n"
              distrobox-upgrade -a

              echo -e "\n\e[1m\e[31m3/4 (75%) \e[34mUpdating the Flake... \e[0m\n"
              nix flake update $FLAKE

              echo -e "\n\e[1m\e[31m4/4 (100%) \e[34mUpdating the system... \e[0m\n"
              cd $FLAKE
              git add .
              nh os boot --hostname=optinix

              echo "Updates applied. Press the Enter key to shut down!"
              read

              clear
              echo "Shutting down..."
              sleep 1
              poweroff
              ;;
            5)
              echo "Exiting..."
              sleep 1
              ;;
            *)
              echo "Invalid option."
              read -p $'\n\e[96mChoose an option (1-5): \e[0m' option
          esac
        '';
      };
    };
  };
}
