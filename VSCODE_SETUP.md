# VSCode Setup Guide

Complete guide for setting up VSCode with unified keybindings to match your
Neovim/Tmux workflow.

### Installation

VSCode should sync settings and keybinds are defined in a shared
`keybindings.json` across all profiles and `settings.json` (a couple of lines)
which is not shared across all profiles (so may need to modify in individual
profiles)

### Unified Keybindings

**Window Navigation:**

- `Ctrl+h/j/k/l` - Navigate between split windows

**File Operations:**

- Press `Esc` to enter normal mode
- `Space ff` - Should open quick open
- `Space fg` - Should open search in files
- `Space e` - Toggle sidebar

**Splits:**

- `Ctrl+\` - Split vertically
- `Ctrl+]` - Split horizontally
- `Ctrl+h/l` - Navigate between splits
