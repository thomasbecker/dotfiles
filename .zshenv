#!/bin/zsh
#
# .zshenv - Zsh environment file, loaded always.
#

# Set ZDOTDIR if you want to re-home Zsh.
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}
export GRADLE_USER_HOME="$HOME/.config/gradle"


# You can use .zprofile to set environment vars for non-login, non-interactive shells.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# load additional host specific environment settings
source ${ZDOTDIR:-$HOME}/.zshenv_host
. "$HOME/.cargo/env"
