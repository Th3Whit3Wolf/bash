#!/bin/bash

sudo pacman -S lynx &>/dev/null 

#######################
# a = Number of steps #
a=7
#######################

if [ $(id -u) = 0 ]; then
   echo "Cannot be run as root!"
   exit 1
fi

PS3="Enter Desktop Environment you would prefer "
select ENV in KDE GNOME Cinnamon Deepin Budgie LXDE LXQT MATE XFCE NONE
do
    echo "The $ENV Desktop Environment was selected"
    break
done

echo -n "Would you like to install your personal Github Repos to your Code Directory? [yes or no]: "
read GIT
case $GIT in

      [yY] | [yY][Ee][Ss] )
        read -p "What is you github username (is case sensative)" HUB
        git="YES"
        ;;

      [nN] | [n|N][O|o] )
        echo "$GIT was selected"
        git="NO"
        ;;

    *)  echo "Invalid input"
        ;;
esac

echo -ne "Initializing [1 / 10] [00% Complete] \r"

# Setup Normal User SubDirectory
mkdir Desktop
echo -ne "Initializing [0 / $a] [11% Complete] \r"
mkdir Documents
echo -ne "Initializing [0 / $a] [22% Complete] \r"
mkdir Downloads
echo -ne "Initializing [0 / $a] [33% Complete] \r"
mkdir Music
echo -ne "Initializing [0 / $a] [44% Complete] \r"
mkdir Pictures
echo -ne "Initializing [0 / $a] [56% Complete] \r"
mkdir Videos
echo -ne "Initializing [0 / $a] [67% Complete] \r"
# My Personal Preferences
mkdir -p tmp
echo -ne "Initializing [0 / $a] [78% Complete] \r"
mkdir -p git
echo -ne "Initializing [0 / $a] [89% Complete] \r"
mkdir -p Code && sudo pacman-optimize
echo -ne "Initializing [1 / $a] [00% Complete] \r"

########
# RUST #
########

# Install Rust
curl -f -L https://static.rust-lang.org/rustup.sh 2>/dev/null -O
echo -ne "Initializing [1 / $a] [11% Complete] \r"
chmod a+x rustup.sh
echo -ne "Initializing [1 / $a] [22% Complete] \r"
./rustup.sh -y &>/dev/null
$HOME/.cargo/bin
echo -ne "Initializing [1 / $a] [33% Complete] \r"
sudo rm -rf rustup.sh
echo -ne "Initializing [1 / $a] [44% Complete] \r"

# Install all potentially needed packages
cargo install racer  &>/dev/null
echo -ne "Initializing [1 / $a] [56% Complete] \r"
rustup component add rls-preview rust-analysis rust-src  &>/dev/null
echo -ne "Initializing [1 / $a] [67% Complete] \r"
rustup install beta  &>/dev/null
echo -ne "Initializing [1 / $a] [78% Complete] \r"
rustup install nightly  &>/dev/null
echo -ne "Initializing [1 / $a] [89% Complete] \r"
cargo +nightly install clippy  &>/dev/null
echo -ne "Initializing [2 / $a] [00% Complete] \r"

###########################
# Package Manager Upgrade #
###########################

gpg --keyserver pgp.mit.edu --recv-keys 1D1F0DC78F173680 &>/dev/null
echo -ne "Initializing [2 / $a] [09% Complete] \r"
sudo pacman -S base-devel fakeroot jshon expac git wget -y &>/dev/null
echo -ne "Initializing [2 / $a] [18% Complete] \r"
mkdir ~/packer && cd ~/packer
echo -ne "Initializing [2 / $a] [27% Complete] \r"
wget https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=packer
echo -ne "Initializing [2 / $a] [36% Complete] \r"
mv PKGBUILD\?h\=packer PKGBUILD
echo -ne "Initializing [2 / $a] [45% Complete] \r"
makepkg &>/dev/null
echo -ne "Initializing [2 / $a] [55% Complete] \r"
sudo pacman -U packer-*.pkg.tar.xz &>/dev/null
echo -ne "Initializing [2 / $a] [64% Complete] \r"
sudo packer -S --quiet --noconfirm powerpill &>/dev/null
echo -ne "Initializing [2 / $a] [73% Complete] \r"
sudo packer -S --quiet --noconfirm pamac &>/dev/null
echo -ne "Initializing [2 / $a] [82% Complete] \r"
cd ~
echo -ne "Initializing [2 / $a] [91% Complete] \r"
sudo rm -dR ~/packer
echo -ne "Initializing [3 / $a] [00% Complete] \r"

