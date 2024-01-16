local telescope = require("telescope")
local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!.git/*")


telescope.setup({
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      height = 0.9,
      preview_cutoff = 40,
      prompt_position = "bottom",
      width = 0.8
    },
    vimgrep_arguments = vimgrep_arguments,
    mappings = {
      i = {
        ["<C-j>"] = require('telescope.actions').cycle_history_next,
        ["<C-k>"] = require('telescope.actions').cycle_history_prev,
      },
    },
  },
  pickers = {
    find_files = {
      -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
      find_command = { "fdfind", "--hidden", "--no-ignore-vcs" },
    },
  },
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>rg', builtin.live_grep, {})

vim.keymap.set("n", "<leader>fa", builtin.find_files, {})
vim.keymap.set("n", "<leader>ff", builtin.git_files, {})
vim.keymap.set("n", "<leader>rg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>vc", builtin.git_bcommits, {})
vim.keymap.set("n", "<leader>vC", builtin.git_commits, {})
vim.keymap.set("n", "<leader>vs", builtin.git_stash, {})
vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
vim.keymap.set("n", "<leader>vd", builtin.diagnostics, {})
vim.keymap.set("n", "<leader>gr", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, {})
vim.keymap.set("n", "<leader>gt", builtin.lsp_type_definitions, {})
vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, {})
