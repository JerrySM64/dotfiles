{ config, inputs, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    xwayland.enable = true;
    settings = {
      monitor = [
        "desc:Acer Technologies KG241Y P3 1433035123E00, highres@highrr, 3840x0, 1"
        "desc:Dell Inc. DELL P2214H 29C2946E1M2L, highres@highrr, 1920x0, 1"
        "desc:Dell Inc. DELL P2217H RH81R66D3M2B, highres@highrr, 5760x0, 1"
        "desc:LG Electronics LG ULTRAGEAR 0x000A944A, highres@highrr, 0x0, 1"              
      ];

      workspace = [
        "1, monitor:desc:Acer Technologies KG241Y P3 1433035123E00, default:true"
        "2, monitor:desc:Acer Technologies KG241Y P3 1433035123E00"
        "3, monitor:desc:Acer Technologies KG241Y P3 1433035123E00"
        "4, monitor:desc:Dell Inc. DELL P2214H 29C2946E1M2L, default:true"
        "5, monitor:desc:Dell Inc. DELL P2214H 29C2946E1M2L"
        "6, monitor:desc:Dell Inc. DELL P2214H 29C2946E1M2L"
        "7, monitor:desc:Dell Inc. DELL P2217H RH81R66D3M2B, default:true"
        "8, monitor:desc:Dell Inc. DELL P2217H RH81R66D3M2B"
        "9, monitor:desc:Dell Inc. DELL P2217H RH81R66D3M2B"
        "10, monitor:desc:LG Electronics LG ULTRAGEAR 0x000A944A, default:true"
      ];

      exec = [
        "swaybg -m fill -i ~/Pictures/wall.jpg"
      ];

      exec-once = [
        "wl-clipboard-history -t"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "wlsunset -S 9:00 -s 19:30"
        "$POLKIT_BIN"
        "waybar"
        "protonvpn-app"
      ];
      
      general = {
        gaps_in = "5";
        gaps_out = "5";
        border_size = "3";
        "col.active_border" = "rgba(95e6cbff) rgba(59c2ffff) rgba(b8cc52ff) rgba(d2a6ffff) 45deg";
        "col.inactive_border" = "rgba(131721cc) rgba(0f1419cc) 45deg";
        no_border_on_floating = "false";
        layout = "dwindle";
      };

      input = {
        kb_layout = "us,de";
        follow_mouse = "1";
        sensitivity = "0";
      };

      decoration = {
        rounding = "8";
        active_opacity = "1.0";
        inactive_opacity = "1.0";
        blur = {
          enabled = "true";
          size = "8";
          passes = "3";
          noise = "0.0";
        };

        shadow = {
          enabled = "true";
          offset = "2 2";
          range = "4";
          render_power = "2";
          color = "0x66000000";
        };

        blurls = "lockscreen";
      };

      animations = {
        enabled = "true";
        bezier = [
          "overshot, 0.05, 0.9, 0.1, 1.05"
          "smoothOut, 0.36, 0, 0.66, -0.56"
          "smoothIn, 0.25, 1, 0.5, 1"
        ]; 

        animation = [
          "windows, 1, 5, overshot, slide"
          "windowsOut, 1, 4, smoothOut, slide"
          "windowsMove, 1, 4, default"
          "border, 1, 10, default"
          "fade, 1, 10, smoothIn"
          "fadeDim, 1, 10, smoothIn"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = "true";
        preserve_split = "true";
      };

      windowrule = [
        "float, class:file_progress"
        "float, class:confirm"
        "float, class:dialog"
        "float, class:download"
        "float, class:notification"
        "float, class:error"
        "float, class:splash"
        "float, class:confirmreset"
        "float, title:Open File"
        "float, class:titlebranchdialog"
        "float, title:Rofi"
        "animation, none, title:Rofi"
        "float, title:viewnior"
        "float, class:file-roller"
        "float, class:feh"
        "float, class:pavucontrol-qt"
        "float, class:pavucontrol"
        "float, class:nextcloud"
        "fullscreen, title:wlogout"
        "float, title:wlogout"
        "idleinhibit focus, title:mpv"
        "idleinhibit fullscreen, title:firefox"
        "float, title:^(Media viewer)$"
        "float, title:^(Volume Control)$"
        "float, title:^(Picture-in-Picture)$"
        "size 800 600, title:^(Volume Control)$"
        "move 75 44%, title:^(Volume Control)$"
      ];

      "$mod" = "SUPER";

      "$screenshotarea" = "hyprctl keyword animation 'fadeOut,0,0,default'; grimblast copy area; hyprctl keyword animation 'fadeOut,1,4,default'";

      bind = [
        "$mod, B, exec, brave"
        "$mod, P, exec, wlogout"
        "$mod, F1, exec, ~/.config/hypr/keybind"
        ",XF86AudioPlay, exec, playerctl play-pause"
        ",XF86AudioPause, exec, playerctl play-pause"
        ",XF86AudioNext, exec, playerctl next"
        ",XF86AudioPrev, exec, playerctl previous"
        "$mod SHIFT, S, exec, $screenshotarea"
        ", Print, exec, grimblast --cursor copy output"
        "ALT, Print, exec, grimblast --cursor copy screen"
        "$mod SHIFT, X, exec, hyprpicker -a -n"
        "CTRL ALT, L, exec, swaylock"
        "$mod, Return, exec, kitty"
        "$mod, X, exec, kitty"
        "$mod, E, exec, thunar"
        "$mod, R, exec, fuzzel"
        "$mod, escape, exec, wlogout --protocol layer-shell -b 5 -T 400 -B 400"
        "$mod, Q, killactive,"
        "$mod SHIFT, Q, exit,"
        "$mod SHIFT, K, exec, hyprctl switchxkblayout current next"
        "$mod, F, fullscreen,"
        "$mod, Space, togglefloating,"
        "$mod, P, pseudo," # dwindle
        "$mod, S, togglesplit," # dwindle
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod SHIFT, left, movewindow, l"
        "$mod SHIFT, right, movewindow, r"
        "$mod SHIFT, up, movewindow, u"
        "$mod SHIFT, down, movewindow, d"
        "$mod CTRL, left, resizeactive, -20 0"
        "$mod CTRL, right, resizeactive, 20 0"
        "$mod CTRL, up, resizeactive, 0 -20"
        "$mod CTRL, down, resizeactive, 0 20"
        "$mod, G, togglegroup"
        "$mod, TAB, changegroupactive"
        "$mod, grave, togglespecialworkspace"
        "$mod SHIFT, grave, movetoworkspace, special"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        "$mod ALT, up, workspace, e+1"
        "$mod ALT, down, workspace, e-1"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      binde = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      misc = {
        disable_hyprland_logo = "true";
        disable_splash_rendering = "true";
        mouse_move_enables_dpms = "true";
        enable_swallow = "true";
      };
    };
  };
}
