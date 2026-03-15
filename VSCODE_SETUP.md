# VSCode Setup Guide

Complete guide for setting up VSCode with unified keybindings to match your Neovim/Tmux workflow.

## Prerequisites

- VSCode installed on your system
- Basic familiarity with VSCode

## Installation Steps

### 1. Install Required Extensions

Open VSCode and install these extensions:

```bash
# Essential
code --install-extension vscodevim.vim

# Recommended (for better experience)
code --install-extension PKief.material-icon-theme
code --install-extension enkia.tokyo-night

# Remote development (Windows WSL users)
code --install-extension ms-vscode-remote.remote-wsl

# Language support (install as needed)
code --install-extension ms-python.python
code --install-extension ms-python.black-formatter
code --install-extension rust-lang.rust-analyzer
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode

# Git integration (optional)
code --install-extension eamodio.gitlens

# DO NOT INSTALL AT WORK:
# code --install-extension GitHub.copilot
```

### 2. Copy Configuration Files

#### On Linux (Manjaro)

```bash
# Navigate to this repo
cd /path/to/new-devenv

# Copy settings
cp config/vscode/settings.json ~/.config/Code/User/settings.json

# Copy keybindings
cp config/vscode/keybindings.json ~/.config/Code/User/keybindings.json
```

#### On Windows (WSL)

```powershell
# From Windows PowerShell or Command Prompt
# Navigate to this repo (you'll need to access it from Windows)

# Copy settings
copy config\vscode\settings.json %APPDATA%\Code\User\settings.json

# Copy keybindings
copy config\vscode\keybindings.json %APPDATA%\Code\User\keybindings.json
```

Or from WSL terminal:

```bash
# Copy to Windows VSCode settings
cp config/vscode/settings.json /mnt/c/Users/YOUR_USERNAME/AppData/Roaming/Code/User/settings.json
cp config/vscode/keybindings.json /mnt/c/Users/YOUR_USERNAME/AppData/Roaming/Code/User/keybindings.json
```

### 3. Install Fonts

For the best experience, install one of these fonts:

**JetBrains Mono** (Recommended):

- Download: https://www.jetbrains.com/lp/mono/
- Install on your system
- Already configured in `settings.json`

**Fira Code**:

- Download: https://github.com/tonsky/FiraCode
- Alternative if you prefer different ligatures

**Cascadia Code**:

- Download: https://github.com/microsoft/cascadia-code
- Pre-installed on Windows 11

After installing fonts, restart VSCode.

### 4. Verify Neovim Extension

1. Open VSCode
2. Press `Ctrl+Shift+P` to open command palette
3. Type "Vim" and you should see vim commands
4. Open any file and press `Esc` - you should enter vim normal mode
5. The status bar should show the current vim mode

### 5. Test Unified Keybindings

Open a file and test these:

**Window Navigation:**

- `Ctrl+h/j/k/l` - Navigate between split windows

**File Operations:**

- Press `Esc` to enter normal mode
- `Space ff` - Should open quick open
- `Space fg` - Should open search in files
- `Space e` - Toggle sidebar

**Splits:**

- `Space sv` - Split vertically
- `Space sh` - Split horizontally
- `Ctrl+h/l` - Navigate between splits

If any don't work, check the next section.

### 6. Troubleshooting

#### Keybindings Not Working

1. Open Command Palette: `Ctrl+Shift+P`
2. Type "Preferences: Open Keyboard Shortcuts"
3. Search for your binding (e.g., "space f f")
4. Check for conflicts - delete conflicting bindings
5. Make sure "When" condition includes `vim.mode != 'Insert'`

#### Vim Extension Not Responding

1. Check VSCode Output panel: `Ctrl+Shift+U`
2. Select "Vim" from dropdown
3. Look for errors
4. Try reloading window: `Ctrl+Shift+P` → "Developer: Reload Window"

#### Settings Not Applied

1. Verify file location:
   - Linux: `~/.config/Code/User/settings.json`
   - Windows: `%APPDATA%\Code\User\settings.json`
2. Check JSON syntax (VSCode will show errors)
3. Reload window: `Ctrl+Shift+P` → "Developer: Reload Window"

## Configuration Customization

### Adjust Leader Key Delay

If Space key feels sluggish:

```json
{
  "vim.leader": "<space>",
  "vim.timeout": 300 // Smaller = faster (default 300ms)
}
```

### Change Color Theme

```json
{
  "workbench.colorTheme": "Tokyo Night", // Change to your preference
  "workbench.iconTheme": "material-icon-theme"
}
```

Available if you installed recommended extensions:

- Tokyo Night
- Default Dark+
- Monokai
- Solarized Dark

### Enable/Disable Features

```json
{
  // Disable relative line numbers if you don't like them
  "editor.lineNumbers": "on", // Instead of "relative"

  // Enable minimap if you want it
  "editor.minimap.enabled": true,

  // Change font size
  "editor.fontSize": 14,

  // Disable vim status bar colors
  "vim.statusBarColorControl": false
}
```

### Add Custom Keybindings

Edit `keybindings.json`:

```json
[
  // Add your custom binding
  {
    "key": "space m m",
    "command": "workbench.action.tasks.runTask",
    "when": "editorTextFocus && vim.mode != 'Insert'"
  }
]
```

