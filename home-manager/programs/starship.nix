{ config, lib, pkgs, ... }:

{
  programs = {
    starship = {
      enable = true;
      package = pkgs.starship;
      settings = {
        username = {
          style_user = "cyan bold";
          style_root = "red bold";
          format = "[$user]($style) ";
          disabled = false;
          show_always = true;
        };
        hostname = {
          ssh_only = false;
          format = "at [$hostname](bold cyan) in ";
          trim_at = ".";
          disabled = false;
        };
        character = {
          success_symbol = "[❯](bold cyan)";
          error_symbol = "[✗](bold red)";
        };
        directory = {
          read_only = " ";
          truncation_length = 10;
          truncate_to_repo = true;
          style = "bold italic cyan";
        };
        cmd_duration = {
          min_time = 1;
          format = "took [$duration]($style)";
          disabled = false;
          style = "bold italic cyan";
        };
        aws = {
          symbol = "  ";
        };
        conda =  {
          symbol = " ";
        };
        dart = {
          symbol = " ";
        };
        docker_context = {
          symbol = " ";
          format = "via [$symbol$context]($style) ";
          style = "blue bold";
          only_with_files = true;
          detect_files = ["docker-compose.yml" "docker-compose.yaml" "Dockerfile"];
          detect_folders = [];
          disabled = false;
        };
        elixir = {
          symbol = " ";
        };
        elm = {
          symbol = " ";
        };
        git_branch = {
          symbol = " ";
        };
        git_status = {
          format = "([$all_status$ahead_behind]($style) )";
          stashed = "[$count*](cyan)";
          modified = "[$count+](yellow)";
          deleted =  "[$count-](red)";
          conflicted =  "[$count~](red)";
          ahead = "⇡$count";
          behind = "⇣$count";
          untracked = "[$count?](blue)";
          staged = "[$count+](green)";
        };
        git_state = {
          style =	"bold red";
          format = "[$state( $progress_current/$progress_total) ]($style)";
          rebase = "rebase";
          merge = "merge";
          revert = "revert";
          cherry_pick = "cherry";
          bisect = "bisect";
          am = "am";
          am_or_rebase = "am/rebase";
        };
        golang =  {
          symbol = " ";
        };
        hg_branch = {
          symbol = " ";
        };
        java = {
          symbol = " ";
        };
        julia = {
          symbol = " ";
        };
        haskell = {
          symbol = "λ ";
        };
        memory_usage = {
          symbol = " ";
        };
        nim = {
          symbol = " ";
        };
        nix_shell = {
          symbol = " ";
        };
        package = {
          symbol = " "; 
        };
        perl = {
          symbol = " ";
        };
        php = {
          symbol = " ";
        };
        python = {
          symbol = "🐍 ";
          #pyenv_version_name = true;
          format = "via [$symbol python ($version )(\($virtualenv\) )]($style)";
          style = "bold yellow";
          pyenv_prefix = "venv ";
          python_binary = ["./venv/bin/python" "python" "python3" "python2"];
          detect_extensions = ["py"];
          version_format = "v$raw";
        };
        ruby = {
          symbol = " ";
        };
        rust = {
          symbol = " ";
        };
        scala = {
          symbol = " ";
        };
        shlvl = {
          symbol = " ";
        };
        swift = {
          symbol = "ﯣ ";
        };
        nodejs = {
          format = "via [ Node.js $version](bold green) ";
          detect_files = ["package.json" ".node-version"];
          detect_folders = ["node_modules"];
        };
      };
    };
  };
}
