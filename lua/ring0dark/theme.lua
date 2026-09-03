local c = require("ring0dark.palette")

local hl = vim.api.nvim_set_hl

local theme = {}

theme.set_highlights = function()

	----------------------------------------------------------------
	-- Completion menu
	----------------------------------------------------------------

	hl(0, "Pmenu", {

		fg = c.fg,
		bg = c.bg,
	})

	hl(0, "PmenuSel", {
		fg = c.fg_bright,
		bg = c.gray,
		bold = true,
	})
	hl(0, "PmenuSbar", {
		bg = c.bg,
	})

	hl(0, "PmenuThumb", {
		bg = c.gray,
	})

	----------------------------------------------------------------
	-- Floating documentation
	----------------------------------------------------------------

	hl(0, "NormalFloat", {
		fg = c.fg,
		bg = c.bg,
	})

	hl(0, "FloatBorder", {
		fg = c.quartz,
		bg = c.bg,
	})

	----------------------------------------------------------------
	-- Editor UI
	----------------------------------------------------------------

	hl(0, "Normal", {
		fg = c.fg,
		bg = c.bg,
	})

	hl(0, "Folded", {
		fg = c.quartz,
		bg = c.bg,
	})

	hl(0, "NormalFloat", {
		fg = c.fg,
		bg = c.bg,
	})

	hl(0, "FloatBorder", {
		fg = c.fg,
		bg = c.bg,
	})

	hl(0, "NormalNC", {
		fg = c.fg,
		bg = c.bg,
	})

	hl(0, "NormalSB", {
		fg = c.fg,
		bg = c.bg_darker,
	})

	hl(0, "Pmenu", {
		fg = c.fg,
		bg = c.bg,
	})

	hl(0, "SignColumn", {
		fg = "NONE",
		bg = c.bg,
	})

	----------------------------------------------------------------
	-- Cursor / selection / status
	--
	-- ring0-dark 原版这些地方用了 italic。
	-- Tsoding 风格不需要。
	----------------------------------------------------------------

	hl(0, "CursorLineNr", {
		fg = c.yellow,
		bg = "NONE",
		bold = true,
	})

	hl(0, "TelescopeSelection", {
		fg = c.fg,
		bg = c.gray,
	})

	hl(0, "CursorLine", {
		fg = "NONE",
		bg = c.gray,
	})

	hl(0, "StatusLine", {
		fg = c.fg,
		bg = c.gray,
	})

	----------------------------------------------------------------
	-- Classic syntax groups
	----------------------------------------------------------------

	-- if / else / for / while / return ...
	-- Tsoding: yellow + bold
	hl(0, "Statement", {
		fg = c.yellow,
		bg = "NONE",
		bold = true,
	})

	-- Comments:
	-- Tsoding / Gruber Darker = brown, regular
	hl(0, "Comment", {
		fg = c.brown,
		bg = "NONE",
	})

	-- Strings:
	-- green, regular
	hl(0, "String", {
		fg = c.green,
		bg = "NONE",
	})

	-- Functions:
	-- Tsoding's Niagara blue-gray
	hl(0, "Function", {
		fg = c.niagara,
		bg = "NONE",
	})

	-- Variables:
	-- slightly brighter than normal foreground
	hl(0, "Identifier", {
		fg = c.fg_bright,
		bg = "NONE",
	})

	-- Constants:
	-- quartz
	hl(0, "Constant", {
		fg = c.quartz,
		bg = "NONE",
	})

	-- Types:
	-- quartz, importantly NOT bold
	hl(0, "Type", {
		fg = c.quartz,
		bg = "NONE",
	})

	-- #include / #define / preprocessors
	hl(0, "PreProc", {
		fg = c.quartz,
		bg = "NONE",
	})

	-- Operators deliberately stay quiet
	hl(0, "Operator", {
		fg = c.fg,
		bg = "NONE",
	})

	hl(0, "Special", {
		fg = c.fg,
		bg = "NONE",
		bold = true,
	})

	hl(0, "Title", {
		fg = c.yellow,
		bg = "NONE",
		bold = true,
	})

	----------------------------------------------------------------
	-- Tree-sitter
	--
	-- Neovim 现代语法高亮很多来自 @xxx capture。
	-- 这里把它们映射到上面的 Tsoding-style groups。
	----------------------------------------------------------------

	local links = {
		-- comments
		["@comment"] = "Comment",
		["@comment.documentation"] = "Comment",

		-- strings
		["@string"] = "String",
		["@string.documentation"] = "String",
		["@string.regexp"] = "String",

		-- functions
		["@function"] = "Function",
		["@function.call"] = "Function",
		["@function.method"] = "Function",
		["@function.method.call"] = "Function",
		["@constructor"] = "Function",

		-- variables
		["@variable"] = "Identifier",
		["@variable.parameter"] = "Identifier",
		["@variable.member"] = "Identifier",

		-- constants / numbers
		["@constant"] = "Constant",
		["@number"] = "Constant",
		["@number.float"] = "Constant",
		["@boolean"] = "Constant",

		-- types
		["@type"] = "Type",
		["@type.builtin"] = "Type",
		["@type.definition"] = "Type",

		-- keywords
		["@keyword"] = "Statement",
		["@keyword.function"] = "Statement",
		["@keyword.return"] = "Statement",
		["@keyword.conditional"] = "Statement",
		["@keyword.repeat"] = "Statement",
		["@keyword.import"] = "Statement",
		["@keyword.exception"] = "Statement",

		-- preprocessing
		["@keyword.directive"] = "PreProc",
		["@keyword.directive.define"] = "PreProc",
		["@constant.macro"] = "PreProc",
		["@function.macro"] = "PreProc",

		-- operators / punctuation
		["@operator"] = "Operator",
		["@punctuation.delimiter"] = "Normal",
		["@punctuation.bracket"] = "Normal",
	}

	for group, target in pairs(links) do
		hl(0, group, {
			link = target,
		})
	end

	----------------------------------------------------------------
	-- Builtins
	--
	-- Original Gruber Darker makes builtins yellow,
	-- but unlike keywords they don't have to be bold.
	----------------------------------------------------------------

	hl(0, "Ring0Builtin", {
		fg = c.yellow,
		bg = "NONE",
	})

	hl(0, "@function.builtin", {
		link = "Ring0Builtin",
	})

	hl(0, "@variable.builtin", {
		link = "Ring0Builtin",
	})

	hl(0, "@constant.builtin", {
		link = "Ring0Builtin",
	})

	----------------------------------------------------------------
	-- Diagnostics
	----------------------------------------------------------------

	hl(0, "DiagnosticError", {
		fg = c.red,
		bg = "NONE",
		bold = true,
	})

	hl(0, "DiagnosticWarn", {
		fg = c.yellow,
		bg = "NONE",
		bold = true,
	})

	hl(0, "DiagnosticHint", {
		fg = c.cyan,
		bg = "NONE",
		bold = true,
	})
end

return theme
