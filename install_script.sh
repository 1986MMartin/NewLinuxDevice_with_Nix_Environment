# install nix software
curl -L https://nixos.org/nix/install | sh

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
	nixpkgs.zsh \
	nixpkgs.antibody \
	nixpkgs.git \
	nixpkgs.neovim \
	nixpkgs.tmux \
	nixpkgs.stow \
	nixpkgs.yarn \
	nixpkgs.fzf \
	nixpkgs.ripgrep \
	nixpkgs.bat \
	nixpkgs.gnumake \
	nixpkgs.gcc \
	nixpkgs.direnv

# install git variables
git config --global user.name "Markus Martin"
git config --global user.email "1986mmartin@gmail.com"
git config --global core.editor "vim"
git clone https://github.com/1986MMartin/coding-sections-markus $HOME/coding/coding-sections-markus
git clone https://github.com/1986MMartin/UdemyDataScience $HOME/coding/UdemyDataScience/
git clone https://github.com/1986MMartin/NewLinuxDevice_with_Nix_Environment.git $HOME/coding/NewLinuxDevice_with_Nix_Environment/


# stow dotfiles
stow git
stow nvim
stow tmux
stow zsh

# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins 
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
