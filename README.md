# Dotfiles

This repository contains my personal dotfiles managed with GNU Stow, allowing
for easy deployment and management across different operating systems.

## Prerequisites

- Install GNU Stow:

  ```bash
  # macOS
  brew install stow

  # Ubuntu/Debian
  sudo apt install stow

  # Arch Linux
  sudo pacman -S stow
  ```

## Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/thomasbecker/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. Use stow to symlink configurations:

   ```bash
   # Install specific config (e.g., neovim)
   stow nvim

   # Install multiple configs
   stow zsh tmux nvim

   # Install everything
   stow */
   ```

## Examples

### Installing Neovim config

```bash
stow nvim
```

This will create symlinks from `~/.dotfiles/nvim/.config/nvim/*` to `~/.config/nvim/*`

### Installing ZSH config

```bash
stow zsh
```

This will symlink all files from `~/.dotfiles/zsh/` to your home directory

### Removing stowed configs

```bash
stow -D nvim
```

## Structure

Each directory in this repository represents a package that can be stowed independently:

```text
.
├── nvim/               # Neovim configuration
│   └── dot-config/
│       └── nvim/
├── zsh/                # ZSH configuration
│   └── dot-config/
│       └── zsh/
└── ...
```

## Tips

- Use `stow -n <package>` to simulate stow operations (dry run)
- Use `stow -v <package>` for verbose output
- Use `stow -D <package>` to unlink (remove) a package
- Use `stow -R <package>` to restow (refresh) a package
