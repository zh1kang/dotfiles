require("nvim-autopairs").setup({})

local ok_cmp_autopairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
local ok_cmp, cmp = pcall(require, "cmp")
if ok_cmp_autopairs and ok_cmp then
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

local ok_which_key, which_key = pcall(require, "which-key")
if ok_which_key then
  which_key.add({
    { "<leader>c", group = "code" },
    { "<leader>d", group = "document" },
    { "<leader>f", group = "find" },
    { "<leader>g", group = "git" },
    { "<leader>h", group = "hunk" },
    { "<leader>o", group = "omp" },
    { "<leader>s", group = "search" },
    { "<leader>t", group = "toggle" },
    { "<leader>w", group = "workspace" },
  })
end

require("neo-tree").setup({
  window = {
    position = "right",
  },
  filesystem = {
    filtered_items = {
      visible = true,
    },
    window = {
      mappings = {
        ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
        ["<C-b>"] = { "scroll_preview", config = { direction = 10 } },
        ["<C-f>"] = { "scroll_preview", config = { direction = -10 } },
      },
    },
  },
})

vim.keymap.set("n", "<C-f>", "<cmd>Neotree focus<CR>", { silent = true, desc = "Focus Neo-tree" })
vim.keymap.set("n", "<C-n>", "<cmd>Neotree reveal<CR>", { silent = true, desc = "Reveal in Neo-tree" })
vim.keymap.set("n", "<C-t>", "<cmd>Neotree toggle<CR>", { silent = true, desc = "Toggle Neo-tree" })

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })

local ok_gitsigns, gitsigns = pcall(require, "gitsigns")
if ok_gitsigns then
  vim.keymap.set("n", "[c", gitsigns.prev_hunk, { desc = "Previous git hunk" })
  vim.keymap.set("n", "]c", gitsigns.next_hunk, { desc = "Next git hunk" })
  vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview git hunk" })
  vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset git hunk" })
  vim.keymap.set("n", "<leader>hb", gitsigns.blame_line, { desc = "Blame line" })
end
