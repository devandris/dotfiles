require("neodev").setup({
    -- add any options here, or leave empty to use the default settings
})
local lsp = require('lsp-zero').preset({
    {
        float_border = 'rounded',
        call_servers = 'local',
        configure_diagnostics = true,
        setup_servers_on_start = true,
        set_lsp_keymaps = {
            preserve_mappings = false,
            omit = {},
        },
        manage_nvim_cmp = {
        },
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "<leader><leader>vd", ":lua vim.diagnostic.open_float()<CR>", opts)
    vim.keymap.set("n", "<leader><leader>gd", ":lua vim.lsp.buf.definition()<CR>", opts)
    vim.keymap.set("n", "<leader><leader>gr", ":lua vim.lsp.buf.references()<CR>", opts)
    vim.keymap.set("n", "<leader><leader>gt", ":lua vim.lsp.buf.type_definition()<CR>", opts)
    vim.keymap.set("n", "<leader><leader>gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
    vim.keymap.set('n', 'K', ":lua vim.lsp.buf.hover()<CR>", opts)
    vim.keymap.set('n', '<C-h>', ":lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.keymap.set("n", "<leader>ws", ":lua vim.lsp.buf.workspace_symbol()<CR>", opts)
    vim.keymap.set('n', '<leader>wa', ":lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    vim.keymap.set('n', '<leader>wr', ":lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    vim.keymap.set('n', '<leader>wl', ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    vim.keymap.set('n', '<leader>rn', ":lua vim.lsp.buf.rename()<CR>", opts)
    vim.keymap.set({ 'v', 'n' }, '<leader>ac', ":lua vim.lsp.buf.code_action()<CR>", opts)
    vim.keymap.set('n', '<leader>fs', ":lua vim.lsp.buf.format({async=true})<CR>", opts)
    vim.keymap.set('n', '<leader>dQ', ":lua vim.diagnostic.setqflist()<CR>", opts)
    vim.keymap.set('n', '<leader>dq', ":lua vim.diagnostic.setloclist()<CR>", opts)
    vim.keymap.set('n', '<leader>]', ":lua vim.diagnostic.goto_next({ float = true })<CR>", opts)
    vim.keymap.set('n', '<leader>[', ":lua vim.diagnostic.goto_prev()<CR>", opts)
end)



lsp.nvim_workspace(
    { library = vim.api.nvim_get_runtime_file('/home/devandris/.local/share/nvim/lazy/**/.*', true) }
)

lsp.skip_server_setup({ 'jdtls' })
lsp.skip_server_setup({ 'gopls' })
lsp.setup()

-- local lspconfig = require "lspconfig"
-- local util = require "lspconfig/util"
-- lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "<leader><leader>vd", ":lua vim.diagnostic.open_float()<CR>", opts)
    vim.keymap.set("n", "<leader><leader>gd", ":lua vim.lsp.buf.definition()<CR>", opts)
    vim.keymap.set("n", "<leader><leader>gr", ":lua vim.lsp.buf.references()<CR>", opts)
    vim.keymap.set("n", "<leader><leader>gt", ":lua vim.lsp.buf.type_definition()<CR>", opts)
    vim.keymap.set("n", "<leader><leader>gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
    vim.keymap.set('n', 'K', ":lua vim.lsp.buf.hover()<CR>", opts)
    vim.keymap.set('n', '<C-h>', ":lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.keymap.set("n", "<leader>ws", ":lua vim.lsp.buf.workspace_symbol()<CR>", opts)
    vim.keymap.set('n', '<leader>wa', ":lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    vim.keymap.set('n', '<leader>wr', ":lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    vim.keymap.set('n', '<leader>wl', ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    vim.keymap.set('n', '<leader>rn', ":lua vim.lsp.buf.rename()<CR>", opts)
    vim.keymap.set('n', '<leader>ac', ":lua vim.lsp.buf.code_action()<CR>", opts)
    -- vim.keymap.set('v', '<leader>ac', function() Go_ac() end, opts)
    vim.keymap.set('n', '<leader>fs', ":lua vim.lsp.buf.format({async=true})<CR>", opts)
    vim.keymap.set('n', '<leader>dQ', ":lua vim.diagnostic.setqflist()<CR>", opts)
    vim.keymap.set('n', '<leader>dq', ":lua vim.diagnostic.setloclist()<CR>", opts)
    vim.keymap.set('n', '<leader>]', ":lua vim.diagnostic.goto_next({ float = true })<CR>", opts)
    vim.keymap.set('n', '<leader>[', ":lua vim.diagnostic.goto_prev()<CR>", opts)
end

-- { "quickfix", "refactor.extract", "refactor.rewrite", "source.fixAll", "source.organizeImports" }
-- Go_ac = function()
--     local params = vim.lsp.util.make_range_params()
--     params.context = { only = { "refactor", "refactor.extract", "quickfix", "refactor.rewrite", "source.fixAll" } }
--     -- buf_request_sync defaults to a 1000ms timeout. Depending on your
--     -- machine and codebase, you may want longer. Add an additional
--     -- argument after params if you find that you have to write the file
--     -- twice for changes to be saved.
--     -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
--     -- local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
--     vim.lsp.buf.code_action({ context = params })
--     -- vim.lsp.buf.format({async = false})
-- end

-- require('go').setup{
--   lsp_cfg = false
--   -- other setups...
-- }
-- local cfg = require'go.lsp'.config() -- config() return the go.nvim gopls setup

-- require('lspconfig').gopls.setup(
--     {
--         cmd = { '/home/devandris/.local/share/nvim/mason/bin/gopls', 'serve' },
--         on_attach = on_attach,
--
--         capabilities = {
--             textDocument = {
--                 completion = {
--                     completionItem = {
--                         commitCharactersSupport = true,
--                         deprecatedSupport = true,
--                         documentationFormat = { 'markdown', 'plaintext' },
--                         preselectSupport = true,
--                         insertReplaceSupport = true,
--                         labelDetailsSupport = true,
--                         snippetSupport = true,
--                         resolveSupport = {
--                             properties = {
--                                 'documentation',
--                                 'details',
--                                 'additionalTextEdits',
--                             },
--                         },
--                     },
--                     contextSupport = true,
--                     dynamicRegistration = true,
--                 },
--             },
--         },
--         filetypes = { 'go', 'gomod', 'gosum', 'gotmpl', 'gohtmltmpl', 'gotexttmpl' },
--         message_level = vim.lsp.protocol.MessageType.ERROR,
--         -- flags = { allow_incremental_sync = true, debounce_text_changes = 500 },
--         settings = {
--             gopls = {
--                 -- more settings: https://github.com/golang/tools/blob/master/gopls/doc/settings.md
--                 -- not supported
--                 -- semanticTokens = true,
--                 analyses = {
--                     unreachable = true,
--                     nilness = true,
--                     unusedparams = true,
--                     useany = true,
--                     unusedwrite = true,
--                     ST1003 = true,
--                     ST1016 = true,
--                     undeclaredname = true,
--                     fillreturns = true,
--                     nonewvars = true,
--                     fieldalignment = false,
--                     shadow = true,
--                 },
--                 codelenses = {
--                     generate = true,   -- show the `go generate` lens.
--                     gc_details = true, -- Show a code lens toggling the display of gc's choices.
--                     test = true,
--                     tidy = true,
--                     vendor = true,
--                     regenerate_cgo = true,
--                     upgrade_dependency = true,
--                 },
--                 hints = {
--                     assignVariableTypes = true,
--                     compositeLiteralFields = true,
--                     compositeLiteralTypes = true,
--                     constantValues = true,
--                     functionTypeParameters = true,
--                     parameterNames = true,
--                     rangeVariableTypes = true,
--                 },
--                 usePlaceholders = true,
--                 completeUnimported = true,
--                 staticcheck = true,
--                 matcher = 'Fuzzy',
--                 diagnosticsDelay = '500ms',
--                 symbolMatcher = 'fuzzy',
--                 gofumpt = true, -- true|false, -- turn on for new repos, gofmpt is good but also create code turmoils
--                 buildFlags = { '-tags', 'integration' },
--             },
--         },
--         -- NOTE: it is important to add handler to formatting handlers
--         -- the async formatter will call these handlers when gopls responed
--         -- without these handlers, the file will not be saved
--     }
-- -- capabilities = vim.lsp.protocol.make_client_capabilities(),
--
-- )

local cmp = require('cmp')

local source_mapping = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    luasnip = "[LuaSnip]",
    path = "[Path]",
}
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = ({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

cmp.setup({
    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },
    mapping = cmp_mappings,
    -- formatting = {
    --     format = function(entry, item)
    --         local menu_name = source_mapping[entry.source.name] or entry.source.name
    --         item.menu = string.format('%s', menu_name)
    --         return item
    --     end,
    -- },
})

-- require('lint').linters_by_ft = {
--     yaml = { 'actionlint', },
-- }

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--     pattern = "*.go",
--     callback = function()
--         vim.lsp.buf.format({ async = true })
--     end,
-- })
