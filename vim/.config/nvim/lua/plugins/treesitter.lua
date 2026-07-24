require("nvim-treesitter.install").prefer_git = true

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "diff",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "python",
    "query",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = function(_, buf)
      local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
      return ok and stats and stats.size > 100 * 1024
    end,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
})
