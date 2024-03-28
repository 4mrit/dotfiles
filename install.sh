#install nix
curl -L https://nixos.org/nix/install | sh

#source nix
. ~/.nix-profile/etc/profile.d/nix.sh

#install Packages
nix-env -iA nixpkgs.zsh \
            nixpkgs.neovim \
            nixpkgs.tmux \
            nixpkgs.tmuxifier \
            nixpkgs.stow \
            nixpkgs.antidote \

#add zsh to valid login shell
command -v zsh | sudo tee -a /etc/shells

#use zsh as default shell
sudo chsh -s $(which zsh) $USER

#source antibody and use antibody bundle to statically create .zsh_plugins.zsh
zsh -c "
        source ~/.nix-profile/share/antidote/antidote.zsh; 
        antidote bundle < ~/.config/zsh/zsh_plugins.txt > ~/.config/zsh/zsh_plugins.zsh
      "
