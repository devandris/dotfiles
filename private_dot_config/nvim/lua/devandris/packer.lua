-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use 'joshdick/onedark.vim'
    use 'AlexvZyl/nordic.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }


    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use 'simrat39/symbols-outline.nvim'
    use 'ThePrimeagen/harpoon'
    use 'mbbill/undotree'

    use 'tpope/vim-surround'
    use 'numToStr/Comment.nvim'
    use 'junegunn/gv.vim'

    use 'tpope/vim-fugitive'
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
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
    }

    use({
        "L3MON4D3/LuaSnip",
        tag = "v2.*",
    })

    use 'mfussenegger/nvim-jdtls'
    use { 'echasnovski/mini.pairs', branch = 'stable' }
    -- Lualine
    use 'nvim-tree/nvim-web-devicons'
    use {
        "nvim-lualine/lualine.nvim",
    }
    use { 'topaxi/gh-actions.nvim',
        requires = { 'MunifTanjim/nui.nvim' },
    }
    use 'mfussenegger/nvim-lint'
    use 'junegunn/goyo.vim'
    use 'preservim/vim-pencil'
    use 'junegunn/limelight.vim'
    -- use 'fatih/vim-go'
    use {
        "vinnymeller/swagger-preview.nvim",
        run = "npm install -g swagger-ui-watcher",
    }
    use 'iamcco/markdown-preview.nvim'

    use 'mfussenegger/nvim-dap'
    use 'leoluz/nvim-dap-go'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'
    use "rafamadriz/friendly-snippets"
    use "pwntester/octo.nvim"
    use "IndianBoy42/tree-sitter-just"
    use "NoahTheDuke/vim-just"
    use {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end
    }
    -- use "rest-nvim/rest.nvim"
    use "BlackLight/nvim-http"
end
)
