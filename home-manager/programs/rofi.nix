{ config, literalExpression, pkgs, ... }:

{
  home = {
    file = {
      ".config/rofi/config.rasi" = {
        text = ''
          configuration {
              font:				"Cascadia Code 12";
              show-icons:				true;
              icon-theme:				"Arc-X-D";
              display-drun:			"Apps";
              drun-display-format:		"{name}";
              scroll-method:			0;
              disable-history:			false;
              sidebar-mode:			false;
          }

          @import "~/.config/rofi/arc_dark_transparent_colors.rasi"

          window {
              background-color: @background;
              border:           0;
              padding:          30;
          }
          listview {
              lines:                          10;
              columns:                        3;
          }
          mainbox {
              border:  0;
              padding: 0;
          }
          message {
              border:       2px 0px 0px ;
              border-color: @separatorcolor;
              padding:      1px ;
          }
          textbox {
              text-color: @foreground;
          }
          listview {
              fixed-height: 0;
              border:       8px 0px 0px ;
              border-color: @separatorcolor;
              spacing:      8px ;
              scrollbar:    false;
              padding:      2px 0px 0px ;
          }
          element {
              border:  0;
              padding: 1px ;
          }
          element-text {
              background-color: inherit;
              text-color:       inherit;
          }
          element.normal.normal {
              background-color: @normal-background;
              text-color:       @normal-foreground;
          }
          element.normal.urgent {
              background-color: @urgent-background;
              text-color:       @urgent-foreground;
          }
          element.normal.active {
              background-color: @active-background;
              text-color:       @active-foreground;
          }
          element.selected.normal {
              background-color: @selected-normal-background;
              text-color:       @selected-normal-foreground;
          }
          element.selected.urgent {
              background-color: @selected-urgent-background;
              text-color:       @selected-urgent-foreground;
          }
          element.selected.active {
              background-color: @selected-active-background;
              text-color:       @selected-active-foreground;
          }
          element.alternate.normal {
              background-color: @alternate-normal-background;
              text-color:       @alternate-normal-foreground;
          }
          element.alternate.urgent {
              background-color: @alternate-urgent-background;
              text-color:       @alternate-urgent-foreground;
          }
          element.alternate.active {
              background-color: @alternate-active-background;
              text-color:       @alternate-active-foreground;
          }
          scrollbar {
              width:        4px ;
              border:       0;
              handle-color: @normal-foreground;
              handle-width: 8px ;
              padding:      0;
          }
          mode-switcher {
              border:       2px 0px 0px ;
              border-color: @separatorcolor;
          }
          button {
              spacing:    0;
              text-color: @normal-foreground;
          }
          button.selected {
              background-color: @selected-normal-background;
              text-color:       @selected-normal-foreground;
          }
          inputbar {
              spacing:    0;
              text-color: @normal-foreground;
              padding:    1px ;
          }
          case-indicator {
              spacing:    0;
              text-color: @normal-foreground;
          }
          entry {
              spacing:    0;
              text-color: @normal-foreground;
          }
          prompt {
              spacing:    0;
              text-color: @normal-foreground;
          }
          inputbar {
              children:   [ prompt,textbox-prompt-colon,entry,case-indicator ];
          }
          textbox-prompt-colon {
              expand:     false;
              str:        ":";
              margin:     0px 0.3em 0em 0em ;
              text-color: @normal-foreground;
          }
        '';
      };

      ".config/rofi/arc_dark_transparent_colors.rasi" = {
        text = ''
          * {
              selected-normal-foreground:  rgba ( 255, 147, 5, 100 % );
              foreground:                  rgba ( 196, 203, 212, 100 % );
              normal-foreground:           @foreground;
              alternate-normal-background: rgba ( 45, 48, 59, 1 % );
              red:                         rgba ( 220, 50, 47, 100 % );
              selected-urgent-foreground:  rgba ( 249, 249, 249, 100 % );
              blue:                        rgba ( 38, 139, 210, 100 % );
              urgent-foreground:           rgba ( 204, 102, 102, 100 % );
              alternate-urgent-background: rgba ( 75, 81, 96, 90 % );
              active-foreground:           rgba ( 101, 172, 255, 100 % );
              lightbg:                     rgba ( 238, 232, 213, 100 % );
              selected-active-foreground:  rgba ( 249, 249, 249, 100 % );
              alternate-active-background: rgba ( 45, 48, 59, 88 % );
              background:                  rgba ( 45, 48, 59, 88 % );
              alternate-normal-foreground: @foreground;
              normal-background:           rgba ( 45, 48, 59, 1 % );
              lightfg:                     rgba ( 88, 104, 117, 100 % );
              selected-normal-background:  rgba ( 24, 26, 32, 100 % );
              border-color:                rgba ( 124, 131, 137, 100 % );
              spacing:                     2;
              separatorcolor:              rgba ( 45, 48, 59, 1 % );
              urgent-background:           rgba ( 45, 48, 59, 15 % );
              selected-urgent-background:  rgba ( 165, 66, 66, 100 % );
              alternate-urgent-foreground: @urgent-foreground;
              background-color:            rgba ( 0, 0, 0, 0 % );
              alternate-active-foreground: @active-foreground;
              active-background:           rgba ( 29, 31, 33, 17 % );
              selected-active-background:  rgba ( 26, 28, 35, 100 % );
          }
        '';
      };

      ".config/rofi/themes/catppuccin-mocha.rasi" = {
        text = ''
          * {
            selected-normal-foreground:   rgba ( 255, 147, 5, 100 %  );
            foreground:                   rbga ( 196, 203, 212, 100 % );
            normal-foreground:            @foreground;
            alternate-normal-background:  rgba ( 45, 48, 59, 1 % );
            red:                          rgba ( 220, 50, 47, 100 % );
            selected-urgent-forground:    rgba ( 249, 249, 249, 100 % );
            blue:                         rgba ( 38, 139, 210, 100 % );
            urgent-foreground:            rgba ( 204, 102, 102, 100 % );
            alternate-urgent-background:  rgba ( 75, 81, 96, 90 % );
            active-foreground:            rgba ( 101, 172, 255, 100 % );
            lightbg:                      rgba ( 238, 232, 213, 100 % );
            selected-active-foreground:   rgba ( 249, 249, 249, 100 % );
            alternate-active-background:  rgba ( 45, 48, 59, 88 % );
            background:                   rgba ( 45, 48, 59, 88 % );
            alternate-normal-foreground:  @foreground;
            normal-background:            rgba ( 45, 48, 59, 1 % );
            lightfg:                      rgba ( 88, 104, 117, 100 % );
            selected-normal-background:   rgba ( 24, 26, 32, 100 % );
            border-color:                 rgba ( 124, 131, 137, 100 % );
            spacing:                      2;
            separatorcolor:               rgba ( 45, 48, 59, 1 % );
            urgent-background:            rgba ( 45, 48, 59, 15 % );
            selected-urgent-background:   rgba ( 165, 66, 66, 100 % );
            alternate-urgent-foreground:  @urgent-foreground;
            background-color:             rgba ( 0, 0, 0, 0 % );
            alternate-active-foreground:  @active-foreground;
            active-background:            rgba ( 29, 31, 33, 17 % );
            selected-active-background:   rgba ( 26, 28, 35, 100 % );
          }
        '';
      };

      ".config/rofi/powermenu.rasi" = {
        text = ''
          configuration {
            font:                           "Cascadia Code 12";
            show-icons:                     false;
            icon-theme:                     "Arc-X-D";
            scroll-method:                  0;
            disable-history:                false;
            sidebar-mode:                   false;
           }

           @import "~/.config/rofi/arc_dark_transparent_colors.rasi"

           window {
             background-color:              @background;
             border:                        0;
             padding:                       10;
             transparency:                  "real";
             width:                         180px;
             location:                      east;
             /*y-offset:                    18;*/
             /*x-offset:                    850;*/
             transparency:                  "real";
           }

           listview {
             lines:                         6;
             columns:                       1;
             scrollbar:                     false;
           }

           element {
             border:                        0;
             padding:                       1px ;
           }

           element-text {
           background-color:                inherit;
           text-color:                      inherit;
           }

           element.normal.normal {
             background-color:              @normal-background;
             text-color:                    @normal-foreground;
           }

           element.normal.urgent {
             background-color:              @urgent-background;
             text-color:                    @urgent-foreground;
           }

           element.normal.active {
             background-color:              @active-background;
             text-color:                    @active-foreground;
           }

           element.selected.normal {
             background-color:              @selected-normal-background;
             text-color:                    @selected-normal-foreground;
           }

           element.selected.urgent {
             background-color:              @selected-urgent-background;
             text-color:                    @selected-urgent-foreground;
           }

           element.selected.active {
             background-color:              @selected-active-background;
             text-color:                    @selected-active-foreground;
           }

           element.alternate.normal {
             background-color:              @alternate-normal-background;
             text-color:                    @alternate-normal-foreground;
           }

           element.alternate.urgent {
             background-color:              @alternate-urgent-background;
             text-color:                    @alternate-urgent-foreground;
           }

           element.alternate.active {
             background-color:              @alternate-active-background;
             text-color:                    @alternate-active-foreground;
           }

           scrollbar {
             width:                         4px ;
             border:                        0;
             handle-color:                  @normal-foreground;
             handle-width:                  8px ;
             padding:                       0;
           }

           mode-switcher {
             border:                        2px 0px 0px ;
             border-color:                  @separatorcolor;
           }

           button {
             spacing:                       0;
             text-color:                    @normal-foreground;
           }

           button.selected {
             background-color:              @selected-normal-background;
             text-color:                    @selected-normal-foreground;
           }

           inputbar {
             spacing:                       0;
             text-color:                    @normal-foreground;
             padding:                       1px ;
           }

           case-indicator {
             spacing:                       0;
             text-color:                    @normal-foreground;
           }

           entry {
             spacing:                       0;
             text-color:                    @normal-foreground;
           }

           prompt {
             spacing:                       0;
             text-color:                    @normal-foreground;
           }

           inputbar {
             children:                      [ prompt,textbox-prompt-colon,entry,case-indicator ];
           }

           textbox-prompt-colon {
             expand:                        false;
             str:                           ":";
             margin:                        0px 0.3em 0em 0em ;
             text-color:                    @normal-foreground;
           }
        '';
      };

      ".config/rofi/powermenu.sh" = {
        text = ''
          #!/usr/bin/env bash

          # Options for powermenu
          lock="    Lock"
          logout="󰗼    Logout"
          shutdown="    Shutdown"
          reboot="󰁯    Reboot"
          sleep="   Sleep"

          # Get answer from user via rofi
          selected_option=$(echo "$lock
          $logout
          $sleep
          $reboot
          $shutdown" | rofi -dmenu\
                            -i\
                            -p "Power"\
                            -config "~/.config/rofi/powermenu.rasi"\
                            -font "Cascadia Code 12"\
                            -width "15"\
                            -lines 5\
                            -line-margin 3\
                            -line-padding 10\
                            -scrollbar-width "0" )

          # Do something based on selected option
          if [ "$selected_option" == "$lock" ]
          then
              /home/$USER/.config/scripts/i3lock-fancy/i3lock-fancy.sh
          elif [ "$selected_option" == "$logout" ]
          then
              loginctl terminate-user `whoami`
          elif [ "$selected_option" == "$shutdown" ]
          then
              systemctl poweroff
          elif [ "$selected_option" == "$reboot" ]
          then
              systemctl reboot
          elif [ "$selected_option" == "$sleep" ]
          then
              amixer set Master mute
              systemctl suspend
          else
              echo "No match"
          fi
        '';
      };
    };
  };
}
