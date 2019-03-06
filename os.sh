#!/usr/bin/bash

str=$(stty size | cut -d " " -f2)
pbar=$(seq -s- $str|tr -d '[:digit:]')

fi
if test -d ~/OS
then
  :
else
  mkdir ~/OS
fi
if test -d ~/OS/Ubuntu
then
  :
else
  mkdir ~/OS/Ubuntu
fi
if test -d ~/OS/Fedora
then
  :
else
  mkdir ~/OS/Fedora
fi


#Ubuntu
#####################################################################################################################################
# get Latest LTS Version of Lubuntu
LubuntuV=$(lynx -listonly -nonumbers -dump http://cdimage.ubuntu.com/lubuntu/releases/ | grep .04. | tail -n1 | sed 's/\//\/release/6')
LubuntuLTS=$(lynx -listonly -nonumbers -dump $LubuntuV | grep "desktop-amd64.iso"| grep -v .iso. | tail -n1)
LubuntuLTSV=$( echo $LubuntuLTS | cut -d / -f8)
LubuntuLTSinfo=$( echo $LubuntuLTSV | cut -d - -f1-2 | awk '{print toupper(substr($0,0,1))tolower(substr($0,2))}' | sed 's/-/ Version /' )

# get Latest Version of Lubuntu
LubuntuW=$(lynx -listonly -nonumbers -dump http://cdimage.ubuntu.com/lubuntu/releases/ | sed -n -e '/[1-9]/p' | tail -n1 | sed 's/\//\/release/6')
LubuntuLat=$(lynx -listonly -nonumbers -dump $LubuntuW | grep "desktop-amd64.iso"| grep -v .iso. | tail -n1)
LubuntuLatV=$( echo $LubuntuLat | cut -d / -f8)
LubuntuLatinfo=$( echo $LubuntuLatinfo cut -d - -f1-2 | awk '{print toupper(substr($0,0,1))tolower(substr($0,2))}' | sed 's/-/ Version /')

# get Latest LTS Version of Xubuntu
XubuntuV=$(lynx -listonly -nonumbers -dump http://cdimage.ubuntu.com/xubuntu/releases/ | grep .04. | tail -n1 | sed 's/\//\/release/6')
XubuntuLTS=$(lynx -listonly -nonumbers -dump $XubuntuV | grep "desktop-amd64.iso"| grep -v .iso. | tail -n1)
XubuntuLTSV=$( echo $XubuntuLTS | cut -d / -f8)
XubuntuLTSinfo=$( echo $XubuntuLTSV | cut -d - -f1-2 | awk '{print toupper(substr($0,0,1))tolower(substr($0,2))}' | sed 's/-/ Version /' )

# get Latest Version of Xubuntu
XubuntuW=$(lynx -listonly -nonumbers -dump http://cdimage.ubuntu.com/xubuntu/releases/ | sed -n -e '/[1-9]/p' | tail -n1 | sed 's/\//\/release/6')
XubuntuLat=$(lynx -listonly -nonumbers -dump $XubuntuW | grep "desktop-amd64.iso"| grep -v .iso. | tail -n1)
XubuntuLatV=$( echo $XubuntuLat | cut -d / -f8)
XubuntuLatinfo=$( echo $XubuntuLatinfo | cut -d - -f1-2 | awk '{print toupper(substr($0,0,1))tolower(substr($0,2))}' | sed 's/-/ Version /')

# get Latest LTS Version of Kubuntu
KubuntuV=$(lynx -listonly -nonumbers -dump http://cdimage.ubuntu.com/kubuntu/releases/ | grep .04. | tail -n1 | sed 's/\//\/release/6')
KubuntuLTS=$(lynx -listonly -nonumbers -dump $KubuntuV | grep "desktop-amd64.iso"| grep -v .iso. | tail -n1)
KubuntuLTSV=$( echo $KubuntuLTS | cut -d / -f8)
KubuntuLTSinfo=$( echo $KubuntuLTSV | cut -d - -f1-2 | awk '{print toupper(substr($0,0,1))tolower(substr($0,2))}' | sed 's/-/ Version /' )

# get Latest Version of Kubuntu
KubuntuW=$(lynx -listonly -nonumbers -dump http://cdimage.ubuntu.com/kubuntu/releases/ | sed -n -e '/[1-9]/p' | tail -n1 | sed 's/\//\/release/6')
KubuntuLat=$(lynx -listonly -nonumbers -dump $KubuntuW | grep "desktop-amd64.iso"| grep -v .iso. | tail -n1)
KubuntuLatV=$( echo $KubuntuLat | cut -d / -f8)
KubuntuLatinfo=$( echo $KubuntuLatinfo | cut -d - -f1-2 | awk '{print toupper(substr($0,0,1))tolower(substr($0,2))}' | sed 's/-/ Version /')

# get Latest LTS Version of Ubuntu
UbuntuV=$(lynx -listonly -nonumbers -dump http://releases.ubuntu.com/ | sed -n -e '/[1-9]/p'  | grep .04 | tail -n1)
UbuntuLTS=$(lynx -listonly -nonumbers -dump $UbuntuV | grep "desktop-amd64.iso"| grep -v .iso. | tail -n1)
UbuntuLTSV=$( echo $UbuntuLTS | cut -d / -f5)
UbuntuLTSinfo=$( echo $UbuntuLTSV | cut -d - -f1-2 | awk '{print toupper(substr($0,0,1))tolower(substr($0,2))}' | sed 's/-/ Version /' )

# get Latest Version of Ubuntu
UbuntuW=$(lynx -listonly -nonumbers -dump http://releases.ubuntu.com/ | sed -n -e '/[1-9]/p' | tail -n1)
UbuntuLat=$(lynx -listonly -nonumbers -dump $UbuntuW | grep "desktop-amd64.iso"| grep -v .iso. | tail -n1)
UbuntuLatV=$( echo $UbuntuLat | cut -d / -f5)
UbuntuLatinfo=$( echo $UbuntuLatinfo | cut -d - -f1-2 | awk '{print toupper(substr($0,0,1))tolower(substr($0,2))}' | sed 's/-/ Version /')

# get Latest LTS Version of Ubuntu Server
UbuntuSV=$(lynx -listonly -nonumbers -dump http://releases.ubuntu.com/ | sed -n -e '/[1-9]/p'  | grep .04 | tail -n1)
UbuntuSLTS=$(lynx -listonly -nonumbers -dump $UbuntuV | grep "server-amd64.iso"| grep -v .iso. | tail -n1)
UbuntuSLTSV=$( echo $UbuntuLTS | cut -d / -f5)
UbuntuSLTSinfo=$( echo $UbuntuLTSV | cut -d - -f1-2 | awk '{print toupper(substr($0,0,1))tolower(substr($0,2))}' | sed 's/-/ Server Version /' )

# get Latest Version of Ubuntu Server
UbuntuSW=$(lynx -listonly -nonumbers -dump http://releases.ubuntu.com/ | sed -n -e '/[1-9]/p' | tail -n1)
UbuntuSLat=$(lynx -listonly -nonumbers -dump $UbuntuW | grep "server-amd64.iso"| grep -v .iso. | tail -n1)
UbuntuSLatV=$( echo $UbuntuLat | cut -d / -f5)
UbuntuSLatinfo=$( echo $UbuntuLatinfo | cut -d - -f1-2 | awk '{print toupper(substr($0,0,1))tolower(substr($0,2))}' | sed 's/-/ Server Version /')

# get Latest LTS Version of Ubuntu Mate
MubuntuV=$(lynx -listonly -nonumbers -dump http://cdimage.ubuntu.com/ubuntu-mate/releases/ | grep .04. | tail -n1 | sed 's/\//\/release/6')
MubuntuLTS=$(lynx -listonly -nonumbers -dump $MubuntuV | grep "desktop-amd64.iso"| grep -v .iso. | tail -n1)
MubuntuLTSV=$( echo $MubuntuLTS | cut -d / -f8)
MubuntuLTSinfo=$( echo $MubuntuLTSV | cut -d - -f1-3 | sed 's/-/ /g' |awk '{for (i=1; i<=NF; ++i) { $i=toupper(substr($i,1,1)) tolower(substr($i,2)); } print }' )

# get Latest Version of Ubuntu Mate
MubuntuW=$(lynx -listonly -nonumbers -dump http://cdimage.ubuntu.com/ubuntu-mate/releases/ | sed -n -e '/[1-9]/p' | tail -n1 | sed 's/\//\/release/6')
MubuntuLat=$(lynx -listonly -nonumbers -dump $MubuntuW | grep "desktop-amd64.iso"| grep -v .iso. | tail -n1)
MubuntuLatV=$( echo $MubuntuLat | cut -d / -f8)
MubuntuLatinfo=$( echo $MubuntuLatinfo | cut -d - -f1-3 | sed 's/-/ /g' |awk '{for (i=1; i<=NF; ++i) { $i=toupper(substr($i,1,1)) tolower(substr($i,2)); } print }' )

cd ~/OS/Ubuntu

if test -f ~/OS/Ubuntu/$LubuntuLTSV
then
  echo "Lubuntu LTS is up to date"
else
  echo "Now Downloading $LubuntuLTSinfo"
  echo $pbar
  wget -q $LubuntuLTS --show-progress
  echo "Lubuntu LTS is now up to date"
fi

if test -f ~/OS/Ubuntu/$LubuntuLatV
then
  echo "Lubuntu Latest is up to date"
else
  echo "Now Downloading $LubuntuLatinfo"
  echo $pbar
  wget -q $LubuntuLat --show-progress
  echo "Lubuntu Latest is now up to date"
fi

if test -f ~/OS/Ubuntu/$XubuntuLTSV
then
  echo "Xubuntu LTS is up to date"
else
  echo "Now Downloading $XubuntuLTSinfo"
  echo $pbar
  wget -q $XubuntuLTS --show-progress
  echo "Xubuntu LTS is now up to date"
fi

if test -f ~/OS/Ubuntu/$XubuntuLatV
then
  echo "Xubuntu Latest is up to date"
else
  echo "Now Downloading $XubuntuLatinfo"
  echo $pbar
  wget -q $XubuntuLat --show-progress
  echo "Xubuntu Latest is now up to date"
fi

if test -f ~/OS/Ubuntu/$KubuntuLTSV
then
  echo "Kubuntu LTS is up to date"
else
  echo "Now Downloading $KubuntuLTSinfo"
  echo $pbar
  wget -q $KubuntuLTS --show-progress
  echo "Kubuntu LTS is now up to date"
fi

if test -f ~/OS/Ubuntu/$KubuntuLatV
then
  echo "Kubuntu Latest is up to date"
else
  echo "Now Downloading $KubuntuLatinfo"
  echo $pbar
  wget -q $KubuntuLat --show-progress
  echo "Kubuntu Latest is now up to date"
fi

if test -f ~/OS/Ubuntu/$UbuntuLTSV
then
  echo "Ubuntu LTS is up to date"
else
  echo "Now Downloading $UbuntuLTSinfo"
  echo $pbar
  wget -q $UbuntuLTS --show-progress
  echo "Ubuntu LTS is now up to date"
fi

if test -f ~/OS/Ubuntu/$UbuntuLatV
then
  echo "Ubuntu Latest is up to date"
else
  echo "Now Downloading $UbuntuLatinfo"
  echo $pbar
  wget -q $UbuntuLat --show-progress
  echo "Ubuntu Latest is now up to date"
fi

if test -f ~/OS/Ubuntu/$UbuntuSLTSV
then
  echo "Ubuntu Server LTS is up to date"
else
  echo "Now Downloading $UbuntuSLTSinfo"
  echo $pbar
  wget -q $UbuntuSLTS --show-progress
  echo "Ubuntu Server LTS is now up to date"
fi

if test -f ~/OS/Ubuntu/$UbuntuSLatV
then
  echo "Ubuntu Server Latest is up to date"
else
  echo "Now Downloading $UbuntuSLatinfo"
  echo $pbar
  wget -q $UbuntuSLat --show-progress
  echo "Ubuntu Latest is now up to date"
fi

if test -f ~/OS/Ubuntu/$MubuntuLTSV
then
  echo "Ubuntu Mate LTS is up to date"
else
  echo "Now Downloading $MubuntuLTSinfo"
  echo $pbar
  wget -q $MubuntuLTS --show-progress
  echo "Ubuntu Mate LTS is now up to date"
fi

if test -f ~/OS/Ubuntu/$MubuntuLatV
then
  echo "Ubuntu Mate Latest is up to date"
else
  echo "Now Downloading $MubuntuLatinfo"
  echo $pbar
  wget -q $MubuntuLat --show-progress
  echo "Ubuntu Mate Latest is now up to date"
fi

cd ~
#####################################################################################################################################


#Fedora
#####################################################################################################################################
# get Latest Version of Fedora Workstation
FedoraWS=$(lynx -listonly -nonumbers -dump https://getfedora.org/en/workstation/download/ | grep .iso |grep -v net|head -n1)
FedoraWSV=$( echo $FedoraWS | cut -d / -f12)
FedoraWSS=$( echo $FedoraWSV | cut -d - -f1-9 | sed 's/-Live-x86_64-/ /' | cut -d - -f1-2 | tr "-" " ")

# get Latest Version of Fedora Server
FedoraS=$(lynx -listonly -nonumbers -dump https://getfedora.org/en/server/download/ | grep .iso |grep -v net |head -n1)
FedoraSV=$( echo $FedoraS | cut -d / -f12)
FedoraSS=$( echo $FedoraSV | cut -d - -f1-9 | sed 's/-dvd-x86_64-/ /' | cut -d - -f1-2 | tr "-" " ")

# get Latest Version of Fedora Spin KDE
FedoraKDE=$(lynx -listonly -nonumbers -dump https://spins.fedoraproject.org/kde/download/index.html | grep .iso)
FedoraKDEV=$( echo $FedoraKDE | cut -d / -f12)
FedoraKDES=$( echo $FedoraKDEV | sed 's/-Live-x86_64-/ /' | cut -d - -f1-2 | tr "-" " ")

# get Latest Version of Fedora Spin XFCE
FedoraXFCE=$(lynx -listonly -nonumbers -dump https://spins.fedoraproject.org/xfce/download/index.html | grep .iso)
FedoraXFCEV=$( echo $FedoraXFCE | cut -d / -f12)
FedoraXFCES=$( echo $FedoraXFCEV | sed 's/-Live-x86_64-/ /' | cut -d - -f1-2 | tr "-" " ")

# get Latest Version of Fedora Spin LXQT
FedoraLXQT=$(lynx -listonly -nonumbers -dump https://spins.fedoraproject.org/lxqt/download/index.html | grep .iso)
FedoraLXQTV=$( echo $FedoraLXQT | cut -d / -f12)
FedoraLXQTS=$( echo $FedoraLXQTV | sed 's/-Live-x86_64-/ /' | cut -d - -f1-2 | tr "-" " ")

# get Latest Version of Fedora Spin Mate-Compiz
FedoraMC=$(lynx -listonly -nonumbers -dump https://spins.fedoraproject.org/mate-compiz/download/index.html | grep .iso)
FedoraMCV=$( echo $FedoraMC | cut -d / -f12)
FedoraMCS=$( echo $FedoraMCV | sed 's/-Live-x86_64-/ /' | cut -d - -f1-2 | tr "-" " " | tr "_" " ")

# get Latest Version of Fedora Spin Cinnamon
FedoraCin=$(lynx -listonly -nonumbers -dump https://spins.fedoraproject.org/cinnamon/download/index.html | grep .iso)
FedoraCinV=$( echo $FedoraCin | cut -d / -f12)
FedoraCinS=$( echo $FedoraCinV | sed 's/-Live-x86_64-/ /' | cut -d - -f1-2 | tr "-" " ")

# get Latest Version of Fedora Spin LXDE
FedoraLXDE=$(lynx -listonly -nonumbers -dump https://spins.fedoraproject.org/lxde/download/index.html | grep .iso)
FedoraLXDEV=$( echo $FedoraLXDE | cut -d / -f12)
FedoraLXDES=$( echo $FedoraLXDES | sed 's/-Live-x86_64-/ /' | cut -d - -f1-2 | tr "-" " ")

# get Latest Version of Fedora Spin Soas
FedoraSOAS=$(lynx -listonly -nonumbers -dump https://spins.fedoraproject.org/soas/download/index.html | grep .iso)
FedoraSOASV=$( echo $FedoraSOAS | cut -d / -f12)
FedoraSOASS=$( echo $FedoraSOASV  | sed 's/-Live-x86_64-/ /' | cut -d - -f1-2 | tr "-" " ")


cd ~/OS/Fedora

if test -f ~/OS/Fedora/$FedoraWSV
then
  echo "Fedora Workstation is up to date"
else
  echo "Now Downloading $FedoraWSS"
  echo $pbar
  wget -q $FedoraWS --show-progress
  echo "Fedora Workstation is now up to date"
fi

if test -f ~/OS/Fedora/$FedoraSV
then
  echo "Fedora Server is up to date"
else
  echo "Now Downloading $FedoraSS"
  echo $pbar
  wget -q $FedoraS --show-progress
  echo "Fedora Server is now up to date"
fi

if test -f ~/OS/Fedora/$FedoraKDEV
then
  echo "Fedora Server is up to date"
else
  echo "Now Downloading $FedoraKDES"
  echo $pbar
  wget -q $FedoraKDE --show-progress
  echo "Fedora Server is now up to date"
fi

if test -f ~/OS/Fedora/$FedoraXFCEV
then
  echo "Fedora Server is up to date"
else
  echo "Now Downloading $FedoraXFCES"
  echo $pbar
  wget -q $FedoraXFCE --show-progress
  echo "Fedora Server is now up to date"
fi

if test -f ~/OS/Fedora/$FedoraLXQTV
then
  echo "Fedora Server is up to date"
else
  echo "Now Downloading $FedoraLXQTS"
  echo $pbar
  wget -q $FedoraLXQT --show-progress
  echo "Fedora Server is now up to date"
fi

if test -f ~/OS/Fedora/$FedoraMCV
then
  echo "Fedora Server is up to date"
else
  echo "Now Downloading $FedoraMCS"
  echo $pbar
  wget -q $FedoraMC --show-progress
  echo "Fedora Server is now up to date"
fi

if test -f ~/OS/Fedora/$FedoraCinV
then
  echo "Fedora Server is up to date"
else
  echo "Now Downloading $FedoraCinS"
  echo $pbar
  wget -q $FedoraCin --show-progress
  echo "Fedora Server is now up to date"
fi

if test -f ~/OS/Fedora/$FedoraLXDEV
then
  echo "Fedora Server is up to date"
else
  echo "Now Downloading $FedoraLXDES"
  echo $pbar
  wget -q $FedoraLXDE --show-progress
  echo "Fedora Server is now up to date"
fi

if test -f ~/OS/Fedora/$FedoraSOASV
then
  echo "Fedora Server is up to date"
else
  echo "Now Downloading $FedoraSOASS"
  echo $pbar
  wget -q $FedoraSOAS --show-progress
  echo "Fedora Server is now up to date"
fi

cd ~
#####################################################################################################################################
