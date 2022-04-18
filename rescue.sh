sudo xbps-install picom i3 neovim mlocate xtools flatpak xfce4-screenshooter brightnessctl firefox rofi moc acpi zsh wget curl bleachbit mtpaint virtualbox-ose virtualbox-ose-dkms htop neofetch nnn pcmanfm dkms base-devel git vscode fzf alacritty
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/void-linux/void-packages
cd void-packages
./xbps-src -j2 pkg google-chrome
xi google-chrome
./xbps-src -j2 pkg discord
xi discord
./xbps-src -j2 zoom
xi zoom
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cd /home/martin
git clone https://github.com/toluschr/xdeb
cd xdeb
sudo cp xdeb /usr/bin

cd /home/martin
cd dotfiles
mv .zshrc /home/martin
mv config/i3/config /home/martin/.config/
mv config/nvim /home/martin/.config/
mv config/alacritty /home/martin/.config/
sudo mv config/i3status.conf /etc/
cd /home/martin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

flatpak install flathub com.getpostman.Postman.flatpakref
cd void-packages
./xbps-src -j2 pkg torbrowser-launcher
xi torbrowser-launcher
echo 'FINALLY!'
