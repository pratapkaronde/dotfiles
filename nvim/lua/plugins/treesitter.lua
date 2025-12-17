return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua", "vim", "javascript", "python", "c", "cpp", "go", "html" },
            highlight = { enable = true },
            indent = { enable = true }, 
            ensure_installed = { "lua", "markdown", "markdown_inline" },
            highlight = { enable = true }, 
        })
        local builtin = require("telescope.builtin")
        vim.keymap.set('n', '<C-p>', builtin.find_files, {})
    end,
}
