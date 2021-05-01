#/bin/sh
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/dein
touch ~/.config/nvim/init.vim
touch ~/.config/nvim/dein.toml
mkdir -p ~/.config/terminator
touch ~/.config/terminator/config
ln -sf ~/dotfiles/config ~/.config/terminator/config
ln -sf ~/dotfiles/dein.toml ~/.config/nvim/dein.toml
ln -sf ~/dotfiles/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/.zshrc  ~/.zshrc
