# Quick Start Guide

Get up and running with your AI-powered development environment in 30 minutes.

## TL;DR - What You're Building

**Goal:** A unified keyboard-driven workflow that works identically across:

- Neovim (fast editing)
- VSCode (when you need GUI/screen sharing)
- Tmux (terminal multiplexing)
- Both your work (Windows WSL) and home (Manjaro Linux) machines

**Key Feature:** Same muscle memory everywhere - `Ctrl+h/j/k/l` navigation, `Space` leader key.

## Installation (Pick Your System)

### On Manjaro (Home) or Ubuntu/WSL (Work)

```bash
# Clone this repo (or download it)
cd ~
git clone <this-repo-url> ~/devenv-setup
cd ~/devenv-setup

# Run the automated setup
./setup.sh

# Restart terminal
source ~/.bashrc

# Start tmux and install plugins
tmux
# Press: Ctrl+Space I (capital I)

# Test neovim
nvim
```

**Time:** 15-20 minutes (includes downloads)

### CLI Tools (Ubuntu/Debian)

```bash
# fd — fast file finder (used by fzf)
sudo apt install fd-find
ln -s $(which fdfind) ~/.local/bin/fd

# fzf — fuzzy finder (shell integration)
sudo apt install fzf

# zoxide — frecency-based directory jumping (replaces cd)
sudo apt install zoxide
# Then add to ~/.zshrc:
eval "$(zoxide init zsh)"
```

After installing zoxide, use `z dirname` instead of `cd dirname`. It learns your most-visited
directories over time.

### VSCode Setup (Both Systems)

See [`VSCODE_SETUP.md`](VSCODE_SETUP.md) for detailed instructions.

Quick version:

```bash
# Install extensions
code --install-extension vscodevim.vim
code --install-extension enkia.tokyo-night

# Copy configs (Linux)
cp config/vscode/settings.json ~/.config/Code/User/
cp config/vscode/keybindings.json ~/.config/Code/User/

# Restart VSCode
```

**Time:** 5 minutes

## Your First Session

### 1. Start Tmux

```bash
tmux
```

You're now in a persistent terminal session. Even if you disconnect, it keeps running.

### 2. Open a File in Neovim

```bash
# Method 1: Direct
nvim myfile.txt

# Method 2: Fuzzy find (better!)
vf
# Type part of filename, press Enter
```

### 3. Practice Basic Vim Navigation

In Neovim:

- Press `Esc` to enter normal mode
- `h` `j` `k` `l` to move around
- `i` to enter insert mode (type normally)
- `Esc` to go back to normal mode
- `:w` to save
- `:q` to quit

**Tip:** Run `vimtutor` in your terminal for a 30-minute vim tutorial.

### 4. Create a Split Workflow

In Neovim:

- `<Space>sv` - Split vertically
- `Ctrl+l` - Move to right split
- `<Space>ff` - Open another file
- `Ctrl+h` - Move back to left split

### 5. Use Tmux Windows (Critical for Work)

- `Ctrl+Space c` - Create new window (empty terminal)
- `Ctrl+n` - Next window (no prefix)
- `Ctrl+p` - Previous window (no prefix)
- `Ctrl+Space 1` - Jump to window 1
- `Ctrl+Space 2` - Jump to window 2

**Practice the "hide AI" workflow:**

```bash
# Window 1: Open neovim
nvim project.py

# Create new window for AI
Ctrl+Space c

# Window 2: Use Copilot CLI
gh copilot suggest "python function to sort a list"

# Quick hide - jump back to window 1
Ctrl+Space 1

# Back to AI when safe
Ctrl+Space 2
```

### 6. Try AI Assistant (After `gh auth login`)

```bash
# Ask Copilot for command suggestions
ask "list all python files modified today"

# Explain a command
explain "find . -name '*.py' -mtime -1"
```

## Learning Path - Week by Week

### Week 1: Basics (Commit to This!)

**Days 1-2: Vim Navigation**

- Force yourself to use `hjkl` instead of arrow keys
- Practice `w`, `b`, `e` for word movement
- Learn `0` (line start), `$` (line end)
- Use `gg` (file top), `G` (file bottom)

**Days 3-4: Tmux**

