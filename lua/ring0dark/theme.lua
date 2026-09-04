local c = require("ring0dark.palette")
local hl = vim.api.nvim_set_hl

local M = {}

local function set(group, spec)
  hl(0, group, spec)
end

local function link(group, target)
  hl(0, group, { link = target })
end

local function link_many(groups, target)
  for _, group in ipairs(groups) do
    link(group, target)
  end
end

function M.set_highlights()
  ---------------------------------------------------------------------------
  -- Core editor UI
  ---------------------------------------------------------------------------
  set("Normal", { fg = c.fg, bg = c.bg })
  link("NormalNC", "Normal")
  set("NormalFloat", { fg = c.fg, bg = c.bg_darker })
  set("NormalSB", { fg = c.fg, bg = c.bg_darker })
  set("FloatBorder", { fg = c.bg4, bg = c.bg_darker })
  set("FloatShadow", { bg = c.black, blend = 60 })
  set("FloatShadowThrough", { bg = c.black, blend = 75 })
  link("FloatTitle", "Title")
  link("FloatFooter", "Comment")

  set("WinSeparator", { fg = c.bg4, bg = c.bg })
  link("VertSplit", "WinSeparator")

  set("EndOfBuffer", { fg = c.bg4, bg = c.bg })
  set("NonText", { fg = c.bg4 })
  set("Whitespace", { fg = c.bg1 })
  set("SpecialKey", { fg = c.bg4 })
  set("Conceal", { fg = c.quartz })

  set("LineNr", { fg = c.bg4, bg = c.bg })
  link("LineNrAbove", "LineNr")
  link("LineNrBelow", "LineNr")
  set("CursorLineNr", { fg = c.yellow, bold = true })
  set("CursorLine", { bg = c.bg1 })
  set("CursorColumn", { bg = c.bg1 })
  set("ColorColumn", { bg = c.bg1 })
  set("SignColumn", { bg = c.bg })
  link("CursorLineSign", "SignColumn")
  set("FoldColumn", { fg = c.quartz, bg = c.bg })
  link("CursorLineFold", "FoldColumn")
  set("Folded", { fg = c.quartz, bg = c.bg_darker })

  set("Directory", { fg = c.niagara, bold = true })
  set("Cursor", { fg = c.black, bg = c.yellow })
  link_many({ "lCursor", "CursorIM", "TermCursor" }, "Cursor")
  set("TermCursorNC", { fg = c.bg4, bg = c.quartz })

  set("Visual", { bg = c.bg3 })
  link("VisualNOS", "Visual")

  -- Search colors follow Gruber Darker's white/niagara contrast instead of
  -- Neovim's defaults, which prevents unexpected blue/purple fallbacks.
  set("Search", { fg = c.fg_bright, bg = c.niagara_dark })
  set("CurSearch", { fg = c.black, bg = c.fg_bright, bold = true })
  link("IncSearch", "CurSearch")
  set("Substitute", { fg = c.black, bg = c.red_bright, bold = true })
  set("MatchParen", { bg = c.bg4, bold = true })

  set("ErrorMsg", { fg = c.white, bg = c.red })
  set("WarningMsg", { fg = c.yellow, bold = true })
  set("ModeMsg", { fg = c.green, bold = true })
  set("MoreMsg", { fg = c.green })
  set("Question", { fg = c.niagara, bold = true })
  link("MsgArea", "Normal")
  set("MsgSeparator", { fg = c.bg4, bg = c.bg1 })

  set("StatusLine", { fg = c.white, bg = c.bg1 })
  set("StatusLineNC", { fg = c.quartz, bg = c.bg1 })
  set("WinBar", { fg = c.fg_bright, bg = c.bg, bold = true })
  set("WinBarNC", { fg = c.quartz, bg = c.bg })

  set("TabLine", { fg = c.quartz, bg = c.bg1 })
  set("TabLineSel", { fg = c.yellow, bg = c.bg, bold = true })
  set("TabLineFill", { fg = c.bg4, bg = c.bg1 })

  ---------------------------------------------------------------------------
  -- Popup/completion UI (including newer Neovim groups)
  ---------------------------------------------------------------------------
  set("Pmenu", { fg = c.fg, bg = c.bg_darker })
  set("PmenuSel", { fg = c.fg_bright, bg = c.bg1, bold = true })
  set("PmenuSbar", { bg = c.bg1 })
  set("PmenuThumb", { bg = c.bg4 })
  link("PmenuBorder", "FloatBorder")
  set("PmenuShadow", { bg = c.black, blend = 60 })
  set("PmenuShadowThrough", { bg = c.black, blend = 75 })

  set("PmenuKind", { fg = c.niagara, bg = c.bg_darker })
  set("PmenuKindSel", { fg = c.niagara, bg = c.bg1, bold = true })
  set("PmenuExtra", { fg = c.quartz, bg = c.bg_darker })
  set("PmenuExtraSel", { fg = c.quartz, bg = c.bg1 })
  set("PmenuMatch", { fg = c.yellow, bold = true })
  set("PmenuMatchSel", { fg = c.yellow, bg = c.bg1, bold = true })

  set("ComplMatchIns", { fg = c.yellow, bold = true })
  set("PreInsert", { fg = c.quartz })
  set("ComplHint", { fg = c.quartz })
  set("ComplHintMore", { fg = c.bg4 })
  link("WildMenu", "PmenuSel")

  set("SnippetTabstop", { bg = c.bg2 })
  set("SnippetTabstopActive", { bg = c.bg4, bold = true })

  set("QuickFixLine", { bg = c.bg1, bold = true })
  set("qfLineNr", { fg = c.yellow })
  set("qfFileName", { fg = c.niagara })

  ---------------------------------------------------------------------------
  -- Diff / version-control primitives
  ---------------------------------------------------------------------------
  set("Added", { fg = c.green })
  set("Changed", { fg = c.yellow })
  set("Removed", { fg = c.red_bright })

  set("DiffAdd", { fg = c.green, bg = c.green_bg })
  set("DiffChange", { fg = c.yellow, bg = c.yellow_bg })
  set("DiffDelete", { fg = c.red_bright, bg = c.red_bg })
  set("DiffText", { fg = c.fg_bright, bg = c.niagara_darker, bold = true })

  link_many({ "diffAdded", "DiffAdded" }, "Added")
  link_many({ "diffChanged", "DiffModified" }, "Changed")
  link_many({ "diffRemoved", "DiffRemoved" }, "Removed")

  ---------------------------------------------------------------------------
  -- Spell / text quality
  ---------------------------------------------------------------------------
  set("SpellBad", { sp = c.red, undercurl = true })
  set("SpellCap", { sp = c.yellow, undercurl = true })
  set("SpellRare", { sp = c.wisteria, undercurl = true })
  set("SpellLocal", { sp = c.niagara, undercurl = true })

  ---------------------------------------------------------------------------
  -- Classic Vim syntax groups. These are important fallback targets because
  -- many plugins intentionally link their own groups to them.
  ---------------------------------------------------------------------------
  set("Comment", { fg = c.brown })

  set("Constant", { fg = c.quartz })
  set("String", { fg = c.green })
  link("Character", "String")
  link_many({ "Number", "Boolean", "Float" }, "Constant")

  set("Identifier", { fg = c.fg_bright })
  set("Function", { fg = c.niagara })

  set("Statement", { fg = c.yellow, bold = true })
  link_many({ "Conditional", "Repeat", "Label", "Keyword", "Exception" }, "Statement")
  set("Operator", { fg = c.fg })

  set("PreProc", { fg = c.quartz })
  link_many({ "Include", "Define", "Macro", "PreCondit" }, "PreProc")

  set("Type", { fg = c.quartz })
  link_many({ "StorageClass", "Structure", "Typedef" }, "Type")

  set("Special", { fg = c.fg, bold = true })
  link("SpecialChar", "String")
  set("Tag", { fg = c.niagara })
  set("Delimiter", { fg = c.fg })
  set("SpecialComment", { fg = c.brown, bold = true })
  set("Debug", { fg = c.red_bright })

  set("Underlined", { fg = c.niagara, underline = true })
  set("Dimmed", { fg = c.quartz })
  set("Ignore", { fg = c.bg4 })
  set("Error", { fg = c.red, bold = true })
  set("Todo", { fg = c.yellow, bold = true })
  set("Title", { fg = c.yellow, bold = true })

  ---------------------------------------------------------------------------
  -- Ring0 semantic groups used as stable plugin/LSP targets
  ---------------------------------------------------------------------------
  set("Ring0Builtin", { fg = c.yellow })
  set("Ring0Member", { fg = c.niagara })
  set("Ring0Property", { fg = c.niagara_dark })
  set("Ring0Attribute", { fg = c.brown })
  set("Ring0Muted", { fg = c.quartz })
  set("Ring0Link", { fg = c.niagara, underline = true })
  set("Ring0VisitedLink", { fg = c.wisteria, underline = true })

  ---------------------------------------------------------------------------
  -- Tree-sitter (modern capture names)
  ---------------------------------------------------------------------------
  link_many({
    "@comment",
    "@comment.documentation",
  }, "Comment")
  link("@comment.error", "DiagnosticError")
  link("@comment.warning", "DiagnosticWarn")
  link("@comment.todo", "Todo")
  link("@comment.note", "DiagnosticInfo")

  link_many({ "@constant", "@number", "@number.float", "@boolean" }, "Constant")
  link_many({ "@constant.builtin", "@constant.macro" }, "Ring0Builtin")

  link_many({ "@string", "@string.documentation", "@string.regexp" }, "String")
  link("@string.escape", "SpecialChar")
  link_many({ "@string.special", "@string.special.symbol", "@character.special" }, "SpecialChar")
  link("@string.special.path", "String")
  link("@string.special.url", "Ring0Link")
  link("@character", "Character")

  link_many({ "@variable", "@variable.parameter", "@variable.parameter.builtin" }, "Identifier")
  link("@variable.builtin", "Ring0Builtin")
  link("@variable.member", "Ring0Member")
  link("@property", "Ring0Property")

  link_many({ "@type", "@type.builtin", "@type.definition", "@module", "@module.builtin" }, "Type")
  link("@attribute", "Ring0Attribute")
  link("@attribute.builtin", "Ring0Builtin")
  link("@label", "Statement")

  link_many({ "@function", "@function.call", "@function.method", "@function.method.call", "@constructor" }, "Function")
  link_many({ "@function.builtin", "@function.macro" }, "Ring0Builtin")

  link("@operator", "Operator")
  link_many({
    "@keyword",
    "@keyword.coroutine",
    "@keyword.function",
    "@keyword.operator",
    "@keyword.import",
    "@keyword.type",
    "@keyword.modifier",
    "@keyword.repeat",
    "@keyword.return",
    "@keyword.debug",
    "@keyword.exception",
    "@keyword.conditional",
    "@keyword.conditional.ternary",
  }, "Statement")
  link_many({ "@keyword.directive", "@keyword.directive.define" }, "PreProc")

  link_many({ "@punctuation.delimiter", "@punctuation.bracket" }, "Delimiter")
  link("@punctuation.special", "Special")

  set("@markup.strong", { fg = c.fg_bright, bold = true })
  set("@markup.italic", { fg = c.fg_bright, italic = true })
  set("@markup.strikethrough", { fg = c.quartz, strikethrough = true })
  set("@markup.underline", { fg = c.fg_bright, underline = true })
  link_many({
    "@markup.heading",
    "@markup.heading.1",
    "@markup.heading.2",
    "@markup.heading.3",
    "@markup.heading.4",
    "@markup.heading.5",
    "@markup.heading.6",
  }, "Title")
  link("@markup.link", "Ring0Link")
  link("@markup.link.label", "Ring0Link")
  link("@markup.link.url", "Ring0VisitedLink")
  link_many({ "@markup.raw", "@markup.raw.block" }, "String")
  link("@markup.quote", "Ring0Muted")
  link("@markup.math", "Special")
  link_many({ "@markup.environment", "@markup.environment.name" }, "Type")
  link_many({ "@markup.list", "@markup.list.checked", "@markup.list.unchecked" }, "Statement")

  link("@diff.plus", "Added")
  link("@diff.minus", "Removed")
  link("@diff.delta", "Changed")

  link_many({ "@tag", "@tag.builtin" }, "Function")
  link("@tag.attribute", "Ring0Attribute")
  link("@tag.delimiter", "Delimiter")

  ---------------------------------------------------------------------------
  -- Diagnostics. Define the whole family so plugins do not inherit Neovim's
  -- stock palette when they reference Diagnostic* variants directly.
  ---------------------------------------------------------------------------
  set("DiagnosticError", { fg = c.red, bold = true })
  set("DiagnosticWarn", { fg = c.yellow, bold = true })
  set("DiagnosticInfo", { fg = c.green })
  set("DiagnosticHint", { fg = c.wisteria })
  set("DiagnosticOk", { fg = c.green, bold = true })

  for _, severity in ipairs({ "Error", "Warn", "Info", "Hint", "Ok" }) do
    link("DiagnosticSign" .. severity, "Diagnostic" .. severity)
    link("DiagnosticVirtualText" .. severity, "Diagnostic" .. severity)
    link("DiagnosticFloating" .. severity, "Diagnostic" .. severity)
  end

  set("DiagnosticUnderlineError", { sp = c.red, undercurl = true })
  set("DiagnosticUnderlineWarn", { sp = c.yellow, undercurl = true })
  set("DiagnosticUnderlineInfo", { sp = c.green, undercurl = true })
  set("DiagnosticUnderlineHint", { sp = c.wisteria, undercurl = true })
  set("DiagnosticUnderlineOk", { sp = c.green, undercurl = true })
  set("DiagnosticDeprecated", { fg = c.quartz, strikethrough = true })
  set("DiagnosticUnnecessary", { fg = c.bg4 })

  ---------------------------------------------------------------------------
  -- LSP references / inlay hints / semantic tokens
  ---------------------------------------------------------------------------
  set("LspReferenceText", { bg = c.bg2 })
  set("LspReferenceRead", { bg = c.bg2 })
  set("LspReferenceWrite", { bg = c.bg2, bold = true })
  set("LspCodeLens", { fg = c.quartz })
  set("LspCodeLensSeparator", { fg = c.bg4 })
  set("LspSignatureActiveParameter", { fg = c.yellow, bold = true })
  set("LspInlayHint", { fg = c.quartz, bg = c.bg_darker })

  local lsp_links = {
    ["@lsp.type.class"] = "Type",
    ["@lsp.type.comment"] = "Comment",
    ["@lsp.type.decorator"] = "Ring0Attribute",
    ["@lsp.type.enum"] = "Type",
    ["@lsp.type.enumMember"] = "Constant",
    ["@lsp.type.event"] = "Special",
    ["@lsp.type.function"] = "Function",
    ["@lsp.type.interface"] = "Type",
    ["@lsp.type.keyword"] = "Statement",
    ["@lsp.type.macro"] = "PreProc",
    ["@lsp.type.method"] = "Function",
    ["@lsp.type.modifier"] = "Statement",
    ["@lsp.type.namespace"] = "Type",
    ["@lsp.type.number"] = "Constant",
    ["@lsp.type.operator"] = "Operator",
    ["@lsp.type.parameter"] = "Identifier",
    ["@lsp.type.property"] = "Ring0Property",
    ["@lsp.type.regexp"] = "String",
    ["@lsp.type.string"] = "String",
    ["@lsp.type.struct"] = "Type",
    ["@lsp.type.type"] = "Type",
    ["@lsp.type.typeParameter"] = "Type",
    ["@lsp.type.variable"] = "Identifier",
  }

  for group, target in pairs(lsp_links) do
    link(group, target)
  end

  set("@lsp.mod.deprecated", { strikethrough = true })
  link("@lsp.mod.defaultLibrary", "Ring0Builtin")
  link("@lsp.mod.readonly", "Constant")

  ---------------------------------------------------------------------------
  -- GitSigns. Explicit definitions are useful because GitSigns derives many
  -- of its groups from Diff*/Added/Changed/Removed.
  ---------------------------------------------------------------------------
  link_many({ "GitSignsAdd", "GitSignsUntracked", "GitSignsAddNr", "GitSignsUntrackedNr", "GitSignsAddCul" }, "Added")
  link_many({ "GitSignsChange", "GitSignsChangeNr", "GitSignsChangeCul" }, "Changed")
  link_many({ "GitSignsDelete", "GitSignsTopdelete", "GitSignsDeleteNr", "GitSignsTopdeleteNr", "GitSignsDeleteCul" }, "Removed")
  link_many({ "GitSignsChangedelete", "GitSignsChangedeleteNr", "GitSignsChangedeleteCul" }, "Changed")

  link_many({ "GitSignsAddLn", "GitSignsUntrackedLn", "GitSignsAddPreview" }, "DiffAdd")
  link_many({ "GitSignsChangeLn", "GitSignsChangedeleteLn" }, "DiffChange")
  link_many({ "GitSignsDeleteLn", "GitSignsTopdeleteLn", "GitSignsDeletePreview" }, "DiffDelete")
  link("GitSignsCurrentLineBlame", "Comment")

  ---------------------------------------------------------------------------
  -- Telescope
  ---------------------------------------------------------------------------
  link("TelescopeNormal", "NormalFloat")
  link("TelescopeBorder", "FloatBorder")
  link("TelescopePromptNormal", "NormalFloat")
  link("TelescopePromptBorder", "FloatBorder")
  link("TelescopeResultsNormal", "NormalFloat")
  link("TelescopeResultsBorder", "FloatBorder")
  link("TelescopePreviewNormal", "NormalFloat")
  link("TelescopePreviewBorder", "FloatBorder")
  set("TelescopeSelection", { fg = c.fg_bright, bg = c.bg1 })
  link("TelescopeSelectionCaret", "Statement")
  set("TelescopeMatching", { fg = c.yellow, bold = true })
  link("TelescopePromptPrefix", "Statement")
  link_many({ "TelescopePromptTitle", "TelescopeResultsTitle", "TelescopePreviewTitle" }, "Title")

  ---------------------------------------------------------------------------
  -- nvim-cmp and blink.cmp
  ---------------------------------------------------------------------------
  link("CmpItemAbbr", "Normal")
  set("CmpItemAbbrDeprecated", { fg = c.quartz, strikethrough = true })
  link_many({ "CmpItemAbbrMatch", "CmpItemAbbrMatchFuzzy" }, "Ring0Builtin")
  link("CmpItemMenu", "Comment")

  link("BlinkCmpLabel", "Normal")
  set("BlinkCmpLabelDeprecated", { fg = c.quartz, strikethrough = true })
  link_many({ "BlinkCmpLabelMatch", "BlinkCmpLabelDetail", "BlinkCmpLabelDescription" }, "Ring0Muted")
  link("BlinkCmpMenu", "Pmenu")
  link("BlinkCmpMenuSelection", "PmenuSel")
  link("BlinkCmpMenuBorder", "PmenuBorder")
  link("BlinkCmpDoc", "NormalFloat")
  link("BlinkCmpDocBorder", "FloatBorder")
  link("BlinkCmpSignatureHelp", "NormalFloat")
  link("BlinkCmpSignatureHelpBorder", "FloatBorder")

  local kind_links = {
    Text = "Normal",
    Method = "Function",
    Function = "Function",
    Constructor = "Function",
    Field = "Ring0Member",
    Variable = "Identifier",
    Class = "Type",
    Interface = "Type",
    Module = "Type",
    Property = "Ring0Property",
    Unit = "Constant",
    Value = "Constant",
    Enum = "Type",
    Keyword = "Statement",
    Snippet = "String",
    Color = "Special",
    File = "Directory",
    Reference = "Ring0Link",
    Folder = "Directory",
    EnumMember = "Constant",
    Constant = "Constant",
    Struct = "Type",
    Event = "Special",
    Operator = "Operator",
    TypeParameter = "Type",
  }

  for kind, target in pairs(kind_links) do
    link("CmpItemKind" .. kind, target)
    link("BlinkCmpKind" .. kind, target)
  end

  ---------------------------------------------------------------------------
  -- Which-key
  ---------------------------------------------------------------------------
  link("WhichKey", "Statement")
  link("WhichKeyGroup", "Function")
  link("WhichKeyDesc", "Normal")
  link("WhichKeySeparator", "Comment")
  link("WhichKeyFloat", "NormalFloat")
  link("WhichKeyBorder", "FloatBorder")
  link("WhichKeyValue", "String")

  ---------------------------------------------------------------------------
  -- File explorers: nvim-tree / neo-tree
  ---------------------------------------------------------------------------
  link_many({ "NvimTreeNormal", "NvimTreeNormalNC", "NeoTreeNormal", "NeoTreeNormalNC" }, "Normal")
  link_many({ "NvimTreeWinSeparator", "NeoTreeWinSeparator" }, "WinSeparator")
  link_many({ "NvimTreeRootFolder", "NeoTreeRootName" }, "Title")
  link_many({ "NvimTreeFolderName", "NvimTreeOpenedFolderName", "NeoTreeDirectoryName", "NeoTreeDirectoryIcon" }, "Directory")
  link_many({ "NvimTreeFolderIcon", "NvimTreeIndentMarker", "NeoTreeIndentMarker", "NeoTreeExpander" }, "Ring0Muted")
  link_many({ "NvimTreeSymlink", "NeoTreeSymbolicLinkTarget" }, "Ring0Link")
  link_many({ "NvimTreeGitNew", "NeoTreeGitAdded", "NeoTreeGitUntracked" }, "Added")
  link_many({ "NvimTreeGitDirty", "NeoTreeGitModified", "NeoTreeGitConflict" }, "Changed")
  link_many({ "NvimTreeGitDeleted", "NeoTreeGitDeleted" }, "Removed")
  link_many({ "NvimTreeSpecialFile", "NeoTreeFileNameOpened" }, "Statement")
  link("NeoTreeDimText", "Ring0Muted")

  ---------------------------------------------------------------------------
  -- lazy.nvim / mason.nvim
  ---------------------------------------------------------------------------
  link("LazyNormal", "NormalFloat")
  link("LazyH1", "Title")
  link("LazyH2", "Function")
  link("LazyButton", "Pmenu")
  link("LazyButtonActive", "PmenuSel")
  link("LazySpecial", "Ring0Builtin")
  link("LazyComment", "Comment")
  link("LazyReasonPlugin", "Function")
  link("LazyReasonEvent", "Statement")
  link("LazyReasonCmd", "String")
  link("LazyProgressDone", "Added")
  link("LazyProgressTodo", "Comment")

  link("MasonNormal", "NormalFloat")
  set("MasonHeader", { fg = c.black, bg = c.yellow, bold = true })
  set("MasonHeaderSecondary", { fg = c.black, bg = c.niagara, bold = true })
  link("MasonHighlight", "Function")
  link("MasonHighlightBlock", "PmenuSel")
  link("MasonHighlightBlockBold", "PmenuSel")
  link("MasonMuted", "Ring0Muted")
  set("MasonMutedBlock", { fg = c.quartz, bg = c.bg1 })

  ---------------------------------------------------------------------------
  -- Trouble / notify / noice
  ---------------------------------------------------------------------------
  link_many({ "TroubleNormal", "TroubleNormalNC" }, "Normal")
  link("TroubleText", "Normal")
  link("TroubleCount", "Ring0Builtin")
  link("TroubleFile", "Directory")
  link("TroubleSource", "Ring0Muted")

  local notify_severity = {
    ERROR = "DiagnosticError",
    WARN = "DiagnosticWarn",
    INFO = "DiagnosticInfo",
    DEBUG = "Comment",
    TRACE = "DiagnosticHint",
  }

  for name, target in pairs(notify_severity) do
    link("Notify" .. name .. "Border", target)
    link("Notify" .. name .. "Icon", target)
    link("Notify" .. name .. "Title", target)
    link("Notify" .. name .. "Body", "NormalFloat")
  end

  link("NoiceCmdline", "NormalFloat")
  link("NoiceCmdlinePopup", "NormalFloat")
  link("NoiceCmdlinePopupBorder", "FloatBorder")
  link("NoiceCmdlinePopupTitle", "Title")
  link("NoiceConfirm", "NormalFloat")
  link("NoiceConfirmBorder", "FloatBorder")
  link("NoiceMini", "Comment")
end

function M.set_terminal_colors()
  local terminal = {
    c.bg_darker,
    c.red,
    c.green,
    c.yellow,
    c.niagara,
    c.wisteria,
    c.cyan,
    c.fg,
    c.bg4,
    c.red_bright,
    c.green,
    c.yellow,
    c.blue,
    c.purple,
    c.cyan,
    c.fg_bright,
  }

  for i, color in ipairs(terminal) do
    vim.g["terminal_color_" .. (i - 1)] = color
  end
end

return M
