#!/bin/zsh
# console output needs to happen before instant prompt is enabled

export WEZTERM_CONFIG_FILE="$HOME/.config/wezterm/wezterm.lua"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zsh options.
setopt extended_glob
MAGIC_ENTER_OTHER_COMMAND='ll'

# prepare antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# set omz variables prior to loading omz plugins
ZSH=$(antidote path ohmyzsh/ohmyzsh)
ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/oh-my-zsh"
[[ -d $ZSH_CACHE_DIR ]] || mkdir -p $ZSH_CACHE_DIR
mkdir -p "$ZSH_CACHE_DIR/completions"
(( ${fpath[(Ie)"$ZSH_CACHE_DIR/completions"]} )) || fpath=("$ZSH_CACHE_DIR/completions" $fpath)

## Autoload functions you might want to use with antidote.
ZFUNCDIR=${ZFUNCDIR:-$ZDOTDIR/functions}
fpath=($ZFUNCDIR $fpath)
autoload -Uz $fpath[1]/*(.:t) 
autoload -Uz compinit && compinit

antidote load

# Set keybindings for zsh-vi-mode insert mode
function zvm_after_init() {
    zvm_bindkey viins "^P" up-line-or-beginning-search
    zvm_bindkey viins "^N" down-line-or-beginning-search
    for o in files branches tags remotes hashes stashes each_ref; do
        eval "zvm_bindkey viins '^g^${o[1]}' fzf-git-$o-widget"
        eval "zvm_bindkey viins '^g${o[1]}' fzf-git-$o-widget"
    done
}
# Set keybindings for zsh-vi-mode normal and visual modes
function zvm_after_lazy_keybindings() {
    for o in files branches tags remotes hashes stashes each_ref; do
        eval "zvm_bindkey vicmd '^g^${o[1]}' fzf-git-$o-widget"
        eval "zvm_bindkey vicmd '^g${o[1]}' fzf-git-$o-widget"
        eval "zvm_bindkey visual '^g^${o[1]}' fzf-git-$o-widget"
        eval "zvm_bindkey visual '^g${o[1]}' fzf-git-$o-widget"
    done
}

# Source zstyles you might use with antidote.
[[ -e ${ZDOTDIR:-~}/.zstyles ]] && source ${ZDOTDIR:-~}/.zstyles

eval $(thefuck --alias)
eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

[ -f ~/config/fzf/fzf.zsh ] && source ~/config/fzf/fzf.zsh

# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

export FZF_CTRL_T_OPTS="--preview 'rsp {}'"
export FZF_ALT_C_OPTS="--preview 'rsp {} | head -200'"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --follow --exclude .git . "$1"
}

source ~/.config/fzf-git.sh/fzf-git.sh

export BAT_THEME=Catppuccin-mocha
