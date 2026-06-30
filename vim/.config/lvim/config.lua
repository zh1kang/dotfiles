vim.opt.relativenumber = true
lvim.log.level = "warn"
lvim.format_on_save = true

lvim.lsp.buffer_mappings.normal_mode['K'] = nil
lvim.keys.normal_mode['K'] = "<Cmd>echo Okay!<CR>"

lvim.lsp.buffer_mappings.normal_mode['gk'] = { vim.lsp.buf.hover, "Show documentation" }

lvim.keys.normal_mode["K"] = false
lvim.keys.normal_mode["K"] = "3k"
lvim.keys.visual_mode["K"] = "3k"
lvim.keys.normal_mode["J"] = "3j"
lvim.keys.visual_mode["J"] = "3j"
lvim.keys.normal_mode["|"] = ":vsplit<CR>"
lvim.keys.normal_mode["-"] = ":split<CR>"

lvim.plugins = {
  {
    "sphamba/smear-cursor.nvim",
    opts = {},
  },
  {
    "nosduco/remote-sshfs.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {},
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make",
    opts = {
      provider="copilot",
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  }
}

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "remote-sshfs")
end
