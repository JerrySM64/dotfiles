{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;

    extraPackages = with pkgs; [
      gopls
      luajitPackages.lua-lsp
      lua-language-server
      marksman
      nil
      pyright
      rust-analyzer
      wl-clipboard
      xclip
      yaml-language-server
    ];

    plugins = with pkgs.vimPlugins; [
      alpha-nvim
      bufferline-nvim
      cmp-buffer
      cmp_luasnip
      cmp-nvim-lsp
      comment-nvim
      dressing-nvim
      friendly-snippets
      indent-blankline-nvim
      lspkind-nvim
      lualine-nvim
      luasnip
      neodev-nvim
      neovim-ayu
      nui-nvim
      nvim-autopairs
      nvim-cmp
      nvim-lspconfig
      nvim-surround
      nvim-tree-lua
      nvim-treesitter.withAllGrammars
      nvim-web-devicons
      nvim-ts-context-commentstring
      plenary-nvim
      telescope-fzf-native-nvim
      telescope-nvim
      todo-comments-nvim
      vim-tmux-navigator
    ];

    extraConfig = ''
      set noemoji
    '';

    extraLuaConfig = ''
      ${builtins.readFile ./nvim/options.lua}
      ${builtins.readFile ./nvim/keymaps.lua}
      ${builtins.readFile ./nvim/plugins/alpha.lua}
      ${builtins.readFile ./nvim/plugins/autopairs.lua}
      ${builtins.readFile ./nvim/plugins/comment.lua}
      ${builtins.readFile ./nvim/plugins/cmp.lua}
      ${builtins.readFile ./nvim/plugins/lsp.lua}
      ${builtins.readFile ./nvim/plugins/nvim-tree.lua}
      ${builtins.readFile ./nvim/plugins/telescope.lua}
      ${builtins.readFile ./nvim/plugins/todo-comments.lua}
      ${builtins.readFile ./nvim/plugins/treesitter.lua}
      require("ibl").setup()
      require("bufferline").setup()
      require("lualine").setup({
        options = {
          theme = "ayu_dark",
        },
      })
      require("ayu").setup({
        mirage = false,
        terminal = false,
        overrides = {
          Normal = { bg = "None" },
          NormalFloat = { bg = "None" },
          ColorColumn = { bg = "None" },
          SignColumn = { bg = "None" },
          Folded = { bg = "None" },
          FoldColumn = { bg = "None" },
          CursorLine = { bg = "None" },
          CursorColumn = { bg = "None" },
          VertSplit = { bg = "None" },
        }
      })
    '';
  };

  home.packages = with pkgs; [
    ripgrep
  ];
}
