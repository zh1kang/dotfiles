vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "88"
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.guifont = "PP Neue Montreal:h14"
vim.opt.pyxversion = 3
vim.g.python3_host_prog = vim.fn.expand("~/.local/share/nvim/python3-venv/bin/python")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true, desc = "Clear search highlight" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus left" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus down" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus up" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus right" })
vim.keymap.set({ "n", "v" }, "J", "3j", { silent = true, desc = "Move down three lines" })
vim.keymap.set({ "n", "v" }, "K", "3k", { silent = true, desc = "Move up three lines" })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic message" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics quickfix list" })
vim.keymap.set("v", "<", "<gv", { silent = true, desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { silent = true, desc = "Indent right and reselect" })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local result = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { result, "WarningMsg" },
    }, true, {})
    vim.cmd("cquit 1")
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
  { "tpope/vim-sleuth" },
  { "numToStr/Comment.nvim", opts = {} },
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = {},
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      numhl = true,
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },
  { "tpope/vim-fugitive" },
  { "nvim-treesitter/nvim-treesitter", branch = "master", build = ":TSUpdate" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/nvim-cmp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "ray-x/lsp_signature.nvim" },
  { "nvim-neotest/nvim-nio" },
  { "folke/trouble.nvim" },
  { "windwp/nvim-autopairs" },
  { "mbbill/undotree" },
  { "machakann/vim-highlightedyank" },
  { "stevearc/conform.nvim" },
  { "ray-x/guihua.lua" },
  { "ray-x/go.nvim", tag = "v0.11" },
  { "NoahTheDuke/vim-just" },
  { "vuki656/package-info.nvim" },
  { "mrjones2014/smart-splits.nvim" },
  { "christoomey/vim-tmux-navigator" },
  { "akinsho/toggleterm.nvim" },
  { "dmmulroy/ts-error-translator.nvim" },
  { "johnseth97/codex.nvim" },
  { "github/copilot.vim" },
  {
    "folke/snacks.nvim",
    priority = 1000,
    opts = {
      notifier = { enabled = true, top_down = false },
      picker = {
        sources = {
          explorer = {
            layout = {
              layout = {
                position = "right",
              },
            },
          },
        },
      },
    },
  },
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.ai").setup({ n_lines = 500 })
      require("mini.surround").setup()
      local statusline = require("mini.statusline")
      statusline.setup({ use_icons = vim.g.have_nerd_font })
      statusline.section_location = function()
        return "%2l:%-2v"
      end
    end,
  },
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = {
        "          _                 ",
        "  ___ ___| | ___  ___  ___ ",
        " / __/ __| |/ _ \\/ __|/ _ \\",
        "| (_| (__| |  __/\\__ \\  __/",
        " \\___\\___|_|\\___||___/\\___|",
      }
      dashboard.section.buttons.val = {
        dashboard.button("f", "Find file", "<cmd>Telescope find_files<CR>"),
        dashboard.button("g", "Live grep", "<cmd>Telescope live_grep<CR>"),
        dashboard.button("r", "Recent files", "<cmd>Telescope oldfiles<CR>"),
        dashboard.button("q", "Quit", "<cmd>qa<CR>"),
      }
      alpha.setup(dashboard.opts)
    end,
  },
  {
    "3rd/image.nvim",
    opts = {
      backend = "kitty",
      integrations = {
        markdown = { enabled = true },
      },
    },
  },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})

require("plugins.gruvbox")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.mason")
require("plugins.editor")
require("plugins.latex")
require("packages.signature")
require("packages.secondone")
require("packages.codex")
require("packages.omp")
