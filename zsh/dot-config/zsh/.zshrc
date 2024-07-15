#!/bin/zsh
# console output needs to happen before instant prompt is enabled

export WEZTERM_CONFIG_FILE="$HOME/.config/wezterm/wezterm.lua"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ${ZDOTDIR}/.history
source ${ZDOTDIR}/.dotnet

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Zsh options.
setopt extended_glob
MAGIC_ENTER_OTHER_COMMAND='ll'

# prepare antidote
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh

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

# Source zstyles you might use with antidote.
[[ -e ${ZDOTDIR:-~}/.zstyles ]] && source ${ZDOTDIR:-~}/.zstyles

eval $(thefuck --alias)
eval "$(zoxide init zsh)"

source <(fzf --zsh)
# [ -f ~/config/fzf/fzf.zsh ] && source ~/config/fzf/fzf.zsh

# fzf defaults with rsop for preview
export FZF_DEFAULT_OPTS="--bind 'ctrl-/:toggle-preview' --preview 'rsp {}'"
# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

export FZF_CTRL_T_OPTS="--preview 'rsp {}'"
export FZF_ALT_C_OPTS="--preview 'rsp {} | head -200'"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

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
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
#   export POWERLEVEL9K_TRANSIENT_PROMPT=always
#   # eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/catppuccin_mocha.omp.json)"
#   eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/my-posh-settings.toml)"
# fi

# disable kubectl segment by default
# oh-my-posh toggle kubectl
