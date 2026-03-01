{ pkgs, ... }:
{
  extraPackages = with pkgs; [
  ];

  # Autoformat
  # https://nix-community.github.io/nixvim/plugins/conform-nvim.html
  plugins.conform-nvim = {
    enable = true;
    autoInstall.enable = true;
    settings = {
      notify_on_error = false;
      format_on_save = ''
        function(bufnr)
          -- Disable "format_on_save lsp_fallback" for lanuages that don't
          -- have a well standardized coding style. You can add additional
          -- lanuages here or re-enable it for the disabled ones.
          local disable_filetypes = { }
          if disable_filetypes[vim.bo[bufnr].filetype] then
            return nil
          else
            return {
              timeout_ms = 500,
              lsp_format = "fallback",
            }
          end
        end
      '';
      formatters_by_ft = {
        c = [ "clang_format" ];
        cpp = [ "clang_format" ];
        css = [ "prettier" ];
        html = [ "prettier" ];
        lua = [ "stylua" ];
        javascript = [ "prettier" ];
        json = [ "prettier" ];
        markdown = [ "prettier" ];
        nix = [ "nixfmt" ];
        python = [ "black" ];
        rust = [ "rustfmt" ];

        # Conform can also run multiple formatters sequentially
        # You can use 'stop_after_first' to run the first available formatter from this list
        # javascript = {
        # __unkeyed-1 = "prettierd";
        # __unkeyed-2 = "prettier";
        # stop_after_first = true;
        #};
      };
      formatters = {
        clang_format = {
          prepend_args = [ "--style=file" ];
        };
      };
    };
  };

  # https://nix-community.github.io/nixvim/keymaps/index.html
  keymaps = [
    {
      mode = "";
      key = "<leader>f";
      action.__raw = ''
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end
      '';
      options = {
        desc = "[F]ormat buffer";
      };
    }
  ];
}
