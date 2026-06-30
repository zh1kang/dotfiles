local cfg = {
  debug = false,
  log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log",
  verbose = false,

  bind = true,
  doc_lines = 10,

  max_height = 12,
  max_width = 80,
  noice = false,
  wrap = true,
  
  floating_window = true,
  floating_window_above_cur_line = true,
  floating_window_off_x = 1,
  floating_window_off_y = 0,

  close_timeout = 4000,
  fix_pos = false,
  hint_enable = true,
  hint_prefix = "🐼 ",
  hint_scheme = "String",
  hint_inline = function() return false end,
  hi_parameter = "LspSignatureActiveParameter",
  handler_opts = {
    border = "rounded"
  },

  always_trigger = false,

  auto_close_after = nil,
  extra_trigger_chars = {},
  zindex = 200,

  padding = '',

  transparency = nil,
  shadow_blend = 36,
  shadow_guibg = 'Black',
  timer_interval = 200,
  toggle_key = nil,
  toggle_key_flip_floatwin_setting = false,

  select_signature_key = nil,
  move_cursor_key = nil,
  floating_window_off_x = 5,
  floating_window_off_y = function()
    local linenr = vim.api.nvim_win_get_cursor(0)[1]
    local pumheight = vim.o.pumheight
    local winline = vim.fn.winline()
    local winheight = vim.fn.winheight(0)

    if winline - 1 < pumheight then
      return pumheight
    end

    if winheight - winline < pumheight then
      return -pumheight
    end
    return 0
  end,
}
require "lsp_signature".setup(cfg)
