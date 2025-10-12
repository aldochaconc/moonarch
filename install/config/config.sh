# Copy over Omarchy configs
mkdir -p ~/.config
cp -R ~/.local/share/omarchy/config/* ~/.config/

# Use zshrc and bashrc and set zsh as default shell
cp ~/.local/share/omarchy/config/zshrc ~/.zshrc
cp ~/.local/share/omarchy/config/bashrc ~/.bashrc
sudo chsh -s "$(which zsh)" "$USER"