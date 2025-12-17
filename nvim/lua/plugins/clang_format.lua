return {
    "rhysd/vim-clang-format",
    name = "clang-format",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd([[ autocmd FileType c,cpp ClangFormatAutoEnable ]])
        vim.keymap.set('n', '<Leader>cf', ':ClangFormat<CR>', {noremap = true, silent = true})
    end,
}
