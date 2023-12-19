vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>E", vim.cmd.Vexplore)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- Resizing panes
vim.keymap.set("n", "<Left>", ":vertical resize +1<CR>")
vim.keymap.set("n", "<Right>", ":vertical resize -1<CR>")
vim.keymap.set("n", "<Up>", ":resize -1<CR>")
vim.keymap.set("n", "<Down>", ":resize +1<CR>")

-- Move selected line / block of text in visual mode
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv")
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv")

-- next greatest remap ever : asbjornHaland
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

