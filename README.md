# Shell Configuration

ZSH configuration files for terminal setup with git integration and aliases.

## Setup

Add this line to your `~/.zshrc`:

```bash
. ~/config/.zsh_profile
```

## Files

- **`.zsh_profile`** - Main configuration loader
- **`color.sh`** - ZSH prompt with git status indicators and colors
- **`.aliases`** - Shell aliases and functions (bash/zsh compatible)

## Git Status Indicators

The prompt shows git repository status:

- `(branch)` - Clean repository
- `(branch*)` - Dirty working tree (unstaged changes)
- `(branch+)` - Staged changes ready to commit
- `(branch$)` - Stashed changes available
- `(branch%)` - Untracked files present

## Features

- **Smart tab completion** - Git branches, commands, file paths
- **Git-aware prompt** - Shows current branch and status
- **Color-coded output** - Cyan user, bright green host, yellow directory
- **Shell aliases** - Shortcuts for common git/shell operations
