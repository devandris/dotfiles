local P = {}
keymaps = P

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local key_map = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    { noremap = true, silent = true }
  )
end

-- Center search results
key_map('n', 'n', 'nzz')
key_map("n", "N", "Nzz")

-- Resizing panes
key_map("n", "<Left>", ":vertical resize +1<CR>")
key_map("n", "<Right>", ":vertical resize -1<CR>")
key_map("n", "<Up>", ":resize -1<CR>")
key_map("n", "<Down>", ":resize +1<CR>")

-- Move selected line / block of text in visual mode
key_map("x", "K", ":move '<-2<CR>gv-gv")
key_map("x", "J", ":move '>+1<CR>gv-gv")


-- key_map("i", "(<CR>", "()<Left><CR><ESC>O")
-- key_map("i", "[<CR>", "[]<Left><CR><ESC>O")
-- key_map("i", "{<CR>", "{}<Left><CR><ESC>O")

key_map("n", "<leader>e", ":Explore<CR>")
key_map("n", "<leader>E", ":Vexplore<CR>")
-- Telescope

function P.map_lsp_keys()
  key_map("n", "<leader>vd", ":lua vim.diagnostic.open_float()<CR>")
  key_map("n", "<leader>gd", ":lua vim.lsp.buf.definition()<CR>")
  key_map("n", "<leader>gr", ":lua vim.lsp.buf.references()<CR>")
  key_map("n", "<leader>gt", ":lua vim.lsp.buf.type_definition()<CR>")
  key_map("n", "<leader>gi", ":lua vim.lsp.buf.implementation()<CR>")
  key_map('n', 'K', ":lua vim.lsp.buf.hover()<CR>")
  key_map('n', '<C-h>', ":lua vim.lsp.buf.signature_help()<CR>")
  key_map("n", "<leader>ws", ":lua vim.lsp.buf.workspace_symbol()<CR>")
  key_map('n', '<leader>wa', ":lua vim.lsp.buf.add_workspace_folder()<CR>")
  key_map('n', '<leader>wr', ":lua vim.lsp.buf.remove_workspace_folder()<CR>")
  key_map('n', '<leader>wl', ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
  key_map('n', '<leader>rn', ":lua vim.lsp.buf.rename()<CR>")
  key_map('n', '<leader>ac', ":lua vim.lsp.buf.code_action()<CR>")
  key_map('n', '<leader>fs', ":lua vim.lsp.buf.format({async=true})<CR>")
  key_map('n', '<leader>]', ":lua vim.diagnostic.goto_next({ float = true })<CR>")
  key_map('n', '<leader>[', ":lua vim.diagnostic.goto_prev()<CR>")
end

function P.map_java_lsp_keys()
  P.map_lsp_keys()
end

return P
