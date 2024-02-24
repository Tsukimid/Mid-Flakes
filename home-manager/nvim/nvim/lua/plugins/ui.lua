return {
    { "rcarriga/nvim-notify", enabled = false },
    { "stevearc/dressing.nvim", enabled = false },
    { "williamboman/mason.nvim", enabled = false},
    { "williamboman/mason-lspconfig.nvim", enabled = false},

    {
        "folke/tokyonight.nvim",
        lazy = true,
        opts = { style = "night" },
    }
}
