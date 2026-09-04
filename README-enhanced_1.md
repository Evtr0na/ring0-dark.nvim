# ring0-dark.nvim enhanced highlight coverage (#E0E2EA / unified-black revision)

This revision keeps the broader Neovim/plugin highlight coverage, but pulls the
visual style back toward the original minimal ring0-dark behavior.

Changes in this revision:

- Every black surface/value is now `#181818` (`black`, `bg`, `bg_darker`).
  Floating windows and completion menus no longer introduce `#101010` or pure
  `#000000`.
- All white/near-white foreground roles now use the requested `#E0E2EA`
  (`fg`, `fg_bright`, and `white`) for a single consistent text white.
- Completion menus intentionally use neutral kind colors again. `nvim-cmp` and
  `blink.cmp` kind icons no longer inherit Function/Type/Constant semantic
  colors, which was responsible for the blue/cyan/purple-heavy completion UI.
- Completion selection keeps a restrained `#282828` background, while the menu
  itself stays on `#181818`.
- Matching text is bright/bold rather than yellow, so completion remains a UI
  surface instead of looking like syntax highlighting.
- Floating-window borders/title bars now use `#E0E2EA` as the UI accent while
  keeping the popup body on `#181818`. Neo-tree filter/input popups explicitly
  define `NeoTreeFloatNormal`, `NeoTreeFloatBorder`, `NeoTreeFloatTitle`,
  `NeoTreeTitleBar`, and `NeoTreeFilterTerm`, so the previous mauve `Filter:`
  strip cannot leak back in through neo-tree defaults.
- The expanded Vim/Tree-sitter/LSP/Diagnostic/plugin fallback coverage remains
  intact, so unknown plugins still have sane highlight targets.

Use `:Inspect` and `:verbose hi <GroupName>` to locate any remaining third-party
highlight group that needs a link.