- Start every session with `tmux`
- Practice `Ctrl+Space c` (new window)
- Practice `Ctrl+n`/`Ctrl+p` (next/prev windows)
- Get comfortable with splits: `Ctrl+\` and `Ctrl+]`

**Days 5-7: File Navigation**

- Use `vf` (fuzzy file finder) instead of `cd`
- In Neovim: Master `<Space>ff` (find files)
- In Neovim: Master `<Space>fg` (grep in files)
- Stop using file tree - fuzzy finding is faster!

**Goal:** By end of week, you should:

- Navigate a file without arrow keys
- Switch between tmux windows naturally
- Open any file in your project in <3 seconds

### Week 2: Vim Operations

**Learn these operations:**

- `dd` - Delete line
- `yy` - Copy line
- `p` - Paste
- `u` - Undo
- `Ctrl+r` - Redo
- `ci"` - Change inside quotes
- `di(` - Delete inside parentheses
- `va{` - Select around braces

**Practice workflow:**

1. Open file with `vf`
2. Search for text with `/pattern`
3. Make edits with `c`, `d`, `y`
4. Save with `:w`
5. Open another file with `<Space>ff`

**Goal:** Edit code without using insert mode for navigation.

### Week 3: Integration & Speed

**Morning routine:**

```bash
# Start tmux
tm

# Jump to project
proj

# Open files quickly
vf

# Create window for AI
Ctrl+Space c
```

**Set up your window layout:**

- Window 1: Main editing (Neovim)
- Window 2: Tests/output (terminal)
- Window 3: Git operations
- Window 9: AI tools (easy to hide with `Ctrl+Space 1`)

**Practice:**

- Edit multiple files simultaneously with splits
- Use git aliases: `gs`, `ga`, `gc`, `gp`
- Ask Copilot for help: `ask "how to..."`

**Goal:** Complete a simple coding task entirely in terminal.

### Week 4: Advanced & Customization

**Learn:**

- Vim macros: Record with `q`, replay with `@`
- Vim registers: Named yanks/deletes
- Advanced tmux: Sessions for different projects
- Custom keybindings

**Customize your setup:**

- Edit `~/.config/nvim/init.lua` to add plugins
- Edit `~/.tmux.conf` to adjust keybindings
- Add your own aliases to `~/.bashrc`

**Goal:** Fully comfortable - faster than your old workflow.

## Daily Workflow Examples

### Scenario 1: Morning Start (Home)

```bash
# Open terminal (Win+Enter in i3)
# Attach to yesterday's session
tm

# Check what you were doing
Ctrl+Space w  # List windows

# Jump to project window
Ctrl+Space 1

# Continue coding
<Space>ff  # Find file to work on
```

### Scenario 2: New Feature (Work - Discreet AI Use)

```bash
# Start coding in window 1
nvim src/feature.py

# Need AI help - create window 9
Ctrl+Space c
Ctrl+Space :move-window -t 9

# Ask Copilot
ask "python function to validate email"

# Jump back to code
Ctrl+Space 1

# If someone approaches:
# Already on window 1, they see your code, not AI

# Get back to AI when safe:
Ctrl+Space 9
```

### Scenario 3: Screen Share (Work)

```bash
# Currently in tmux with AI visible
# Meeting starting!

# Quick: Alt+Tab to VSCode
# VSCode already open without Copilot extension

# Share your screen showing VSCode
# Code as normal with same keybindings
Space ff, Ctrl+h/j/k/l all work!

# After meeting: Alt+Tab back to terminal
```

### Scenario 4: Multi-file Refactor (Home)

```bash
# Find files to edit
<Space>fg  # Search for old API calls

# Open first file
<Enter>

# Split and open second file
<Space>sv
Ctrl+l
<Space>ff

# Now you see two files side by side
# Navigate: Ctrl+h and Ctrl+l
# Edit with vim commands

# Ask AI for help
Ctrl+Space c
ask "refactor this to new API"

# Back to editing
Ctrl+p
```

## Common Pitfalls & Solutions

### "I keep forgetting to press Esc"

**Solution:** Train yourself with this drill:

- Open any file
- Press `i`, type a few characters
- Immediately press `Esc`
- Repeat 50 times

After 2 days, it becomes automatic.

### "Arrow keys are faster!"

**Solution:** Disable them! Add to `~/.config/nvim/init.lua`:

