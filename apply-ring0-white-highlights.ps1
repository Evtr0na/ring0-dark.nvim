$ErrorActionPreference = 'Stop'

$path = Join-Path (Get-Location) 'lua\ring0dark\theme.lua'
if (-not (Test-Path $path)) {
  throw "Cannot find $path. Run this script from the ring0-dark.nvim repository root."
}

$content = [System.IO.File]::ReadAllText($path)
$original = $content

function Replace-Once([string]$old, [string]$new, [string]$label) {
  if ($script:content.Contains($old)) {
    $script:content = $script:content.Replace($old, $new)
    Write-Host "[changed] $label"
    return
  }

  if ($script:content.Contains($new)) {
    Write-Host "[already] $label"
    return
  }

  Write-Warning "Could not find expected text for: $label"
}

Replace-Once `
  '  link("TelescopeSelectionCaret", "Statement")' `
  '  set("TelescopeSelectionCaret", { fg = c.white })' `
  'Telescope selection caret -> white'

Replace-Once `
  '  link("TelescopePromptPrefix", "Statement")' `
  '  set("TelescopePromptPrefix", { fg = c.white })' `
  'Telescope prompt prefix -> white'

$oldTitles = '  link_many({ "TelescopePromptTitle", "TelescopeResultsTitle", "TelescopePreviewTitle" }, "Title")'
$newTitles = @(
  '  set("TelescopePromptTitle", { fg = c.white, bg = c.bg, bold = true })',
  '  set("TelescopeResultsTitle", { fg = c.white, bg = c.bg, bold = true })',
  '  set("TelescopePreviewTitle", { fg = c.white, bg = c.bg, bold = true })'
) -join [Environment]::NewLine
Replace-Once $oldTitles $newTitles 'Telescope titles -> white'

$oldRoot = '  link_many({ "NvimTreeRootFolder", "NeoTreeRootName" }, "Title")'
$newRoot = @(
  '  link("NvimTreeRootFolder", "Title")',
  '  set("NeoTreeRootName", { fg = c.white, bold = true })'
) -join [Environment]::NewLine
Replace-Once $oldRoot $newRoot 'Neo-tree absolute root path -> white'

if ($content -eq $original) {
  Write-Host 'No file changes were needed.'
  exit 0
}

[System.IO.File]::WriteAllText($path, $content, (New-Object System.Text.UTF8Encoding($false)))
Write-Host 'Done. Review with: git diff -- lua/ring0dark/theme.lua'
