# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/p10k/p10k.zsh ]] || source ~/.config/p10k/p10k.zsh

