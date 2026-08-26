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
# EZA
# ==========================================

alias ls='eza --icons --group-directories-first'
alias ll='eza -lah --icons --group-directories-first'
alias la='eza -a --icons --group-directories-first'

# ==========================================
# AUTOCOMPLETION
# ==========================================

autoload -Uz compinit
compinit

# Ignorar mayúsculas/minúsculas
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Menú de selección
zstyle ':completion:*' menu select

# Colores en las opciones
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Completar directorios primero
zstyle ':completion:*' file-sort modification
