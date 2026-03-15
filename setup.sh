#!/bin/bash
# Setup script for development environment
# Run this on both Linux (Manjaro) and WSL (Ubuntu)

set -e  # Exit on error

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║  AI-Powered Development Environment Setup                   ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# Detect OS
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
else
    echo "Cannot detect OS. Please install manually."
    exit 1
fi

echo "Detected OS: $OS"
echo ""

# ============================================================================
# 1. INSTALL BASIC DEPENDENCIES
# ============================================================================
echo "▶ Installing basic dependencies..."

if [ "$OS" = "ubuntu" ] || [ "$OS" = "debian" ]; then
    sudo apt update
    sudo apt install -y git curl wget build-essential
    
    # Install Neovim
    echo "▶ Installing Neovim..."
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux64.tar.gz
    rm nvim-linux64.tar.gz
    
    # Add to PATH if not already there
    if ! grep -q "/opt/nvim-linux64/bin" ~/.bashrc; then
        echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.bashrc
    fi
    export PATH="$PATH:/opt/nvim-linux64/bin"
    
    # Install other tools
    sudo apt install -y tmux ripgrep
    
elif [ "$OS" = "manjaro" ] || [ "$OS" = "arch" ]; then
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm git curl wget base-devel neovim tmux ripgrep
else
    echo "Unsupported OS. Please install manually: neovim, tmux, ripgrep"
    exit 1
fi

# ============================================================================
# 2. INSTALL FZF
# ============================================================================
echo "▶ Installing FZF..."
if [ ! -d ~/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all --no-bash --no-zsh --no-fish
fi

# ============================================================================
# 3. INSTALL GITHUB CLI AND COPILOT
# ============================================================================
echo "▶ Installing GitHub CLI..."

if [ "$OS" = "ubuntu" ] || [ "$OS" = "debian" ]; then
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt update
    sudo apt install -y gh
elif [ "$OS" = "manjaro" ] || [ "$OS" = "arch" ]; then
    sudo pacman -S --noconfirm github-cli
fi

# Authenticate and install Copilot (will prompt for login)
echo ""
echo "▶ Setting up GitHub Copilot CLI..."
echo "  You'll need to authenticate with GitHub."
read -p "Press Enter to continue..."
gh auth login
gh extension install github/gh-copilot

# ============================================================================
# 4. SETUP CONFIGURATION FILES
# ============================================================================
echo "▶ Setting up configuration files..."

# Backup existing configs
BACKUP_DIR=~/.config/backup-$(date +%Y%m%d-%H%M%S)
mkdir -p "$BACKUP_DIR"

# Neovim
if [ -f ~/.config/nvim/init.lua ]; then
    echo "  Backing up existing Neovim config..."
    mv ~/.config/nvim "$BACKUP_DIR/"
fi
mkdir -p ~/.config/nvim
cp config/nvim/init.lua ~/.config/nvim/
echo "  ✓ Neovim config installed"

# Tmux
if [ -f ~/.tmux.conf ]; then
    echo "  Backing up existing Tmux config..."
    mv ~/.tmux.conf "$BACKUP_DIR/"
fi
cp config/.tmux.conf ~/
echo "  ✓ Tmux config installed"

# Install TPM (Tmux Plugin Manager)
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo "  ✓ TPM installed"
fi

# Bash additions
if ! grep -q "# AI Dev Environment additions" ~/.bashrc; then
    echo "" >> ~/.bashrc
    echo "# AI Dev Environment additions" >> ~/.bashrc
    cat config/.bashrc-additions >> ~/.bashrc
    echo "  ✓ Bash config updated"
else
    echo "  ⚠ Bash config already updated (skipping)"
fi

# ============================================================================
# 5. INSTALL NEOVIM PLUGINS
# ============================================================================
echo "▶ Installing Neovim plugins..."
echo "  This may take a minute..."
nvim --headless "+Lazy! sync" +qa 2>/dev/null || true
echo "  ✓ Neovim plugins installed"

# ============================================================================
# 6. WSL-SPECIFIC SETUP
# ============================================================================
if grep -qi microsoft /proc/version 2>/dev/null; then
    echo "▶ Detected WSL - Installing clipboard integration..."
    
    # Install win32yank for clipboard
    if [ ! -f /usr/local/bin/win32yank.exe ]; then
        curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
        unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
        chmod +x /tmp/win32yank.exe
        sudo mv /tmp/win32yank.exe /usr/local/bin/
        rm /tmp/win32yank.zip
        echo "  ✓ WSL clipboard integration installed"
    fi
fi

# ============================================================================
# 7. FINAL STEPS
# ============================================================================
echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║  Installation Complete!                                      ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""
echo "Next steps:"
echo "  1. Restart your terminal (or run: source ~/.bashrc)"
echo "  2. Start tmux and install plugins:"
echo "     $ tmux"
echo "     Then press: Ctrl+a I (capital I)"
echo "  3. Test Neovim:"
echo "     $ nvim"
echo "  4. For VSCode setup, see README.md"
echo ""
echo "Quick start:"
echo "  $ tm          # Start tmux"
echo "  $ vf          # Open file with fuzzy finder"
echo "  $ ask \"...\"   # Ask Copilot CLI"
echo ""

if [ -d "$BACKUP_DIR" ]; then
    echo "Your old configs were backed up to: $BACKUP_DIR"
    echo ""
fi

echo "Happy coding! 🚀"
