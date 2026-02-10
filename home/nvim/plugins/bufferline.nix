{
  plugins.bufferline = {
    enable = true;
    settings = {
      options = {
        style_preset = [
          "bufferline.style_preset.no_italic"
          "bufferline.style_preset.minimal"
        ];
        numbers = "none";
        close_command = "bdelete! %d";
        left_mouse_command = "buffer %d";
        indicator = {
          icon = ""; # this should be omitted if indicator style is not 'icon'
        };
        buffer_close_icon = "X";
        modified_icon = "*";
        close_icon = "X";
        left_trunc_marker = "<";
        right_trunc_marker = ">";
        max_name_length = 18;
        max_prefix_length = 15;
        tab_size = 15;
        diagnostics = false;
        custom_filter = ''
          function(bufnr)
                                -- if the result is false, this buffer will be shown, otherwise, this
                                -- buffer will be hidden.

                                -- filter out filetypes you don't want to see
                                local exclude_ft = { "qf", "fugitive", "git" }
                                local cur_ft = vim.bo[bufnr].filetype
                                local should_filter = vim.tbl_contains(exclude_ft, cur_ft)

                                if should_filter then
                                    return false
                                end

                                return true
                            end'';
        show_buffer_icons = false;
        show_buffer_close_icons = true;
        show_close_icon = true;
        show_tab_indicators = false;
        persist_buffer_sort = true; # whether or not custom sorted buffers should persist
        enforce_regular_tabs = false;
        always_show_bufferline = true;
        sort_by = "id";
      };
    };
  };
}