##########
# NEOVIM #
##########

# Download & install necessary packages
sudo packer -S --quiet --noconfirm neovim python2-neovim python-neovim  &>/dev/null
echo -ne "Initializing [3 / $a] [14% Complete] \r"
mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
echo -ne "Initializing [3 / $a] [29% Complete] \r"
git clone --quiet https://github.com/Shougo/dein.vim.git ~/.vim/dein/repos/github.com/Shougo/dein.vim
echo -ne "Initializing [3 / $a] [43% Complete] \r"

# Download my init.vim file from github
if test -d ~/.config/nvim
then
  cd ~/.config/nvim
  wget -q 'https://raw.githubusercontent.com/FriedPandaFries/setup/master/init.vim'
else
  mkdir ~/.config/nvim
  cd ~/.config/nvim
  wget -q 'https://raw.githubusercontent.com/FriedPandaFries/setup/master/init.vim'
fi
echo -ne "Initializing [3 / $a] [57% Complete] \r"

# Install plugins & setup YouCompleteMe
nvim -c 'call dein#install() | q' >/dev/null
echo -ne "Initializing [3 / $a] [71% Complete] \r"
cd ~/.vim/dein/repos/github.com/Valloric/YouCompleteMe
./install.py --rust-completer &>/dev/null
echo -ne "Initializing [3 / $a] [86% Complete] \r"
nvim -c 'call dein#clear_state() | call dein#recache_runtimepath() | call dein#install() | q' >/dev/null
echo -ne "Initializing [4 / $a] [00% Complete] \r"

########
# ATOM #
########

# Download & Install Atom
sudo packer -S --quiet --noconfirm atom &>/dev/null
echo -ne "Initializing [4 / $a] [03% Complete] \r"

# Download & install necessary packages
apm install atom-beautify
echo -ne "Initializing [4 / $a] [06% Complete] \r"
apm install linter
echo -ne "Initializing [4 / $a] [09% Complete] \r"
apm install linter-ui-default
echo -ne "Initializing [4 / $a] [12% Complete] \r"
apm install linter-jshint
echo -ne "Initializing [4 / $a] [15% Complete] \r"
apm install linter-htmlhint
echo -ne "Initializing [4 / $a] [18% Complete] \r"
apm install linter-csslint
echo -ne "Initializing [4 / $a] [21% Complete] \r"
apm install eslint
echo -ne "Initializing [4 / $a] [24% Complete] \r"
apm install emmet
echo -ne "Initializing [4 / $a] [26% Complete] \r"
apm install project-manager
echo -ne "Initializing [4 / $a] [29% Complete] \r"
apm install highlight-selected
echo -ne "Initializing [4 / $a] [32% Complete] \r"
apm install minimap-highlight-selected
echo -ne "Initializing [4 / $a] [35% Complete] \r"
apm install file-icons
echo -ne "Initializing [4 / $a] [38% Complete] \r"
apm install todo-show
echo -ne "Initializing [4 / $a] [41% Complete] \r"
apm install autoclose-html
echo -ne "Initializing [4 / $a] [44% Complete] \r"
apm install pigments
echo -ne "Initializing [4 / $a] [47% Complete] \r"
apm install auto-update-packages
echo -ne "Initializing [4 / $a] [50% Complete] \r"
apm install script
echo -ne "Initializing [4 / $a] [53% Complete] \r"
apm install seti-ui
echo -ne "Initializing [4 / $a] [56% Complete] \r"
apm install monokai-seti
echo -ne "Initializing [4 / $a] [59% Complete] \r"
apm install unity-ui
echo -ne "Initializing [4 / $a] [62% Complete] \r"
apm install native-ui
echo -ne "Initializing [4 / $a] [65% Complete] \r"
apm install an-old-hope-syntax
echo -ne "Initializing [4 / $a] [68% Complete] \r"
apm install material-ui
echo -ne "Initializing [4 / $a] [71% Complete] \r"
apm install atom-soda-dark-ui
echo -ne "Initializing [4 / $a] [74% Complete] \r"
apm install pen-paper-coffee-syntax
echo -ne "Initializing [4 / $a] [76% Complete] \r"
apm install yosemite-unity-ui
echo -ne "Initializing [4 / $a] [79% Complete] \r"
apm install spacemacs-dark-syntax theme
echo -ne "Initializing [4 / $a] [82% Complete] \r"
apm install language-rust
echo -ne "Initializing [4 / $a] [85% Complete] \r"
apm install atom-ide-ui
echo -ne "Initializing [4 / $a] [88% Complete] \r"
apm install ide-rust
echo -ne "Initializing [4 / $a] [91% Complete] \r"
apm install rustfmt
echo -ne "Initializing [4 / $a] [94% Complete] \r"
apm install intentions
echo -ne "Initializing [4 / $a] [97% Complete] \r"
apm install busy-signal
echo -ne "Initializing [5 / $a] [00% Complete] \r"

