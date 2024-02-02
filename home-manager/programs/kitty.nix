{ config, lib, pkgs, ... }:

{
  programs = {
    kitty = {
      enable = true;
      package = pkgs.kitty;
      settings = {
        font_family = "JetBrains Mono Nerd Font";
        italic_font = "auto";
        bold_font = "auto";
        bold_italic_font = "auto";
        font_size = 11;
        foreground = "#c0b18b";
        background = "#262626";
        background_opacity = "0.9";
        selection_foreground = "#2f2f2f";
        selection_background = "d75f5f";
        cursor = "#8fee96";
        cursor_shape = "underline";
        cursor_blink_interval = "0.5";
        cursor_stop_blinking_after = "15.0";
        scrollback_lines = "2000";
        scrollback_pager = "less +G -R";
        wheel_scroll_multiplier = "5.0";
        click_interval = "0.5";
        select_by_word_characters = ":@-./_~?&=%+#";
        mouse_hide_wait = "0.0";
        enabled_layouts = "*";
        remember_window_size = true;
        initial_window_width = "640";
        initial_window_height = "400";
        repaint_delay = "10";
        input_delay = "3";
        visual_bell_duration = "0.0";
        enable_audio_bell = false;
        open_url_modifiers = "ctrl+shift";
        open_url_with = "default";
        term = "xterm-kitty";
        window_border_width = "0";
        window_margin_width = "15";
        active_border_color = "#ffffff";
        inactive_border_color = "#cccccc";
        active_tab_foreground = "#000";
        active_tab_background = "#eee";
        inactive_tab_foreground = "#444";
        inactive_tab_background = "#999";

        # black
        color0 = "#2f2f2f";
        color8 = "#656565";

        # red
        color1 = "#d75f5f";
        color9 = "#d75f5f";

        # green
        color2 = "#d4d232";
        color10 = "#8fee96";

        # yellow
        color3 = "#af865a";
        color11 = "#cd950c";

        # blue
        color4 = "#22c3a1";
        color12 = "#22c3a1";

        # magenta
        color5 = "#775759";
        color13 = "#775759";

        # cyan
        color6 = "#84edb9";
        color14 = "#84edb9";

        # white
        color7 = "#c0b18b";
        color15 = "#d8d8d8";

        hide_window_decorations = true;
        macos_option_as_alt = false;
        macos_titlebar_color = "background";

        allow_remote_control = true;
        confirm_os_window_close = "0";
      };

      keybindings = {
        # Clipboard
         "super+v" = "paste_from_clipboard";
         "ctrl+shift+s" = "paste_from_selection";
         "super+c" = "copy_to_clipboard";
         "shift+insert" = "paste_from_selection";

        # Scrolling
         "ctrl+shift+up" = "scroll_line_up";
         "ctrl+shift+down" = "scroll_line_down";
         "ctrl+shift+k" = "scroll_line_up";
         "ctrl+shift+j" = "scroll_line_down";
         "ctrl+shift+page_up" = "scroll_page_up";
         "ctrl+shift+page_down" = "scroll_page_down";
         "ctrl+shift+home" = "scroll_home";
         "ctrl+shift+end" = "scroll_end";
         "ctrl+shift+h" = "show_scrollback";

        # Window management
         "super+n" = "new_os_window";
         "super+w" = "close_window";
         "ctrl+shift+enter" = "new_window";
         "ctrl+shift+]" = "next_window";
         "ctrl+shift+[" = "previous_window";
         "ctrl+shift+f" = "move_window_forward";
         "ctrl+shift+b" = "move_window_backward";
         "ctrl+shift+`" = "move_window_to_top";
         "ctrl+shift+1" = "first_window";
         "ctrl+shift+2" = "second_window";
         "ctrl+shift+3" = "third_window";
         "ctrl+shift+4" = "fourth_window";
         "ctrl+shift+5" = "fifth_window";
         "ctrl+shift+6" = "sixth_window";
         "ctrl+shift+7" = "seventh_window";
         "ctrl+shift+8" = "eighth_window";
         "ctrl+shift+9" = "ninth_window";
         "ctrl+shift+0" = "tenth_window";

        # Tab management
         "ctrl+shift+right" = "next_tab";
         "ctrl+shift+left" = "previous_tab";
         "ctrl+shift+t" = "new_tab";
         "ctrl+shift+q" = "close_tab";
         "ctrl+shift+l" = "next_layout";
         "ctrl+shift+." = "move_tab_forward";
         "ctrl+shift+," = "move_tab_backward";

        # Miscellaneous
         "ctrl++" = "increase_font_size";
         "ctrl+-" = "decrease_font_size";
         "ctrl+shift+backspace" = "restore_font_size";
      };

      theme = "Catppuccin-Mocha";
    };
  };
}
