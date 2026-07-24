local image_ok, image_api = pcall(require, "image")

local rendered_images = {}

local function count(list)
  return #list
end

local function executable_or_error(name)
  if vim.fn.executable(name) == 1 then
    return true
  end
  vim.notify("Missing executable required for LaTeX rendering: " .. name, vim.log.levels.ERROR)
  return false
end

local function clear_images()
  for _, image in ipairs(rendered_images) do
    pcall(function()
      image:clear()
    end)
  end
  rendered_images = {}
end

local function find_equation_markers()
  local positions = {}
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  for line_number, line in ipairs(lines) do
    local start = 1
    while true do
      local first, last = line:find("$$", start, true)
      if not first then
        break
      end
      table.insert(positions, { line_number, first })
      start = last + 1
    end
  end

  if count(positions) % 2 ~= 0 then
    vim.notify("Unmatched $$ delimiter", vim.log.levels.ERROR)
    return nil
  end

  return positions
end

local function cursor_inside_pair(cursor, open_marker, close_marker)
  if open_marker[1] == close_marker[1] then
    return cursor[1] == open_marker[1] and open_marker[2] < cursor[2] and cursor[2] < close_marker[2]
  end

  if cursor[1] == open_marker[1] then
    return open_marker[2] < cursor[2]
  end

  if cursor[1] == close_marker[1] then
    return cursor[2] < close_marker[2]
  end

  return open_marker[1] < cursor[1] and cursor[1] < close_marker[1]
end

local function marker_pairs(markers)
  local pairs = {}
  for index = 1, #markers, 2 do
    table.insert(pairs, { markers[index], markers[index + 1] })
  end
  return pairs
end

local function pair_at_cursor(markers)
  local position = vim.fn.getpos(".")
  local cursor = { position[2], position[3] }

  for _, pair in ipairs(marker_pairs(markers)) do
    if cursor_inside_pair(cursor, pair[1], pair[2]) then
      return { pair }
    end
  end

  vim.notify("Cursor is not inside a $$...$$ equation", vim.log.levels.WARN)
  return nil
end

local function equation_text(pair)
  local open_marker = pair[1]
  local close_marker = pair[2]
  local chunks = vim.api.nvim_buf_get_text(
    0,
    open_marker[1] - 1,
    open_marker[2] + 1,
    close_marker[1] - 1,
    close_marker[2] - 1,
    {}
  )
  return table.concat(chunks, "\n")
end

local function write_tex_file(directory, name, body)
  local path = directory .. "/" .. name .. ".tex"
  local file, error_message = io.open(path, "w")
  if not file then
    error("Unable to write " .. path .. ": " .. error_message)
  end

  file:write("\\documentclass[12pt]{standalone}\n")
  file:write("\\usepackage{amsmath,amssymb}\n")
  file:write("\\begin{document}\n")
  file:write("\\begin{align*}\n")
  file:write(body)
  file:write("\n\\end{align*}\n")
  file:write("\\end{document}\n")
  file:close()

  return path
end

local function run_command(command, cwd)
  local output = vim.fn.system(command, nil, nil)
  if vim.v.shell_error ~= 0 then
    error(table.concat(command, " ") .. " failed in " .. cwd .. ":\n" .. output)
  end
end

local function render_pairs(pairs, size)
  if not image_ok then
    vim.notify("image.nvim is not available", vim.log.levels.ERROR)
    return
  end

  if not executable_or_error("latex") or not executable_or_error("dvipng") then
    return
  end

  clear_images()

  local directory = vim.fn.tempname()
  vim.fn.mkdir(directory, "p")
  local dpi = tonumber(size) or 300

  for index, pair in ipairs(pairs) do
    local name = "equation-" .. index
    write_tex_file(directory, name, equation_text(pair))
    run_command({ "latex", "--interaction=nonstopmode", "--output-directory", directory, directory .. "/" .. name .. ".tex" }, directory)
    run_command({
      "dvipng",
      "-D",
      tostring(dpi),
      "-T",
      "tight",
      "-bg",
      "Transparent",
      "-fg",
      "rgb 0.92 0.86 0.70",
      "-o",
      directory .. "/" .. name .. ".png",
      directory .. "/" .. name .. ".dvi",
    }, directory)

    local image = image_api.from_file(directory .. "/" .. name .. ".png", {
      id = "latex-equation-" .. index,
      window = vim.api.nvim_get_current_win(),
      buffer = vim.api.nvim_get_current_buf(),
      with_virtual_padding = true,
      x = 0,
      y = pair[2][1],
      height = 100,
    })
    table.insert(rendered_images, image)
    image:render()
  end
end

vim.api.nvim_create_user_command("RenderLatex", function(opts)
  local markers = find_equation_markers()
  if markers then
    render_pairs(marker_pairs(markers), opts.args)
  end
end, {
  nargs = "?",
  complete = function()
    return { "200", "300" }
  end,
})

vim.api.nvim_create_user_command("RenderLatexAtCursor", function(opts)
  local markers = find_equation_markers()
  if not markers then
    return
  end

  local pair = pair_at_cursor(markers)
  if pair then
    render_pairs(pair, opts.args)
  end
end, {
  nargs = "?",
  complete = function()
    return { "200", "300" }
  end,
})

vim.api.nvim_create_user_command("RemoveLatex", clear_images, {})

vim.keymap.set("n", "<leader>r", "<cmd>RenderLatexAtCursor 300<CR>", { silent = true, desc = "Render LaTeX at cursor" })
vim.keymap.set("n", "<leader>R", "<cmd>RenderLatex 300<CR>", { silent = true, desc = "Render all LaTeX equations" })
