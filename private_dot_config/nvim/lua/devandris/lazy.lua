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

local M = {}

function M.setup()
    require('lazy').setup({

        {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.5',
            -- or                            , branch = '0.1.x',
            dependencies = { { 'nvim-lua/plenary.nvim' } }
        },

        { 'rose-pine/neovim',      as = 'rose-pine' },
        'joshdick/onedark.vim',
        'AlexvZyl/nordic.nvim',
        { "catppuccin/nvim",       as = "catppuccin" },
        { "EdenEast/nightfox.nvim" },


        'nvim-treesitter/nvim-treesitter',
        'ThePrimeagen/harpoon',
        'mbbill/undotree',

        'tpope/vim-surround',
        'numToStr/Comment.nvim',
        'junegunn/gv.vim',

        'tpope/vim-fugitive',
        {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v2.x',
            dependencies = {
                -- LSP Support
                { 'neovim/nvim-lspconfig' },             -- Required
                { 'williamboman/mason.nvim' },           -- Optional
                { 'williamboman/mason-lspconfig.nvim' }, -- Optional

                -- Autocompletion
                { 'hrsh7th/nvim-cmp' }, -- Required
                { 'hrsh7th/cmp-buffer' },
                { 'hrsh7th/cmp-path' },
                { 'hrsh7th/cmp-nvim-lsp' }, -- Required
                { 'hrsh7th/cmp-nvim-lua' }, -- Required
                { 'saadparwaiz1/cmp_luasnip' }
            }
        },

        {
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!).
            build = "make install_jsregexp"
        },

        'mfussenegger/nvim-jdtls',
        { 'echasnovski/mini.pairs', branch = 'stable' },
        'nvim-tree/nvim-web-devicons',
        "nvim-lualine/lualine.nvim",
        'mfussenegger/nvim-lint',
        'junegunn/goyo.vim',
        'preservim/vim-pencil',
        'junegunn/limelight.vim',
        -- 'fatih/vim-go',
        {
            "vinnymeller/swagger-preview.nvim",
            build = "npm install -g swagger-ui-watcher",
        },
        'iamcco/markdown-preview.nvim',

        'mfussenegger/nvim-dap',
        'leoluz/nvim-dap-go',
        'rcarriga/nvim-dap-ui',
        'theHamsta/nvim-dap-virtual-text',
        "rafamadriz/friendly-snippets",
        "pwntester/octo.nvim",
        "IndianBoy42/tree-sitter-just",
        "NoahTheDuke/vim-just",
        'folke/todo-comments.nvim',
        {
            'glacambre/firenvim',
            build = function() vim.fn['firenvim#install'](0) end
        },
        {
            dir = "~/Documents/projects/nvim-plugin/ropogos",
            name = "ropogos",

        },
        {
            "ray-x/go.nvim",
            dependencies = { -- optional packages
                "ray-x/guihua.lua",
                "neovim/nvim-lspconfig",
                "nvim-treesitter/nvim-treesitter",
            },
            event = { "CmdlineEnter" },
            ft = { "go", 'gomod' },
            build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
        },
        { "folke/neodev.nvim",      opts = {} },
        { 'stevearc/aerial.nvim' },
        {
            "jellydn/hurl.nvim",
            dependencies = { "MunifTanjim/nui.nvim" },
            ft = "hurl",
            opts = {
                -- Show debugging info
                debug = false,
                -- Show response in popup or split
                mode = "split",
                -- Default formatter
                formatters = {
                    json = { 'jq' }, -- Make sure you have install jq in your system, e.g: brew install jq
                    html = {
                        'prettier',  -- Make sure you have install prettier in your system, e.g: npm install -g prettier
                        '--parser',
                        'html',
                    },
                },
            },
            keys = {
                -- Run API request
                { "<leader>A",  "<cmd>HurlRunner<CR>",        desc = "Run All requests" },
                { "<leader>a",  "<cmd>HurlRunnerAt<CR>",      desc = "Run Api request" },
                { "<leader>te", "<cmd>HurlRunnerToEntry<CR>", desc = "Run Api request to entry" },
                { "<leader>tm", "<cmd>HurlToggleMode<CR>",    desc = "Hurl Toggle Mode" },
                { "<leader>tv", "<cmd>HurlVerbose<CR>",       desc = "Run Api in verbose mode" },
                -- Run Hurl request in visual mode
                { "<leader>h",  ":HurlRunner<CR>",            desc = "Hurl Runner",             mode = "v" },
            },
        }
    }
    )
end

return M
