# Evaluation and Plan of new Setup

This is my personal evaluation, setup description, exploration, and learning plan for my new
development environment. This was not vibecoded, this is my deliberate planing.

## Tools

The standard set of tools many users use:

- **Editor:** VSCode, Neovim
- **Multiplexer:** tmux
- **File finder:** fzf, Telescope
- **AI Tools:** GitHub Copilot, Claude Code, Copilot CLI

The big question is which terminal. I decided to use the GPU accelerated terminal `Kitty` on linux
and `Windows Terminal` on Windows. I will evaluate the performance and features, and stability of
both and decide if I want to switch to `WezTerm` on windows or another teriminal on linux.

## Principles

- Try and use the default keybinds as much as possible except for conflict or important convenience.

## Navigation

### Window Navigation

I will use `tmux` for window management and navigation, and configure it to have a consistent
keybinding scheme across both terminals. I will also set up keybindings in VSCode and Neovim

- config is in `.config/tmux/`
- TODO: Consider `tmux-resurrect` or `tmux-continuum` for session management and automatic
  saving/restoring of tmux sessions.

### Editor Navigation

I'm used to vim, so editor motions are pretty ingrained, but one thing I dont use in vim so much is
tabs and splits and opening fiels

### File Navigation
