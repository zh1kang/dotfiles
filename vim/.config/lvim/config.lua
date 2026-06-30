-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--

-- default vim settings
vim.opt.relativenumber = true -- relative line numbers
-- default settings
lvim.log.level = "warn"
lvim.format_on_save = true

-- keybindings
-- lvim.leader = "space"
-- lvim.keys.normal_mode["gk"] = "<Cmd>lua vim.lsp.buf.hover()<CR>"
-- lvim.lsp.buffer_mappings.normal_mode['K'] = lvim.lsp.buffer_mappings.normal_mode['3k']
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
-- colors
-- additional plugins
lvim.plugins = {
  {
    "sphamba/smear-cursor.nvim",
    opts = {},
  },
  {
    "nosduco/remote-sshfs.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {
      -- Refer to the configuration section below
      -- or leave empty for defaults
    },
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make", -- This is Optional, only if you want to use tiktoken_core to calculate tokens count
    opts = {
      -- add any opts here
      provider="copilot",
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below is optional, make sure to setup it properly if you have lazy=true
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
  -- any other extensions loading
end