###############
# ARCH Tweaks #
###############

# Intel Optimization
cd ~
sudo packer -S --quiet --noconfirm intel-ucode libva-intel-driver vulkan-intel xf86-video-intel &>/dev/null
echo -ne "Initializing [5 / $a] [07% Complete] \r"

# Battery
sudo packer -S --quiet --noconfirm tlp powertop &>/dev/null
echo -ne "Initializing [5 / $a] [13% Complete] \r"

cat << EOF | sudo tee /etc/systemd/system/powertop.service
[Unit]
Description=PowerTOP auto tune

[Service]
Type=idle
Environment="TERM=dumb"
ExecStart=/usr/sbin/powertop --auto-tune

[Install]
WantedBy=multi-user.target
EOF
echo -ne "Initializing [5 / $a] [20% Complete] \r"

sudo systemctl enable tlp.service
echo -ne "Initializing [5 / $a] [27% Complete] \r"
sudo systemctl enable tlp-sleep.service
echo -ne "Initializing [5 / $a] [33% Complete] \r"
sudo systemctl mask systemd-rfkill.service
echo -ne "Initializing [5 / $a] [40% Complete] \r"
sudo systemctl mask systemd-rfkill.socket
echo -ne "Initializing [5 / $a] [47% Complete] \r"
sudo systemctl daemon-reload
echo -ne "Initializing [5 / $a] [53% Complete] \r"
sudo systemctl enable powertop.service
echo -ne "Initializing [5 / $a] [60% Complete] \r"

# Make Arch and Internet Faster
sudo touch /etc/sysctl.d/99-sysctl.conf
echo -ne "Initializing [5 / $a] [67% Complete] \r"
sudo -- sh -c "echo net.ipv4.tcp_fastopen = 3 >> /etc/sysctl.d/99-sysctl.conf"
echo -ne "Initializing [5 / $a] [73% Complete] \r"

sudo touch /etc/modules-load.d/kyber
echo -ne "Initializing [5 / $a] [80% Complete] \r"
sudo -- sh -c "echo kyber >> /etc/modules-load.d/kyber"
echo -ne "Initializing [5 / $a] [87% Complete] \r"

# Get CPU & Optimize Sleep States
cpu=$(cat /proc/cpuinfo | grep 'model name' | head -1 | cut -d - -f2 | cut -d ' ' -f1 | cut -c-4)
echo -ne "Initializing [5 / $a] [93% Complete] \r"

if [ "$cpu" -gt 2999 -a $cpu -le 4000 ]; then
  sudo touch /etc/modprobe.d/i915.conf
  sudo -- sh -c "echo options i915 enable_rc6=4 enable_fbc=1 semaphores=1 >> /etc/modprobe.d/i915.conf"
