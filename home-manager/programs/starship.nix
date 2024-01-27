{ config, lib, pkgs, ... }:

{
  programs = {
    starship = {
      enable = true;
      package = pkgs.starship;
      settings = {
        # Username
        style_user = "cyan bold";
        style_root = "red bold";
        format = "[$user]($style) ";
        disabled = false;
        show_always = true;

        # Hostname
        ssh_only = false;
        format = "on [$hostname](bold cyan) in ";
        trim_at = ".";
        disabled = false;

        # Character
        success_symbol = "[❯](bold cyan)";
        error_symbol = "[✗](bold red)";

        # Directory
        read_only = " ";
        truncation_length = 10;
        trunchate_to_repo = true;
        style = "bold italic cyan";

        # Command duration
        min_time = 1;
        format = "took [$duration]($style)";
        disabled = false;
        style = "bold italic cyan";

        # Symbols
        symbol = "  "; # AWS
        symbol = " ";  # Conda
        symbol = " ";  # Dart
        symbol = " ";  # Elixir
        symbol = " ";  # Elm
        symbol = " ";  # Git Branch
        symbol = " ";  # Go
        symbol = " ";  # hg_branch
        symbol = " ";  # Java
        symbol = " ";  # Julia
        symbol = "λ ";  # Haskell
        symbol = " ";  # Memory Usage
        symbol = " ";  # Nim
        symbol = " ";  # Nix
        symbol = " ";  # Nix Shell
        symbol = " ";  # Package
        symbol = " ";  # Perl
        symbol = " ";  # PHP
        symbol = " ";  # Ruby
        symbol = " ";  # Rust
        symbol = " ";  # Scala
        symbol = " ";  # $SHLVL
        symbol = "ﯣ ";  # Swift

        # Docker Context
        symbol = " ";
        format = "via [$symbol$context]($style) ";
        style = "blue bold";
        only_with_files = true;
        detect_files = ["docker-compose.yml", "docker-compose.yaml", "Dockerfile"];
        detect_folders = [];
        disabled = false;

        # Git Status
        format = "([\[$all_status$ahead_behind\]]($style) )";
        stashed = "[${count}*](cyan)";
        modified = "[${count}+](yellow)";
        deleted =  "[${count}-](red)";
        conflicted =  "[${count}~](red)";
        ahead = "⇡${count}";
        behind = "⇣${count}";
        untracked = "[${count}?](blue)";
        staged = "[${count}+](green)";

        # Git State
        style =	"bold red";
        format = "[$state( $progress_current/$progress_total) ]($style)";
        rebase = "rebase";
        merge = "merge";
        revert = "revert";
        cherry_pick = "cherry";
        bisect = "bisect";
        am = "am";
        am_or_rebase = "am/rebase";

        # Node.js
        format = "via [ Node.js $version](bold green) ";
        detect_files = ["package.json", ".node-version"];
        detect_folders = ["node_modules"];

        # Python
        symbol = "🐍 ";
        #pyenv_version_name = true;
        format = 'via [${symbol}python (${version} )(\($virtualenv\) )]($style)';
        style = "bold yellow";
        pyenv_prefix = "venv ";
        python_binary = ["./venv/bin/python", "python", "python3", "python2"];
        detect_extensions = ["py"];
        version_format = "v${raw}";
      };
    };
  };
}
