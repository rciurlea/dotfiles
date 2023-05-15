return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
        -- LSP Support
        { "neovim/nvim-lspconfig" },
        -- LSP Auto-downloads
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        -- Autocomplete
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },
        -- { "onsails/lspkind.nvim" },
        { "L3MON4D3/LuaSnip" },
    },
    config = function()
        local lsp = require("lsp-zero").preset({ name = "recommended" })
        lsp.on_attach(function(_, bufnr)
            lsp.default_keymaps { buffer = bufnr }
        end)

        lsp.set_sign_icons({
            error = '✘',
            warn = '▲',
            hint = '⚑',
            info = '»'
        })

        require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
        lsp.setup()

        local cmp = require "cmp"
        -- local lspkind = require "lspkind"
        cmp.setup({
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
        })
    end,
}