## Using VSCode with WSL

### Opening WSL Projects

From WSL terminal:

```bash
cd ~/projects/myproject
code .
```

From VSCode:

1. Press `Ctrl+Shift+P`
2. Type "Remote-WSL: Open Folder in WSL"
3. Select your project folder

### Important Notes for WSL

1. **Install extensions in WSL:**
   - Extensions need to be installed separately in WSL
   - VSCode will prompt you when opening WSL folder
   - Click "Install in WSL" when prompted

2. **Settings are separate:**
   - Windows VSCode: `%APPDATA%\Code\User\`
   - WSL VSCode: `~/.vscode-server/data/Machine/`
   - You may need to copy settings to both locations

3. **Use correct terminal:**
   - Set integrated terminal to WSL in settings
   - Already configured in provided `settings.json`

## Work vs Home Setup

### At Work (Hide Copilot)

**Do NOT install:**

```bash
# SKIP THIS AT WORK
code --install-extension GitHub.copilot
```

**In `settings.json`, make sure Copilot is disabled:**

```json
{
  // DO NOT uncomment these at work
  // "github.copilot.enable": {
  //   "*": true
  // }
}
```

**Keep VSCode open in background:**

- When doing AI work in terminal, keep VSCode minimized but running
- Quick `Alt+Tab` to switch when screen sharing needed
- No Copilot = no suspicion

### At Home (Full AI Integration)

**Install Copilot:**

```bash
code --install-extension GitHub.copilot
```

**Enable in `settings.json`:**

```json
{
  "github.copilot.enable": {
    "*": true,
    "yaml": true,
    "plaintext": false,
    "markdown": true
  }
}
```

**Copilot Keybindings (optional):**

```json
[
  {
    "key": "alt+]",
    "command": "github.copilot.generate"
  }
]
```

## Quick Reference - Most Used Commands

| Action          | Keybinding                   | Description        |
| --------------- | ---------------------------- | ------------------ |
| Command Palette | `Ctrl+Shift+P`               | Run any command    |
| Quick Open      | `Ctrl+P` or `Space ff`       | Open files fast    |
| Search Files    | `Ctrl+Shift+F` or `Space fg` | Grep in project    |
| Toggle Sidebar  | `Ctrl+B` or `Space e`        | Show/hide explorer |
| Toggle Terminal | `Ctrl+\`` or `Space tt`      | Show/hide terminal |
| Split Editor    | `Space sv`                   | Vertical split     |
| Navigate Splits | `Ctrl+h/j/k/l`               | Move focus         |
| Settings        | `Ctrl+,`                     | Open settings UI   |
| Keybindings     | `Ctrl+K Ctrl+S`              | View all shortcuts |

## Advanced: Syncing Settings Across Machines

### Option 1: Settings Sync (Built-in)

1. `Ctrl+Shift+P` → "Settings Sync: Turn On"
2. Sign in with GitHub or Microsoft account
3. Select what to sync (Settings, Keybindings, Extensions)
4. On other machine, sign in with same account
5. Settings will automatically sync

**Note:** At work, you may want to use a separate account or disable sync.

### Option 2: Manual Sync (Git Repository)

This is already set up in this repo:

```bash
# On any machine, pull latest configs
cd ~/projects/new-devenv
git pull

# Copy to VSCode
cp config/vscode/settings.json ~/.config/Code/User/
cp config/vscode/keybindings.json ~/.config/Code/User/

# After making changes, commit and push
cd ~/projects/new-devenv
cp ~/.config/Code/User/settings.json config/vscode/
git add config/vscode/
git commit -m "Update VSCode config"
git push
```

## Testing Your Setup

### Checklist

- [ ] Vim extension installed and working (press `Esc` in a file)
- [ ] Status bar shows vim mode (NORMAL, INSERT, VISUAL)
- [ ] Line numbers are relative
- [ ] `Ctrl+h/j/k/l` navigates between splits
- [ ] `Space ff` opens quick open
- [ ] `Space fg` opens search
- [ ] `Space e` toggles sidebar
- [ ] `Space sv` creates vertical split
- [ ] Font is installed and looks good
- [ ] Color theme is applied

### Test Workflow

1. Open a project: `code ~/projects/test`
2. Open a file: `Ctrl+P` → type filename
3. Enter normal mode: `Esc`
4. Split window: `Space sv`
5. Navigate: `Ctrl+l` to move right
6. Open file in new split: `Space ff`
7. Navigate back: `Ctrl+h`
8. Search in files: `Space fg`
9. Toggle terminal: `Ctrl+\``

If all works smoothly, you're ready to go! 🎉

## Getting Help

- **VSCode Vim Extension:** https://github.com/VSCodeVim/Vim
- **VSCode Docs:** https://code.visualstudio.com/docs
- **This repo's cheatsheet:** See `CHEATSHEET.md`

## Next Steps

1. Practice using VSCode with vim keybindings for a few days
2. Switch to Neovim/Tmux for regular work
3. Keep VSCode as backup for screen sharing and complex tasks
4. Muscle memory will transfer between both environments

---

**Remember:** The goal is consistency. Same keybindings work in Neovim and VSCode!