elif [ "$cpu" -gt 1999 -a $cpu -le 3000 ]; then
  sudo touch /etc/modprobe.d/i915.conf
  sudo -- sh -c "echo options i915 enable_rc6=2 enable_fbc=1 semaphores=1 >> /etc/modprobe.d/i915.conf"
else
  sudo touch /etc/modprobe.d/i915.conf
  sudo -- sh -c "echo options i915 enable_rc6=1 enable_fbc=1 semaphores=1 >> /etc/modprobe.d/i915.conf"
fi

echo -ne "Initializing [6 / $a] [00% Complete] \r"

#######################
# Desktop Environment #
#######################

if [ "$env" = "KDE" ]; then

    sudo packer -S --quiet --noconfirm pulseaudio pulseaudio-alsa &>/dev/null
    sudo packer -S --quiet --noconfirm xorg xorg-xinit &>/dev/null
    echo "exec startkde" > ~/.xinitrc
    sudo packer -S --quiet --noconfirm plasma-desktop &>/dev/null
    sudo packer -S --quiet --noconfirm firefox konsole lximage-qt pcmanfm-qt &>/dev/null
    sudo packer -S --quiet --noconfirm sddm sddm-kcm &>/dev/null
    sudo systemctl enable sddm.service
    sudo packer -S --quiet --noconfirm breeze-gtk breeze-kde4 kde-gtk-config &>/dev/null
    sudo packer -S --quiet --noconfirm networkmanager plasma-nm &>/dev/null
    sudo systemctl stop dhcpcd
    sudo systemctl disable dhcpcd
    sudo systemctl stop wpa_supplicant
    sudo systemctl disable wpa_supplicant
    sudo systemctl enable networkmanager
    sudo systemctl start networkmanager
    sudo packer -S --quiet --noconfirm kio kio-extras ark kdegraphics-thumbnailers ffmpegthumbs ffmpegthumbnailer &>/dev/null
    sudo packer -S --quiet --noconfirm wps-office ttf-wps-fonts &>/dev/null
    sudo packer -S --quiet --noconfirm latte-dock qtcurve-gtk2 kvantum-qt5 &>/dev/null
    sudo packer -S --quiet --noconfirm adobe-source-code-pro-fonts otf-fira-code ttf-iosevka-term-ss05 otf-fira-mono otf-hasklig &>/dev/null
    mkdir -p ~/.local/share/plasma/look-and-feel
    cd  ~/.local/share/plasma/look-and-feel && git clone https://github.com/FriedPandaFries/Productiv.git && cd Productiv && rm -rf LICENSE README.md && cd ~
   
    echo -ne "Initializing [6 / $a] [00% Complete] \r"
if [ "$env" = "NONE" ]; then
    echo -ne "Initializing [6 / $a] [00% Complete] \r"
fi


#####################
# Git Repos to Code #
#####################

if [ "$git" = "YES" ]; then
  cd ~/Code
  github=https://github.com/$HUB?tab=repositories
  lynx -listonly -dump -nonumbers $github | grep Fried | grep -v .atom | grep -v tab | grep -v report | tail -n +3

  IFS=$'\n'
  array=($(lynx -listonly -dump -nonumbers $github | grep Fried | grep -v .atom | grep -v tab | grep -v report | tail -n +3))
  unset IFS
  cd ~
  for i in "${array[@]}";
  do
    git clone $i.git
  done

elif [ "$git" = "NO" ]; then
  echo -ne "Initializing [$a / $a] [00% Complete] \r"
fi

############################
# Add To Kernel Parameters #
############################

echo -e "Please Place this in your systemd-boot options /n i915.enable_fbc=0 modprobe.blacklist=pcspkr,bluetooth,btintel,btusb,btrtl,btbcm,uvcvideo scsi_mod.use_blk_mq=1 quiet splash"
echo -e "Get the Mysoru Icon Theme"
echo -e "GTK2 Theme Qtcurve"
echo -e "GTK2 Theme Breeze-Dark"
echo -e "Windows Decorations New Contemporary or Contemporary-Transparent"
echo -e "Widget style Kvantum (Download KV Glass)"
echo -e "Desktop Theme Ktrans"
echo -e "Splash Screen Arc Dark or None"