```lua
vim.keymap.set('n', '<Up>', '<Nop>')
vim.keymap.set('n', '<Down>', '<Nop>')
vim.keymap.set('n', '<Left>', '<Nop>')
vim.keymap.set('n', '<Right>', '<Nop>')
```

You'll learn `hjkl` in 1 day. Remove these after you're comfortable.

### "Tmux prefix is awkward"

**Solution:** The config uses `Ctrl+Space` as prefix. Next/previous window are `Ctrl+n`/`Ctrl+p` (no prefix needed).

### "I lost my tmux session"

**Solution:** You probably just detached. List and reattach:

```bash
tmux ls           # List sessions
tmux attach -t 0  # Attach to session 0
```

### "Keybindings not working in VSCode"

**Solution:**

1. Check you're in normal mode (press `Esc`)
2. Check for conflicts: `Ctrl+K Ctrl+S`, search for the binding
3. Make sure when condition is correct: `vim.mode != 'Insert'`

## Critical Skills to Master (In Order)

1. **Vim Navigation** (`hjkl`, `w`, `b`, `0`, `$`, `gg`, `G`)
   - Without this, everything else is painful
   - Commit to 1 week of no arrow keys

2. **Tmux Window Switching** (`Ctrl+n`/`Ctrl+p`, `Ctrl+Space 1-9`)
   - Essential for "hide AI" workflow at work
   - Practice until it's instant

3. **Fuzzy Finding** (`vf`, `<Space>ff`)
   - Fastest way to open files
   - Replace all file tree browsing

4. **Vim Operations** (`d`, `y`, `c` + motions)
   - This is where speed comes from
   - Learn one operation per day

5. **Splits & Multi-file** (`<Space>sv`, `Ctrl+h/l`)
   - See multiple files at once
   - Essential for refactoring

## When to Use What

### Use Neovim + Tmux when:

- ✅ Regular coding (90% of the time)
- ✅ Working with AI assistance privately
- ✅ Working on remote servers
- ✅ Want maximum speed
- ✅ Terminal is your comfort zone

### Use VSCode when:

- ✅ Screen sharing / pair programming
- ✅ Complex debugging with breakpoints
- ✅ Visual git operations (merge conflicts, graph)
- ✅ Need specific extensions not in vim
- ✅ Someone else is driving and prefers GUI

Both use the same keybindings, so switching is seamless!

## Measuring Progress

You'll know you're proficient when:

- [ ] You can open any file in your project in <3 seconds
- [ ] You navigate files without thinking about the keys
- [ ] You can hide AI terminal in <1 second when someone approaches
- [ ] You reflexively use `hjkl` instead of arrow keys
- [ ] You prefer terminal to GUI for most tasks
- [ ] You can switch between Neovim and VSCode seamlessly
- [ ] You think in vim motions: "delete inside parentheses" = `di(`

## Resources

**In this repo:**

- [`README.md`](README.md) - Complete reference
- [`CHEATSHEET.md`](CHEATSHEET.md) - Quick keyboard reference
- [`VSCODE_SETUP.md`](VSCODE_SETUP.md) - VSCode-specific guide

**Learning:**

- `vimtutor` - Built-in vim tutorial (30 min)
- https://vim-adventures.com/ - Game to learn vim
- https://tmuxcheatsheet.com/ - Tmux reference

**Getting Help:**

- Neovim: `:help <topic>` (e.g., `:help navigation`)
- Tmux: `man tmux` or https://github.com/tmux/tmux/wiki

## Next Steps

1. **Right now:** Run `./setup.sh` on your system
2. **Today:** Complete `vimtutor` (just run `vimtutor` in terminal)
3. **This week:** Force yourself to use only terminal + Neovim for all coding
4. **Next week:** Set up on your second machine (work or home)
5. **Ongoing:** Keep `CHEATSHEET.md` open on second monitor

## Final Thoughts

**You will be slower for the first week.** This is normal and expected. Every expert was once slow.

**Commit to 2 weeks** of using only this setup. No switching back "just for this quick task." After
2 weeks, you'll be faster than before.

**The payoff is huge:**

- Speed (FZF is magic)
- Keyboard-first workflow (less mouse = less time waste)
- Same muscle memory everywhere
- SSH into any server and feel at home
- AI integration without suspicious GUI

You've got this! 🚀

---

**Questions?** Check the README.md or CHEATSHEET.md in this repo.
