local function safe_require(name)
  local ok, module = pcall(require, name)
  if ok then
    return module
  end
  return nil
end

local conform = safe_require("conform")
if conform then
  local formatter_cache = {}

  local function select_js_ts_formatter(bufnr)
    local root = vim.fs.root(bufnr, { ".git", "package.json" })
    if not root then
      return { "prettierd", "prettier", stop_after_first = true }
    end

    if formatter_cache[root] then
      return formatter_cache[root]
    end

    local has_oxc = vim.fs.find({ "oxlintrc.json", ".oxlintrc.json", "oxc.json" }, {
      path = root,
      upward = false,
    })[1]

    local formatters = has_oxc and { "oxfmt" } or { "prettierd", "prettier", stop_after_first = true }
    formatter_cache[root] = formatters
    return formatters
  end

  conform.setup({
    formatters_by_ft = {
      javascript = select_js_ts_formatter,
      javascriptreact = select_js_ts_formatter,
      typescript = select_js_ts_formatter,
      typescriptreact = select_js_ts_formatter,
      json = { "jq" },
      ejson = { "jq" },
      markdown = { "prettierd", "prettier", stop_after_first = true },
      templ = { "templ" },
      rust = { "rustfmt" },
      proto = { "buf" },
      cmake = { "cmake_format" },
      c = { "clang_format" },
      cpp = { "clang_format" },
      lua = { "stylua" },
      java = { "google-java-format" },
      ocaml = { "ocamlformat" },
      python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
      ["*"] = { "trim_whitespace", "codespell" },
    },
  })

  vim.keymap.set("n", "<leader>fm", function()
    conform.format({ async = true })
  end, { silent = true, desc = "Format buffer" })
end

local neo_tree = safe_require("neo-tree")
if neo_tree then
  neo_tree.setup({
    window = {
      position = "right",
    },
  })
end

local snacks = safe_require("snacks")
if snacks then
  snacks.setup({
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
  })
end

local trouble = safe_require("trouble")
if trouble then
  trouble.setup({
    modes = {
      symbols = {
        win = { position = "bottom" },
      },
    },
  })
end

local toggleterm = safe_require("toggleterm")
if toggleterm then
  toggleterm.setup({})
end

local package_info = safe_require("package-info")
if package_info then
  package_info.setup()
end

local ts_error_translator = safe_require("ts-error-translator")
if ts_error_translator then
  ts_error_translator.setup()
end

local go = safe_require("go")
if go then
  go.setup({
    goimports = "gopls",
    gofmt = "gopls",
    max_line_len = 120,
  })

  local group = vim.api.nvim_create_augroup("GoFormat", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    group = group,
    callback = function()
      local go_format = safe_require("go.format")
      if go_format then
        go_format.goimports()
      end
    end,
  })
end

local smart_splits = safe_require("smart-splits")
if smart_splits then
  smart_splits.setup({
    multiplexer_integration = false,
  })

  vim.keymap.set("n", "<A-h>", smart_splits.resize_left)
  vim.keymap.set("n", "<A-j>", smart_splits.resize_down)
  vim.keymap.set("n", "<A-k>", smart_splits.resize_up)
  vim.keymap.set("n", "<A-l>", smart_splits.resize_right)
end
