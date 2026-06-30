local palette = {
    night = "#171717",
    ash = "#1D1D1D",
    mist = "#7B7B7B",
    snow = "#BDBDBD",
    ether = "#3619CC",

    ether_soft = "#6D5BFF",
    blue = "#8FB4FF",
    green = "#7CCF9E",
    gold = "#F2C078",
    rose = "#E89EB3",
    lavender = "#B49CFF",
    red = "#FF6B7A",
}

function ApplyCalebTheme()
    vim.o.termguicolors = true

    local highlights = {
        Normal = { fg = palette.snow, bg = palette.night },
        NormalNC = { fg = palette.snow, bg = palette.night },
        NormalFloat = { fg = palette.snow, bg = palette.ash },
        FloatBorder = { fg = palette.ether_soft, bg = palette.ash },
        SignColumn = { fg = palette.mist, bg = palette.night },
        EndOfBuffer = { fg = palette.night, bg = palette.night },
        ColorColumn = { bg = palette.ash },
        CursorLine = { bg = palette.ash },
        CursorLineNr = { fg = palette.snow, bg = palette.ash, bold = true },
        LineNr = { fg = palette.mist, bg = palette.night },
        WinSeparator = { fg = "#2B2B2B", bg = palette.night },
        VertSplit = { fg = "#2B2B2B", bg = palette.night },
        Visual = { bg = "#2F2860" },
        Search = { fg = palette.night, bg = palette.gold },
        IncSearch = { fg = palette.night, bg = palette.lavender },
        MatchParen = { fg = palette.snow, bg = palette.ether, bold = true },

        StatusLine = { fg = palette.snow, bg = palette.ash },
        StatusLineNC = { fg = palette.mist, bg = palette.ash },
        Pmenu = { fg = palette.snow, bg = palette.ash },
        PmenuSel = { fg = palette.snow, bg = palette.ether },
        PmenuSbar = { bg = "#292929" },
        PmenuThumb = { bg = palette.mist },

        Comment = { fg = palette.mist, italic = true },
        Constant = { fg = palette.rose },
        String = { fg = palette.green },
        Character = { fg = palette.green },
        Number = { fg = palette.rose },
        Boolean = { fg = palette.rose },
        Float = { fg = palette.rose },
        Identifier = { fg = palette.snow },
        Function = { fg = palette.blue },
        Statement = { fg = palette.lavender },
        Conditional = { fg = palette.lavender },
        Repeat = { fg = palette.lavender },
        Label = { fg = palette.lavender },
        Operator = { fg = palette.snow },
        Keyword = { fg = palette.lavender },
        Exception = { fg = palette.red },
        PreProc = { fg = palette.lavender },
        Include = { fg = palette.lavender },
        Define = { fg = palette.lavender },
        Macro = { fg = palette.lavender },
        Type = { fg = palette.gold },
        StorageClass = { fg = palette.gold },
        Structure = { fg = palette.gold },
        Typedef = { fg = palette.gold },
        Special = { fg = palette.ether_soft },
        SpecialChar = { fg = palette.ether_soft },
        Delimiter = { fg = palette.mist },

        DiagnosticError = { fg = palette.red },
        DiagnosticWarn = { fg = palette.gold },
        DiagnosticInfo = { fg = palette.blue },
        DiagnosticHint = { fg = palette.green },
        DiagnosticOk = { fg = palette.green },

        DiffAdd = { fg = palette.green, bg = "#1D2A22" },
        DiffChange = { fg = palette.gold, bg = "#292516" },
        DiffDelete = { fg = palette.red, bg = "#2B1B1E" },
        DiffText = { fg = palette.snow, bg = "#3B3420" },

        TelescopeNormal = { fg = palette.snow, bg = palette.night },
        TelescopeBorder = { fg = "#2B2B2B", bg = palette.night },
        TelescopeSelection = { fg = palette.snow, bg = palette.ash },
        TelescopeMatching = { fg = palette.gold, bold = true },
        NeoTreeNormal = { fg = palette.snow, bg = palette.night },
        NeoTreeNormalNC = { fg = palette.snow, bg = palette.night },
        NeoTreeDirectoryName = { fg = palette.blue },
        NeoTreeDirectoryIcon = { fg = palette.blue },
        NeoTreeGitModified = { fg = palette.gold },
        NeoTreeGitAdded = { fg = palette.green },
        NeoTreeGitDeleted = { fg = palette.red },

        CmpItemAbbr = { fg = palette.snow },
        CmpItemAbbrMatch = { fg = palette.gold, bold = true },
        CmpItemKind = { fg = palette.lavender },
        LspSignatureActiveParameter = { fg = palette.night, bg = palette.gold, bold = true },
        HighlightedyankRegion = { bg = "#2F2860" },
    }

    local treesitter = {
        ["@comment"] = highlights.Comment,
        ["@constant"] = highlights.Constant,
        ["@string"] = highlights.String,
        ["@number"] = highlights.Number,
        ["@boolean"] = highlights.Boolean,
        ["@function"] = highlights.Function,
        ["@function.call"] = highlights.Function,
        ["@method"] = highlights.Function,
        ["@method.call"] = highlights.Function,
        ["@keyword"] = highlights.Keyword,
        ["@keyword.function"] = highlights.Keyword,
        ["@keyword.return"] = highlights.Keyword,
        ["@type"] = highlights.Type,
        ["@type.builtin"] = highlights.Type,
        ["@variable"] = highlights.Identifier,
        ["@variable.builtin"] = { fg = palette.rose },
        ["@property"] = { fg = palette.snow },
        ["@punctuation.delimiter"] = highlights.Delimiter,
        ["@punctuation.bracket"] = { fg = palette.mist },
        ["@operator"] = highlights.Operator,
    }

    for group, opts in pairs(vim.tbl_extend("force", highlights, treesitter)) do
        vim.api.nvim_set_hl(0, group, opts)
    end
end

function ColorMyPencils(color)
    color = color or "kanagawa"
    vim.cmd.colorscheme(color)
    ApplyCalebTheme()
end

ColorMyPencils()

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = ApplyCalebTheme,
})
