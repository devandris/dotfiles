local jsonls_dir = vim.fn.stdpath('data') .. '/mason/packages/eslint-lsp/node_modules/vscode-langservers-extracted/bin'


require("lspconfig").jsonls.setup({
  capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  cmd = { jsonls_dir .. '/vscode-json-language-server', '--stdio' },
})
