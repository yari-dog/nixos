-- LSP
vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig", -- just makes lsps work
    "https://github.com/folke/lazydev.nvim",    -- fix lua_ls malding about shit
    "https://github.com/stevearc/conform.nvim", -- code formatting while keeping stuff good
    "https://github.com/mason-org/mason.nvim",  -- mason, install lsp and shit
    "https://github.com/nvim-treesitter/nvim-treesitter",
})
-- get lua_ls to shut the fuck up
require('lazydev').setup {
    ft = "lua",
}

require('mason').setup({
    ui = {
        keymaps = {
            install_package = "I",
        },
    },
})

vim.lsp.enable({ 'lua_ls', 'rust_analyzer', 'clangd', 'cmake-language-server', 'tailwindcss-language-server', 'css-lsp',
    'asm-lsp', 'basedpyright', 'vim-language-server', 'nil', 'nixfmt' })

-- auto format, etc
require('conform').setup {
    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
    },
    formatters_by_ft = {
        python     = { "black" },
        c          = { "clang_format" },
        cpp        = { "clang_format" },
        javascript = { "prettier" },
        html       = { "prettier" },
        css        = { "prettier" },
        json       = { "prettier" },
        markdown   = { "prettier" },
        rust       = { "rustfmt" },
        asm        = { "asmfmt" },
        toml       = { "tombi" },
        nix        = { "nixfmt" }
    },
    formatters = {
        clang_format = {
            prepend_args = { '--style=file' },
        }
    }
}

vim.keymap.set('n', '<leader>cf', require('conform').format, { desc = "format buffer" })
-- idk
vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
})


-- LSP adjacent
vim.pack.add({
    "https://github.com/windwp/nvim-autopairs"
})

require('nvim-autopairs').setup()

require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "javascript", "python" },
    auto_install = true,
    highlight = {
        enable = true,
    }
}
