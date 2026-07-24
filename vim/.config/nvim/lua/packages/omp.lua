local ok, terminal = pcall(require, "toggleterm.terminal")
if not ok then
  return
end

local omp_cmd = vim.fn.executable("/Users/caleb/.bun/bin/omp") == 1 and "/Users/caleb/.bun/bin/omp" or "omp"

local omp = terminal.Terminal:new({
  cmd = omp_cmd .. " --allow-home",
  direction = "float",
  display_name = "omp",
  hidden = true,
  close_on_exit = false,
  float_opts = {
    border = "single",
    title_pos = "center",
    width = function()
      return math.floor(vim.o.columns * 0.86)
    end,
    height = function()
      return math.floor(vim.o.lines * 0.82)
    end,
  },
  on_open = function()
    vim.cmd("startinsert")
  end,
})

vim.api.nvim_create_user_command("OmpToggle", function()
  omp:toggle()
end, {})

vim.keymap.set("n", "<leader>ox", "<cmd>OmpToggle<CR>", { silent = true, desc = "Toggle OMP" })
