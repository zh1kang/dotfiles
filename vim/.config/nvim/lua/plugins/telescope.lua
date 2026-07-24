local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown(),
    },
  },
})

pcall(telescope.load_extension, "fzf")
pcall(telescope.load_extension, "ui-select")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
vim.keymap.set("n", "<leader>fd", builtin.git_files, { desc = "Git files" })
vim.keymap.set("n", "<leader>fs", function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Grep prompt" })

vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "Telescope pickers" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search keymaps" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search diagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Resume search" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "Recent files" })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Existing buffers" })
vim.keymap.set("n", "<leader>/", function()
  builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = "Search current buffer" })
