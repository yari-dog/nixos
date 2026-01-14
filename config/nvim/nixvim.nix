{
  pkgs,
  inputs,
  ...
}:
let
  enable_nerd_fonts = false;
in
{
  imports = [ inputs.nixvim.homeModules.nixvim ];
  stylix.targets.nixvim.enable = false;
  programs.nixvim = {
    enable = true;
    imports = [
      # config options
      ./keybinds.nix

      # Plugins
      ./plugins/gitsigns.nix
      ./plugins/which-key.nix
      ./plugins/telescope.nix
      ./plugins/lsp.nix
      ./plugins/conform.nix
      ./plugins/blink-cmp.nix
      ./plugins/todo-comments.nix
      ./plugins/mini.nix
      ./plugins/treesitter.nix
      ./plugins/bufferline.nix
      ./plugins/smear-cursor.nix

      # NOTE: Add/Configure additional plugins for Kickstart.nixvim
      #
      #  Here are some example plugins that I've included in the Kickstart repository.
      #  Uncomment any of the lines below to enable them (you will need to restart nvim).
      #
      # ./config/plugins/kickstart/debug.nix
      # ./config/plugins/kickstart/indent-blankline.nix
      # ./config/plugins/kickstart/lint.nix
      # ./config/plugins/kickstart/autopairs.nix
      # ./config/plugins/kickstart/neo-tree.nix
      #
      # NOTE: Configure your own plugins `see https://nix-community.github.io/nixvim/`
      # Add your plugins to ./config/plugins/custom and import them below
    ];

    colorschemes = {
      gruvbox = {
        enable = true;
        settings = {
          overrides = {
            "@lsp.type.variable" = {
              bold = true;
            };
            "@property" = {
              fg = "#ebdbb2";
              italic = true;
            };
            "@variable.member" = {
              fg = "#ebdbb2";
              italic = true;
            };
            "@lsp.type.const" = {
              bold = true;
            };
            "@string" = {
              fg = "#8ec07c";
              italic = true;
            };
            "@punctuation.bracket" = {
              link = "GruvboxFg1";
            };
            "@punctuation.delimiter" = {
              link = "GruvboxFg1";
            };
            "@constructor" = {
              link = "GruvboxFg1";
            };
          };
        };
      };
    };

    # https://nix-community.github.io/nixvim/NeovimOptions/index.html#globals
    globals = {
      # Set <space> as the leader key
      # See `:help mapleader`
      mapleader = " ";
      maplocalleader = " ";

      # Set to true if you have a Nerd Font installed and selected in the terminal
      have_nerd_font = enable_nerd_fonts;
    };

    #  See `:help 'clipboard'`
    clipboard = {
      providers = {
        wl-copy.enable = true; # For Wayland
        xsel.enable = true; # For X11
      };

      # Sync clipboard between OS and Neovim
      #  Remove this option if you want your OS clipboard to remain independent.
      register = "unnamedplus";
    };

    # [[ Setting options ]]
    # See `:help vim.o`
    # NOTE: You can change these options as you wish!
    #  For more options, you can see `:help option-list`
    # https://nix-community.github.io/nixvim/NeovimOptions/index.html#opts
    opts = {
      showmode = false; # hide mode
      breakindent = true; # wrapped text indent
      undofile = true; # save undo history to file

      ignorecase = true; # in search
      smartcase = true;

      signcolumn = "yes:1"; # put current line in sign col
      number = true;
      relativenumber = true;

      updatetime = 250;
      timeoutlen = 300;

      splitright = true; # clear
      splitbelow = true;

      list = true; # idfk
      listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";

      inccommand = "split"; # preview substitutions
      cursorline = true; # show line cursor is on
      scrolloff = 15; # how many to scroll before scrolling

      # if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
      # instead raise a dialog asking if you wish to save the current file(s)
      # See `:help 'confirm'`
      confirm = true;

      # See `:help hlsearch`
      hlsearch = true;
    };

    # [[ Basic Keymaps ]]
    #  See `:help vim.keymap.set()`
    # https://nix-community.github.io/nixvim/keymaps/index.html

    # https://nix-community.github.io/nixvim/NeovimOptions/autoGroups/index.html
    autoGroups = {
      kickstart-highlight-yank = {
        clear = true;
      };
    };

    # [[ Basic Autocommands ]]
    #  See `:help lua-guide-autocommands`
    # https://nix-community.github.io/nixvim/NeovimOptions/autoCmd/index.html
    autoCmd = [
      # Highlight when yanking (copying) text
      #  Try it with `yap` in normal mode
      #  See `:help vim.hl.on_yank()`
      {
        event = [ "TextYankPost" ];
        desc = "Highlight when yanking (copying) text";
        group = "kickstart-highlight-yank";
        callback.__raw = ''
          function()
            vim.hl.on_yank()
          end
        '';
      }
    ];

    diagnostic = {
      settings = {
        severity_sort = true;
        float = {
          border = "rounded";
          source = "if_many";
        };
        underline = {
          severity.__raw = ''vim.diagnostic.severity.ERROR'';
        };
        signs.__raw = ''
          vim.g.have_nerd_font and {
            text = {
              [vim.diagnostic.severity.ERROR] = '󰅚 ',
              [vim.diagnostic.severity.WARN] = '󰀪 ',
              [vim.diagnostic.severity.INFO] = '󰋽 ',
              [vim.diagnostic.severity.HINT] = '󰌶 ',
            },
          } or {}
        '';
        virtual_text = {
          source = "if_many";
          spacing = 2;
          format.__raw = ''
            function(diagnostic)
              local diagnostic_message = {
                [vim.diagnostic.severity.ERROR] = diagnostic.message,
                [vim.diagnostic.severity.WARN] = diagnostic.message,
                [vim.diagnostic.severity.INFO] = diagnostic.message,
                [vim.diagnostic.severity.HINT] = diagnostic.message,
              }
              return diagnostic_message[diagnostic.severity]
            end
          '';
        };
      };
    };

    plugins = {
      # Adds icons for plugins to utilize in ui
      web-devicons.enable = enable_nerd_fonts;

      # Detect tabstop and shiftwidth automatically
      guess-indent = {
        enable = true;
      };
    };

    # https://nix-community.github.io/nixvim/NeovimOptions/index.html#extraplugins
    extraPlugins = with pkgs.vimPlugins; [
    ];

    # https://nix-community.github.io/nixvim/NeovimOptions/index.html#extraconfigluapost
    extraConfigLuaPost = ''
      -- The line beneath this is called `modeline`. See `:help modeline`
      -- vim: ts=2 sts=2 sw=2 et
    '';
  };
}
