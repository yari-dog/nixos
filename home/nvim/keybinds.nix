# some keybinds to remember:
# --- normal
# ------ gv - reselect last visual selection
# ------ folds are with z!
# ------ K is man page
# ------ ga prints the ascii of char under cur
# ------ zz position cursor in center of screen without changing line
# ------ [I show lines containing whats under cur, ]I is for the word version
# ------ <C-j> to join
# --- commands
# ------ :%s/old/new to replace old to new on all lines. only does it on first one unless /g added
# ------ :'<,'>s/old/new to replace within visual sel (use numbers to specify instaead of a visual selection)
# ------ :g/pattern/command runs the specified command on all lines
# ------ :v/p/c does the same as above but the opposite, running it on all the non matching lines
# ------ run @: to repeat last command, and then just @@ after that for subsequent repeats

# ----- SOME LSP SHIT IS IN LSP.NIX RN. I NEED TO PULL THEM TOGETHER AT SOME POINT

{
  extraConfigLua = ''
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "



    ---------------------------------------------- COLEMAK
    -- Colemak up/down/right with nei
    vim.keymap.set({ "n", "o", "x" }, "n", "h")
    vim.keymap.set({ "n", "o", "x" }, "e", "gj", { remap = false })
    vim.keymap.set({ "n", "o", "x" }, "i", "gk", { remap = false })
    vim.keymap.set({ "n", "o", "x" }, "o", "l")

    -- add line above/below
    vim.keymap.set({ "n", "o", "x" }, "E", "o")
    vim.keymap.set({ "n", "o", "x" }, "I", "O")

    -- End/Start of word forward/backward
    vim.keymap.set({ "n", "o", "x" }, "l", "e", { desc = "End of word forward" })
    vim.keymap.set({ "n", "o", "x" }, "L", "E", { desc = "End of WORD forward" })
    vim.keymap.set({ "n", "o", "x" }, "j", "ge", { desc = "End of word back" })
    vim.keymap.set({ "n", "o", "x" }, "J", "gE", { desc = "End of WORD back" }) -- replace :join with <C-j> v
    vim.keymap.set({ "n", "o", "x" }, "<C-j>", "J", { desc = "Join above" })
    -- w & b are unchanged

    -- Jumplist navigation
    vim.keymap.set("n", "go", "<C-i>", { desc = "Jumplist forward" }) -- <C-n> and <C-o> are in misc->buffers
    vim.keymap.set("n", "gn", "<C-o>", { desc = "Jumplist back" })


    -- Text objects
    vim.keymap.set({ "o", "v", "x" }, "t", "i", { desc = "O/V mode: inner (i)" })
    -- vim.keymap.set({ "o", "v", "x" }, "a", "a", { desc = "O/V mode: a/an (a)" }) NOTE: still here to remember

      -- insert (T)
    vim.keymap.set("n", "t", "i")
    vim.keymap.set({ "n", "v" }, "T", "I")

    -- Undo/redo
    -- vim.keymap.set({ "n" }, "<C-r>", "U")
    vim.keymap.set("n", "U", "<C-r>")

    -- Search
    vim.keymap.set({ "n", "o", "x" }, "h", "n") -- NOTE: reminder to self that in v mode * in search selection forward, # is back
    vim.keymap.set({ "n", "o", "x" }, "H", "N")

    -- Man page rebind
    vim.keymap.set({ "n", "x" }, "gK", "K")



    ---------------------------------------------- PLUGINS (short because most are set in plugin config)
    -- mini
    vim.keymap.set("n", "<leader>po", ":Pick files<CR>", { desc = "mini.pick " }) -- TODO: install mini picker, cause tbh it can be faster than yazi
    vim.keymap.set("n", "<leader>ph", ":Pick help<CR>", { desc = "mini help" })

    -- oil
    vim.keymap.set("n", "<leader>e", ":Yazi<CR>", { desc = "yazi" })

    -- lsp binds
    vim.keymap.set("n", "<leader>co", vim.diagnostic.open_float, { desc = "open float" }) --idk if this works ?
    -- neither of the below work for some reason. [d and ]d do though?
    -- vim.keymap.set("n", "<leader>c[", "[d", { desc = "goto prev warning/error" })
    -- vim.keymap.set("n", "<leader>c]", "]d", { desc = "goto next warning/error" })
    -- vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "goto definition" })
    -- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "code action" })
    -- vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "rename" })
    -- vim.keymap.set("n", "<leader>ck", vim.lsp.buf.hover, { desc = "hover" })
    -- vim.keymap.set("n", "<leader>ch", "<cmd>LspClangdSwitchSourceHeader<cr>", { desc = "switch to header" })



    ---------------------------------------------- WINDOWING
    -- Move to window using the <ctrl> hjkl keys
    vim.keymap.set({ "n", "v" }, "<Leader>wn", "<C-w>h", { desc = "Go to Left Window", remap = false })
    vim.keymap.set({ "n", "v" }, "<Leader>we", "<C-w>j", { desc = "Go to lower Window", remap = false })
    vim.keymap.set({ "n", "v" }, "<Leader>wi", "<C-w>k", { desc = "Go to upper Window", remap = false })
    vim.keymap.set({ "n", "v" }, "<Leader>wo", "<C-w>l", { desc = "Go to right Window", remap = false })
    vim.keymap.set({ "n", "v" }, "<Leader>wN", "<C-w>H", { desc = "move window left", remap = false })
    vim.keymap.set({ "n", "v" }, "<Leader>wE", "<C-w>J", { desc = "move window down", remap = false })
    vim.keymap.set({ "n", "v" }, "<Leader>wI", "<C-w>K", { desc = "move window up", remap = false })
    vim.keymap.set({ "n", "v" }, "<Leader>wO", "<C-w>L", { desc = "move window right", remap = false })

    -- open windows in ,,
    vim.keymap.set("n", "<Leader>wd", "<C-w>s", { desc = "open window below" })
    vim.keymap.set("n", "<Leader>wg", "<C-w>v", { desc = "open window to right" })
    vim.keymap.set("n", "<Leader>wk", ":q<CR>", { silent = true, desc = "1984 window" })

    -- Resize window using <ctrl> arrow keys
    vim.keymap.set("n", "<C-Up>", "<cmd>resize -2<cr>", { desc = "Increase Window Height" })
    vim.keymap.set("n", "<C-Down>", "<cmd>resize +2<cr>", { desc = "Decrease Window Height" })
    vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize +2<cr>", { desc = "Decrease Window Width" })
    vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize -2<cr>", { desc = "Increase Window Width" })



    ---------------------------------------------- MISC
    vim.keymap.set("n", "<CR>", "V") -- select current line
    vim.keymap.set("t", "<Esc>", "<C-\\><C-n>") -- escape terminal easier

    -- swap ; and , because it makes more sense to me
    vim.keymap.set({ "n", "o", "x" }, ";", ",")
    vim.keymap.set({ "n", "o", "x" }, ",", ";")

    -- PageUp/PageDown
    vim.keymap.set({ "n", "x" }, "m", "15gk", { desc = "PgUp" })
    vim.keymap.set({ "n", "x" }, "k", "15gj", { desc = "PgDown" })

    -- stop overwriting registers when pasting or xing
    vim.keymap.set({ "n", "v" }, "x", "\"_x")
    vim.keymap.set("x", "p", "\"_dP")
    vim.keymap.set("x", "P", "p")

    -- buffers
    vim.keymap.set("n", "ge", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
    vim.keymap.set("n", "gi", "<cmd>bnext<cr>", { desc = "Next Buffer" })
    vim.keymap.set("n", "<Leader>bk", "<cmd>bp<bar>sp<bar>bn<bar>bd!<cr>", { desc = "Kill Buffer" })
    vim.keymap.set("n", "<Leader>bl", "<cmd>ls<cr>", { desc = "list Buffer" })

    -- Move Lines
    vim.keymap.set("n", "<A-e>", "<cmd>execute \"move .+\" . v:count1<cr>==", { desc = "Move Down" })
    vim.keymap.set("n", "<A-i>", "<cmd>execute \"move .-\" . (v:count1 + 1)<cr>==", { desc = "Move Up" })
    vim.keymap.set("i", "<A-e>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
    vim.keymap.set("i", "<A-i>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
    vim.keymap.set("v", "<A-e>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
    vim.keymap.set("v", "<A-i>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
  '';
}
