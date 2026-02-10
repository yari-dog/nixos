{
  plugins.oil = {
    enable = true;
    settings = {
      default_file_explorer = false;
      # keymaps = {
      #     "N" = { "actions.parent"; mode = "n"; };
      #     "gn" = { "actions.parent"; mode = "n"; };
      #     "p" = { "actions.preview"; mode = "n"; };
      #     "qq" = { "actions.close"; mode = "n"; };
      #     "<Esc>" = { "actions.close"; mode = "n" };
      #     "wv" = { "actions.select"; opts = { vertical = true }; };
      #     "wh" = { "actions.select"; opts = { horizontal = true }; };
      # };
      skip_confirm_for_simple_edits = true;
      keymaps_help = {
        border = "bold";
      };
    };
    luaConfig.pre = ''
        keymaps = {
          ["N"] = { "actions.parent", mode = "n" },
          ["gn"] = { "actions.parent", mode = "n" },
          ["p"] = { "actions.preview", mode = "n" },
          ["qq"] = { "actions.close", mode = "n" },
          ["<Esc>"] = { "actions.close", mode = "n" },
          ["wv"] = { "actions.select", opts = { vertical = true } },
          ["wh"] = { "actions.select", opts = { horizontal = true } },
      }
    '';
  };
}
