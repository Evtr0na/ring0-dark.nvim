local colors = {
  -- ring0-dark base colors
  -- Unified soft white requested for editor text and popup accents.
  fg = "#E0E2EA",
  fg_bright = "#E0E2EA",
  white = "#E0E2EA",

  -- Ring0 uses a single black everywhere: no #000000 / #101010 split.
  black = "#181818",
  bg = "#181818",
  bg_darker = "#181818",
  bg1 = "#282828",
  bg2 = "#453d41",
  bg3 = "#484848",
  bg4 = "#52494e",
  gray = "#282828", -- backwards-compatible alias

  green = "#73d936",
  red = "#f43841",
  red_dark = "#c73c3f",
  red_bright = "#ff4f58",
  yellow = "#ffdd33",
  brown = "#cc8c3c",
  blue = "#519fdf",
  cyan = "#46a6b2",
  orange = "#c18a56",
  purple = "#b668cd",
  magenta = "#D16D9E",

  -- Gruber Darker accents
  quartz = "#95a99f",
  niagara = "#96a6c8",
  niagara_dark = "#565f73",
  niagara_darker = "#303540",
  wisteria = "#9e95c7",

  -- Subtle semantic backgrounds. These are intentionally dark so plugins
  -- that link to Diff*/Diagnostic* do not produce neon blocks.
  red_bg = "#2b1b1d",
  green_bg = "#1f2a1b",
  yellow_bg = "#2b2818",
  blue_bg = "#20242c",
}

return colors
