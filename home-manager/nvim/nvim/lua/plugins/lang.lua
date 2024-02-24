-- lazy.lang
-- clangd, go, json, markdown, python, rust, typescript, yaml

return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            { "nushell/tree-sitter-nu" },
        },
        opts = {
            ensure_installed = {
                "bash",
                "nix",
                "nu",

                "html",
                "javascript",
                "jsdoc",
                "svelte",
                "scss",
                "css",

                "lua",
                "luadoc",
                "luap",

                "query",
                "regex",
                "vim",
                "vimdoc",
                "arduino", 
            },
        },
    },
}
