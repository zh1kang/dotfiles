vim.o.termguicolors = true
vim.o.background = "dark"

require("gruvbox").setup({
  terminal_colors = true,
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = false,
    comments = true,
    operators = false,
    folds = true,
  },
  contrast = "hard",
  transparent_mode = true,
})

vim.cmd.colorscheme("gruvbox")

local transparent_groups = {
  "Normal",
  "NormalNC",
  "NormalFloat",
  "FloatBorder",
  "SignColumn",
  "EndOfBuffer",
  "TelescopeNormal",
  "TelescopeBorder",
  "NeoTreeNormal",
  "NeoTreeNormalNC",
}

for _, group in ipairs(transparent_groups) do
  vim.api.nvim_set_hl(0, group, { bg = "NONE" })
end
