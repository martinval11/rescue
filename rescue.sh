# Preparing...
cd
sudo xbps-install -y -Su
sudo xbps-install -y xorg xfce4-panel mocp dkms bc base-devel docker mlocate wget curl zip fzf hstr unzip picom freetype cantarell-fonts vscode neovim nano python3 python3-pip feh acpi pulseaudio alsa-plugins-pulseaudio pulseaudio-utils lxtask Thunar htop mpv gnome-disk-utility gnome-multi-writer gvfs lxappearance alacritty gcolor2 zsh rofi git firefox alsa-plugins lm_sensors alsa-firmware alsa-utils alsa-oss alsa-plugins-jack vsv pavucontrol networkmanager-applet xfce4-power-manager xfce4-notifyd virt-manager libvirt qemu bspwm sxhkd blueman
mkdir Desktop Downloads Music Videos Docs Code Deployments scripts

echo 'Changing Shell to zsh (/bin/zsh)'
chsh

git clone --depth=1 https://github.com/void-linux/void-packages
cd void-packages
./xbps-src binary-bootstrap
echo XBPS_ALLOW_RESTRICTED=yes etc/conf
./xbps-src pkg discord
./xbps-src pkg sublime-text4
cd

# Wifi Card

git clone https://github.com/tomaspinho/rtl8821ce.git
cd rtl8821ce
sudo ./dkms-install.sh

# Enabling services

sudo ln -s /etc/sv/bluetoothd /var/service
sudo ln -s /etc/sv/xfce4-notifyd /var/service
sudo ln -s /etc/sv/libvirtd /var/service
sudo ln -s /etc/sv/virtlockd /var/service
sudo ln -s /etc/sv/virtlogd /var/service
sudo vsv status virt
sudo gpasswd -a "$USER" libvirt
sudo gpasswd -a "$USER" libvirt

cd

# Modding
sudo usermod -a -G vboxusers martin
sudo usermod -a -G storage martin
sudo usermod -a -G network martin
sudo usermod -a -G floppy martin
sudo usermod -a -G usb martin
sudo usermod -a -G video martin
sudo usermod -a -G audio martin

git clone https://github.com/toluschr/xdeb scripts/
cd scripts/xdeb
chmod +x xdeb
sudo mv xdeb /usr/bin
cd

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo 'Add the plugin to the list of plugins for Oh My Zsh to load (inside ~/.zshrc):'

echo 'plugins=( '
echo '    # other plugins...'
echo '    zsh-autosuggestions'
echo ')'

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
hstr --show-configuration >> ~/.zshrc
git clone https://github.com/notfed/git-branch-name
cd git-branch-name
make
sudo install git-branch-name /usr/local/bin/
cd

# Neovim
# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Config
cd rescue
sudo mv .zshrc .xinitrc $HOME
sudo mv Wallpapers $HOME
sudo mv nvim sxhkd bspwm alacritty $HOME/.config
sudo mv bin/* /usr/local/bin
sudo cp grub /etc/default/
sudo mv void /usr/share/grub/themes
sudo update-grub

# Fonts
cd rescue
sudo mv JT Cascadia /usr/share/fonts

# Installing games...
sudo xbps-install -y 0ad minetest
cd Downloads
wget https://github.com/kasymovga/qrexuizlauncher/releases/download/2022.05.08/RexuizLauncher.Linux-x86_64.AppImage 
wget http://openarena.ws/request.php?4
sudo mv RexuizLauncher.Linux-x86_64.AppImage /usr/local/bin
unzip openarena-0.8.8.zip
cd

echo 'Happy Hacking :D'