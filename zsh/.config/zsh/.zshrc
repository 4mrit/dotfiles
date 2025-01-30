# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#
fastfetch 
eval "$(zoxide init zsh)"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# necessary for avoiding compdef not found
autoload -Uz compinit
compinit

source ~/.config/tmux/plugins/tmuxifier/bin/ 
source ~/.nix-profile/etc/profile.d/nix.sh
source ~/.config/zsh/zsh_plugins.zsh
source ~/.aliases
source ~/.env
bindkey -M viins 'jj' vi-cmd-mode

export PATH="$PATH:~/.config/rescources/script"
export PATH="$PATH:$XDG_DATA_HOME/dotnet/.dotnet/tools"
export PATH=~/bin:$PATH
export TERM="xterm-256color"

source <(fzf --zsh)
HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/p10k/p10k.zsh ]] || source ~/.config/p10k/p10k.zsh

