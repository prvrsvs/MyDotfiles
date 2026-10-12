# ==========================================
# PRVRSVS ZSH CONFIGURATION
# ==========================================

# ==========================================
# OPTIONS
# ==========================================

setopt PROMPT_SUBST
setopt AUTO_CD
setopt CORRECT
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

# ==========================================
# HISTORY
# ==========================================

HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# ==========================================
# COLORS
# ==========================================

autoload -U colors && colors

# ==========================================
# GIT
# ==========================================

function git_prompt_info() {
    local branch

    if git rev-parse --is-inside-work-tree &>/dev/null; then
        branch=$(git branch --show-current 2>/dev/null)

        if [[ -n "$branch" ]]; then
            echo "  $branch"
        fi
    fi
}

# ==========================================
# PROJECT DIRECTORY
# ==========================================

function root_dir() {
    if [[ "$PWD" == "$HOME" ]]; then
        return
    fi

    echo "%F{red}[%f%F{green}%f %F{green}%~%f%F{red}]%f"
}

# ==========================================
# PREVIOUS COMMAND
# ==========================================

function precmd() {
    local exit_code=$?

    if (( exit_code != 0 )); then
        print -P "%F{red}──[%f%F{red}$exit_code%f%F{red}]%f"
    fi
}

# ==========================================
# PROMPT
# ==========================================

PROMPT='%F{red}
┌─[%F{blue}⚡%f%F{blue}%n%f%F{red}]%f $(root_dir)$(git_prompt_info)
%F{red}└── %f'

# ==========================================
# ALIAS
# ==========================================

alias ls='eza --icons --group-directories-first'
alias ll='eza -lah --icons --group-directories-first'
alias la='eza -a --icons --group-directories-first'
alias emac='emacs'

# ==========================================
# AUTOCOMPLETION
# ==========================================

# Autosuggestions
source ~/.local/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting — debe ir al final
source ~/.local/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
