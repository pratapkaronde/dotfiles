-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
    -- Your current options
    change_detection = {
        notify = false,
    },

    -- Advanced options you can add:
    root = vim.fn.stdpath("data") .. "/lazy", -- directory where plugins will be installed
    defaults = {
        lazy = false, -- should plugins be lazy-loaded by default?
        version = nil, -- always use the latest git commit
        cond = nil, -- condition function to disable plugins
    },
    install = {
        missing = true, -- install missing plugins on startup
        colorscheme = { "oxocarbon" }, -- colorscheme to use during installation
    },
    checker = {
        enabled = true, -- automatically check for plugin updates
        notify = true, -- get a notification when new updates are found
        frequency = 3600, -- check for updates every hour
    },
    performance = {
        cache = {
            enabled = true,
        },
        reset_packpath = true, -- reset the package path to improve startup time
        rtp = {
            reset = true, -- reset the runtime path to improve startup time
            paths = {}, -- add any custom paths here that you want to includes in the rtp
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
    ui = {
        size = { width = 0.8, height = 0.8 }, -- lazy.nvim UI size
        wrap = true, -- wrap the lines in the ui
        border = "none", -- border style: none, single, double, rounded, solid, shadow
        title = nil, -- title for the ui
        title_pos = "center", -- title position: center, left, right
        pills = true, -- show pills in the top of the ui
        icons = {
            cmd = "⌘",
            config = "🛠",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            require = "🌙",
            source = "📄",
            start = "🚀",
            task = "📋",
            lazy = "💤",
        },
    },
})

vim.cmd("set relativenumber")
vim.cmd("set expandtab")
vim.cmd("set shiftwidth=4")
vim.cmd("set tabstop=4")
vim.cmd("set smartindent")
vim.cmd("set hlsearch")
vim.cmd("set incsearch")
vim.diagnostic.enable = true
vim.diagnostic.config({
    virtual_lines = true,
})
