local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- require("luasnip.loaders.from_vscode").lazy_load()

vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })

ls.add_snippets("go", {
    s("ier", {
        -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
        t("if err != nil {"),
        t({ "", "\treturn " }), i(1, "nil"), t(", "), i(2, "err"),
        i(0),
        t({ "", "}" }),
    }),
})
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")
