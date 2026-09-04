local M = {}

local theme = require("ring0dark.theme")

M.setup = function()
  vim.cmd("hi clear")
  vim.o.background = "dark"

  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "ring0dark"

  theme.set_highlights()
  theme.set_terminal_colors()
end

return M
