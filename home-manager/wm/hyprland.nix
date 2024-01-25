{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
    systemd = {
      enable = true;
    };
    extraConfig = let
      modifier = "SUPER";
    in concatStrings [ ''
      exec-once = wl-clipboard-history -t
      exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      exec-once = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      exec-once = wlsunset -S 9:00 -s 19:30
      exec-once = $POLKIT_BIN
      exec-once = nextcloud
      exec = swaybg -m fill -i ~/Nextcloud/Photos/Green\ Demon/Wallpapers/1335153.jpeg
      exec-once = waybar

      monitor=,preferred,auto,1

      input {
        kb_layout = de
        follow_mouse = 1
        sensitivity = 0
      }

      general {
        gaps_in = 5
        gaps_out = 5
        border_size = 3
        col.active_border = rgb(6e16af) rgb(1916af) 45deg
        no_border_on_floating = true
        layout = master
      }

      misc {
        disable_hyprland_logo = true
        disable_splash_rendering = true
        mouse_move_enables_dpms = true
        enable_swallow = true
        swallow_regex = ^(wezterm)$
      }

      decoration {
        rounding = 8
        active_opacity = 1.0
        inactive_opacity = 1.0
        blur {
          enabled = true
          size = 8
          passes = 3
          noise = 0.0
          new_optimizations = true
        }
        drop_shadow = true
        shadow_ignore_window = true
        shadow_offset = 2 2
        shadow_range = 4
        shadow_render_power = 2
        col.shadow = 0x66000000

        blurls = gtk-layer-shell
        blurls = waybar
        blurls = lockscreen
      }

      animations {
        enabled = true
        bezier = overshot, 0.05, 0.9, 0.1, 1.05
        bezier = smoothOut, 0.36, 0, 0.66, -0.56
        bezier = smoothIn, 0.25, 1, 0.5, 1
        animation = windows, 1, 5, overshot, slide
        animation = windowsOut, 1, 4, smoothOut, slide
        animation = windowsMove, 1, 4, default
        animation = border, 1, 10, default
        animation = fade, 1, 10, smoothIn
        animation = fadeDim, 1, 10, smoothIn
        animation = workspaces, 1, 6, default
      }

      dwindle {
        no_gaps_when_only = false
        pseudotile = true
        preserve_split = true
      }

      windowrule = float, file_progress
      windowrule = float, confirm
      windowrule = float, dialog
      windowrule = float, download
      windowrule = float, notification
      windowrule = float, error
      windowrule = float, splash
      windowrule = float, confirmreset
      windowrule = float, title:Open File
      windowrule = float, titlebranchdialog
      windowrule = float, Rofi
      windowrule = animation, none, Rofi
      windowrule = float, viewnior
      windowrule = float, file-roller
      windowrule = float, feh
      windowrule = float, pavucontrol-qt
      windowrule = float, pavucontrol
      windowrule = float, nextcloud
      windowrule = fullscreen, wlogout
      windowrule = float, title:wlogout
      windowrule = idleinhibit focus, mpv
      windowrule = idleinhibit fullscreen, firefox
      windowrule = float, title:^(Media viewer)$
      windowrule = float, title:^(Volume Control)$
      windowrule = float, title:^(Picture-in-Picture)$
      windowrule = size 800 600, title:^(Volume Control)$
      windowrule = move 75 44%, title:^(Volume Control)$

      $screenshotarea = hyprctl keyword animation "fadeOut,0,0,default"; grimblast copy area; hyprctl keyword animation "fadeout,1,4,default"

      bind = ${modifier}, B, exec, brave
      bind = ${modifier}, P, exec, wlogout
      bind = ${modifier}, F1, exec, ~/.config/hypr/keybind
      binde = ,XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
      binde = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      binde = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bind = ,XF86AudioPlay, exec, playerctl play-pause
      bind = ,XF86AudioPause, exec, playerctl play-pause
      bind = ,XF86AudioNext, exec, playerctl next
      bind = ,XF86AudioPrev, exec, playerctl previous
      bind = ${modifier} SHIFT, S, exec $screenshotarea
      bind = , Print, exec, grimblast --cursor copy output
      bind = ALT, Print, exec, grimblast --cursor copy screen
      bind = ${modifier} SHIFT, X, exec, hyprpicker -a -n
      bind = CTRL ALT, L, exec, swaylock
      bind = ${modifier}, Return, exec, kitty
      bind = ${modifier}, X, exec, kitty
      bind = ${modifier}, E, exec, thunar
      bind = ${modifier}, R, exec, rofi -show drun
      bind = ${modifier}, escape, exec, wlogout --protocol layer-shell -b 5 -T 400 -B 400
      bind = ${modifier}, Q, killactive,
      bind = ${modifier} SHIFT, Q, exit,
      bind = ${modifier}, F, fullscreen,
      bind = ${modifier}, Space, togglefloating,
      bind = ${modifier}, P, pseudo, # dwindle
      bind = ${modifier}, S, togglesplit, # dwindle
      bind = ${modifier}, left, movefocus, l
      bind = ${modifier}, right, movefocus, r
      bind = ${modifier}, up, movefocus, u
      bind = ${modifier}, down, movefocus, d
      bind = ${modifier} SHIFT, left, movewindow, l
      bind = ${modifier} SHIFT, right, movewindow, r
      bind = ${modifier} SHIFT, up, movewindow, u
      bind = ${modifier} SHIFT, down, movewindow, d
      bind = ${modifier} CTRL, left, resizeactive, -20 0
      bind = ${modifier} CTRL, right, resizeactive, 20 0
      bind = ${modifier} CTRL, up, resizeactive, 0 -20
      bind = ${modifier} CTRL, down, resizeactive, 0 20
      bind = ${modifier}, G, togglegroup
      bind = ${modifier}, TAB, changegroupactive
      bind = ${modifier}, grave, togglespecialworkspace
      bind = ${modifier} SHIFT, grave, movetoworkspace, special
      bind = ${modifier}, 1, workspace, 1
      bind = ${modifier}, 2, workspace, 2
      bind = ${modifier}, 3, workspace, 3
      bind = ${modifier}, 4, workspace, 4
      bind = ${modifier}, 5, workspace, 5
      bind = ${modifier}, 6, workspace, 6
      bind = ${modifier}, 7, workspace, 7
      bind = ${modifier}, 8, workspace, 8
      bind = ${modifier}, 9, workspace, 9
      bind = ${modifier}, 0, workspace, 10
      bind = ${modifier} ALT, up, workspace, e+1
      bind = ${modifier} ALT, down, workspace, e-1
      bind = ${modifier} SHIFT, 1, movetoworkspace, 1
      bind = ${modifier} SHIFT, 2, movetoworkspace, 2
      bind = ${modifier} SHIFT, 3, movetoworkspace, 3
      bind = ${modifier} SHIFT, 4, movetoworkspace, 4
      bind = ${modifier} SHIFT, 5, movetoworkspace, 5
      bind = ${modifier} SHIFT, 6, movetoworkspace, 6
      bind = ${modifier} SHIFT, 7, movetoworkspace, 7
      bind = ${modifier} SHIFT, 8, movetoworkspace, 8
      bind = ${modifier} SHIFT, 9, movetoworkspace, 9
      bind = ${modifier} SHIFT, 0, movetoworkspace, 10
      bindm = ${modifier}, mouse:272, movewindow
      bindm = ${modifier}, mouse:273, resizewindow
      bind = ${modifier}, mouse_down, workspace, e+1
      bind = ${modifier}, mouse_up, workspace, e-1
    '' ];
  };
}
