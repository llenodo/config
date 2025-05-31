# ZSH Color setup and git prompt with status indicators

# Enable git info in prompt
autoload -Uz vcs_info
setopt PROMPT_SUBST

# Function to get git status indicators
git_status_indicators() {
    local indicators=""
    
    # Check if we're in a git repo
    git rev-parse --git-dir >/dev/null 2>&1 || return
    
    # Check for unstaged changes (dirty working tree)
    if ! git diff --quiet 2>/dev/null; then
        indicators="${indicators}*"
    fi
    
    # Check for staged changes
    if ! git diff --cached --quiet 2>/dev/null; then
        indicators="${indicators}+"
    fi
    
    # Check for stashed changes
    if git rev-parse --verify refs/stash >/dev/null 2>&1; then
        indicators="${indicators}$"
    fi
    
    # Check for untracked files
    if [ -n "$(git ls-files --others --exclude-standard 2>/dev/null)" ]; then
        indicators="${indicators}%"
    fi
    
    echo "$indicators"
}

# Function to get current git branch with status and color
git_prompt_info() {
    local branch
    branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        local git_status=$(git_status_indicators)
        if [ -n "$git_status" ]; then
            # Dirty repo - bright red
            echo " %F{9}(${branch}${git_status})%f"
        else
            # Clean repo - normal green  
            echo " %F{green}(${branch})%f"
        fi
    fi
}

# ZSH color prompt with original bash colors
# Cyan user, bright green @host, bright yellow directory
PS1='%F{cyan}%n%f%F{10}@%m%f%F{white}:%f%F{11}%~%f$(git_prompt_info)%F{white}$ %f' 