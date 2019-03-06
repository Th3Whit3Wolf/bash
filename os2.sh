#!/usr/bin/bash

#str=$(stty size | cut -d " " -f2)
#pbar=$(seq -s- $str|tr -d '[:digit:]')

if test -d ~/OS
then
  :
else
  mkdir ~/OS
fi

Download=()   # ShA256
Download1=()  # SHA1
Download0=()  # No Checksum
Fname=()      # File Name
Check=()      # SHA256
Check1=()     # SHA1
out=()        # Successfully Downloaded and verified
retry=()      # Redownload files that failed SHA256 checksum verification
retry1=()      # Redownload files that failed SHA1 checksum verification

#Ubuntu
#####################################################################################################################################
# get Latest LTS Version of Lubuntu
START=$(date +%s.%3N)
a=22 # Number of Distros in list
p=0

LubuntuV=$(lynx -listonly -nonumbers -dump http://cdimage.ubuntu.com/lubuntu/releases/ | grep .04. | tail -n1 | sed 's/\//\/release/6')
LubuntuLTS=$(lynx -listonly -nonumbers -dump $LubuntuV | grep "desktop-amd64.iso"| grep -v .iso. | tail -n1)
LubuntuLTSV=$( echo $LubuntuLTS | cut -d / -f8)
Lubuntu=$(lynx -listonly -nonumbers -dump http://cdimage.ubuntu.com/lubuntu/releases/ | grep .04. | tail -n1 | sed 's/\//\/release\/SHA256SUMS/6')
LubuntuLTSchk=$(lynx -dump $Lubuntu | grep -B1 desktop-amd64.iso | tail -n2| head -n1 | awk '{print $1 $2}')

END=$(date +%s.%3N)
p=$((p+30))
DIFF=$(echo  "($p)" / "($END - $START)"| bc | cut -c 1-6 )
echo -ne "Initializing [1 / $a] "$DIFF" Operations/s"

# get Latest Version of Lubuntu
LubuntuW=$(lynx -listonly -nonumbers -dump http://cdimage.ubuntu.com/lubuntu/releases/ | sed -n -e '/[1-9]/p' | tail -n1 | sed 's/\//\/release/6')
LubuntuLat=$(lynx -listonly -nonumbers -dump $LubuntuW | grep "desktop-amd64.iso"| grep -v .iso. | tail -n1)
LubuntuLatV=$( echo $LubuntuLat | cut -d / -f8)
Lubuntu1=$(lynx -listonly -nonumbers -dump http://cdimage.ubuntu.com/lubuntu/releases/ | sed -n -e '/[1-9]/p' | tail -n1 | sed 's/\//\/release\/SHA256SUMS/6')
LubuntuLatchk=$(lynx -dump $Lubuntu1 | grep -B1 desktop-amd64.iso | head -n1 | awk '{print $1 $2}')

END=$(date +%s.%3N)
p=$((p+30))
DIFF=$(echo  "($p)" / "($END - $START)"| bc | cut -c 1-6 )
echo -ne "\rInitializing [2 / $a] "$DIFF" Operations/s"

# get Latest LTS Version of Xubuntu
XubuntuV=$(lynx -listonly -nonumbers -dump http://cdimage.ubuntu.com/xubuntu/releases/ | grep .04. | tail -n1 | sed 's/\//\/release/6')
XubuntuLTS=$(lynx -listonly -nonumbers -dump $XubuntuV | grep "desktop-amd64.iso"| grep -v .iso. | tail -n1)
XubuntuLTSV=$( echo $XubuntuLTS | cut -d / -f8)
Xubuntu=$(lynx -listonly -nonumbers -dump http://cdimage.ubuntu.com/xubuntu/releases/ | grep .04. | tail -n1 | sed 's/\//\/release\/SHA256SUMS/6')
XubuntuLTSchk=$(lynx -dump $Xubuntu | grep -B1 desktop-amd64.iso | tail -n2| head -n1 | awk '{print $1 $2}')

END=$(date +%s.%3N)
p=$((p+29))
DIFF=$(echo  "($p)" / "($END - $START)"| bc | cut -c 1-6 )
echo -ne "\rInitializing [3 / $a] "$DIFF" Operations/s"

# get Latest Version of Xubuntu
XubuntuW=$(lynx -listonly -nonumbers -dump http://cdimage.ubuntu.com/xubuntu/releases/ | sed -n -e '/[1-9]/p' | tail -n1 | sed 's/\//\/release/6')
XubuntuLat=$(lynx -listonly -nonumbers -dump $XubuntuW | grep "desktop-amd64.iso"| grep -v .iso. | tail -n1)
XubuntuLatV=$( echo $XubuntuLat | cut -d / -f8)
Xubuntu1=$(lynx -listonly -nonumbers -dump http://cdimage.ubuntu.com/xubuntu/releases/ | sed -n -e '/[1-9]/p' | tail -n1 | sed 's/\//\/release\/SHA256SUMS/6')
XubuntuLatchk=$(lynx -dump $Xubuntu1 | grep -B1 desktop-amd64.iso | head -n1 | awk '{print $1 $2}')

END=$(date +%s.%3N)
p=$((p+29))
DIFF=$(echo  "($p)" / "($END - $START)"| bc | cut -c 1-6 )
echo -ne "\rInitializing [4 / $a] "$DIFF" Operations/s"

# get Latest LTS Version of Kubuntu
KubuntuV=$(lynx -listonly -nonumbers -dump http://cdimage.ubuntu.com/kubuntu/releases/ | grep .04. | tail -n1 | sed 's/\//\/release/6')
KubuntuLTS=$(lynx -listonly -nonumbers -dump $KubuntuV | grep "desktop-amd64.iso"| grep -v .iso. | tail -n1)
KubuntuLTSV=$( echo $KubuntuLTS | cut -d / -f8)
Kubuntu=$(lynx -listonly -nonumbers -dump http://cdimage.ubuntu.com/kubuntu/releases/ | grep .04. | tail -n1 | sed 's/\//\/release\/SHA256SUMS/6')
KubuntuLTSchk=$(lynx -dump $Kubuntu | grep -B1 desktop-amd64.iso | tail -n2| head -n1)

END=$(date +%s.%3N)
p=$((p+30))
DIFF=$(echo  "($p)" / "($END - $START)"| bc | cut -c 1-6 )
echo -ne "\rInitializing [5 / $a] "$DIFF" Operations/s"

# get Latest Version of Kubuntu
KubuntuW=$(lynx -listonly -nonumbers -dump http://cdimage.ubuntu.com/kubuntu/releases/ | sed -n -e '/[1-9]/p' | tail -n1 | sed 's/\//\/release/6')
KubuntuLat=$(lynx -listonly -nonumbers -dump $KubuntuW | grep "desktop-amd64.iso"| grep -v .iso. | tail -n1)
KubuntuLatV=$( echo $KubuntuLat | cut -d / -f8)
Kubuntu1=$(lynx -listonly -nonumbers -dump http://cdimage.ubuntu.com/kubuntu/releases/ | sed -n -e '/[1-9]/p' | tail -n1 | sed 's/\//\/release\/SHA256SUMS/6')
KubuntuLatchk=$(lynx -dump $Kubuntu1 | grep -B1 desktop-amd64.iso | head -n1 | awk '{print $1 $2}')

END=$(date +%s.%3N)
p=$((p+29))
DIFF=$(echo  "($p)" / "($END - $START)"| bc | cut -c 1-6 )
echo -ne "\rInitializing [6 / $a] "$DIFF" Operations/s"

# get Latest LTS Version of Ubuntu
UbuntuV=$(lynx -listonly -nonumbers -dump http://releases.ubuntu.com/ | sed -n -e '/[1-9]/p'  | grep .04 | tail -n1)
UbuntuLTS=$(lynx -listonly -nonumbers -dump $UbuntuV | grep "desktop-amd64.iso"| grep -v .iso. | tail -n1)
UbuntuLTSV=$( echo $UbuntuLTS | cut -d / -f5)
Ubuntu=$(lynx -listonly -nonumbers -dump http://releases.ubuntu.com/ | sed -n -e '/[1-9]/p'  | grep .04 | tail -n1 | sed 's/\//\/SHA256SUMS/4')
UbuntuLTSchk=$(lynx -dump $Ubuntu | grep -B1 desktop-amd64.iso | head -n1 | awk '{print $1 $2}')

END=$(date +%s.%3N)
p=$((p+30))
DIFF=$(echo  "($p)" / "($END - $START)"| bc | cut -c 1-6 )
echo -ne "\rInitializing [7 / $a] "$DIFF" Operations/s"

# get Latest Version of Ubuntu
UbuntuW=$(lynx -listonly -nonumbers -dump http://releases.ubuntu.com/ | sed -n -e '/[1-9]/p' | tail -n1)
UbuntuLat=$(lynx -listonly -nonumbers -dump $UbuntuW | grep "desktop-amd64.iso"| grep -v .iso. | tail -n1)
UbuntuLatV=$( echo $UbuntuLat | cut -d / -f5)
Ubuntu1=$(lynx -listonly -nonumbers -dump http://releases.ubuntu.com/ | sed -n -e '/[1-9]/p' | tail -n1 | sed 's/\//\/SHA256SUMS/4')
UbuntuLatchk=$(lynx -dump $Ubuntu1 | grep -B1 desktop-amd64.iso | head -n1 | awk '{print $1 $2}')

END=$(date +%s.%3N)
p=$((p+30))
DIFF=$(echo  "($p)" / "($END - $START)"| bc | cut -c 1-6 )
echo -ne "\rInitializing [8 / $a] "$DIFF" Operations/s"

# get Latest LTS Version of Ubuntu Server
UbuntuSV=$(lynx -listonly -nonumbers -dump http://releases.ubuntu.com/ | sed -n -e '/[1-9]/p'  | grep .04 | tail -n1)
UbuntuSLTS=$(lynx -listonly -nonumbers -dump $UbuntuV | grep "server-amd64.iso"| grep -v .iso. | tail -n1)
UbuntuSLTSV=$( echo $UbuntuLTS | cut -d / -f5)
UbuntuSLTSchk=$(lynx -dump $Ubuntu | grep -B1 server-amd64.iso | head -n1 | awk '{print $1 $2}')

END=$(date +%s.%3N)
p=$((p+29))
DIFF=$(echo  "($p)" / "($END - $START)"| bc | cut -c 1-6 )
echo -ne "\rInitializing [9 / $a] "$DIFF" Operations/s"

# get Latest Version of Ubuntu Server
UbuntuSW=$(lynx -listonly -nonumbers -dump http://releases.ubuntu.com/ | sed -n -e '/[1-9]/p' | tail -n1)
UbuntuSLat=$(lynx -listonly -nonumbers -dump $UbuntuW | grep "server-amd64.iso"| grep -v .iso. | tail -n1)
UbuntuSLatV=$( echo $UbuntuLat | cut -d / -f5)
UbuntuSLatchk=$(lynx -dump $Ubuntu1 | grep -B1 server-amd64.iso | head -n1 | awk '{print $1 $2}')

END=$(date +%s.%3N)
p=$((p+29))
DIFF=$(echo  "($p)" / "($END - $START)"| bc | cut -c 1-6 )
echo -ne "\rInitializing [10 / $a] "$DIFF" Operations/s"

# get Latest LTS Version of Ubuntu Mate
MubuntuV=$(lynx -listonly -nonumbers -dump http://cdimage.ubuntu.com/ubuntu-mate/releases/ | grep .04. | tail -n1 | sed 's/\//\/release/6')
MubuntuLTS=$(lynx -listonly -nonumbers -dump $MubuntuV | grep "desktop-amd64.iso"| grep -v .iso. | tail -n1)
MubuntuLTSV=$( echo $MubuntuLTS | cut -d / -f8)
Mubuntu=$(lynx -listonly -nonumbers -dump http://cdimage.ubuntu.com/ubuntu-mate/releases/ | grep .04. | tail -n1 | sed 's/\//\/release\/SHA296SUMS/6')
MubuntuLTSchk=$( lynx -dump $Mubuntu | grep -B1 desktop-amd64.iso | tail -n2| head -n1 | awk '{print $1 $2}')

END=$(date +%s.%3N)
p=$((p+30))
DIFF=$(echo  "($p)" / "($END - $START)"| bc | cut -c 1-6 )
echo -ne "\rInitializing [11 / $a] "$DIFF" Operations/s"

# get Latest Version of Ubuntu Mate
MubuntuW=$(lynx -listonly -nonumbers -dump http://cdimage.ubuntu.com/ubuntu-mate/releases/ | sed -n -e '/[1-9]/p' | tail -n1 | sed 's/\//\/release/6')
MubuntuLat=$(lynx -listonly -nonumbers -dump $MubuntuW | grep "desktop-amd64.iso"| grep -v .iso. | tail -n1)
MubuntuLatV=$( echo $MubuntuLat | cut -d / -f8)
Mubuntu1=$(lynx -listonly -nonumbers -dump http://cdimage.ubuntu.com/ubuntu-mate/releases/ | sed -n -e '/[1-9]/p' | tail -n1 | sed 's/\//\/release\/SHA256SUMS/6')
MubuntuLatchk=$( lynx -dump $Mubuntu1 | grep -B1 desktop-amd64.iso | head -n1 | awk '{print $1 $2}')

END=$(date +%s.%3N)
p=$((p+29))
DIFF=$(echo  "($p)" / "($END - $START)"| bc | cut -c 1-6 )
echo -ne "\rInitializing [12 / $a] "$DIFF" Operations/s"

#####################################################################################################################################


#Fedora
#####################################################################################################################################
# get Latest Version of Fedora Workstation
FedoraWS=$(lynx -listonly -nonumbers -dump https://getfedora.org/en/workstation/download/ | grep .iso |grep -v net|head -n1)
FedoraWSV=$( echo $FedoraWS | cut -d / -f12)

END=$(date +%s.%3N)
p=$((p+19))
DIFF=$(echo  "($p)" / "($END - $START)"| bc | cut -c 1-6 )
echo -ne "\rInitializing [13 / $a] "$DIFF" Operations/s"

# get Latest Version of Fedora Server
FedoraS=$(lynx -listonly -nonumbers -dump https://getfedora.org/en/server/download/ | grep .iso |grep -v net |head -n1)
FedoraSV=$( echo $FedoraS | cut -d / -f12)

END=$(date +%s.%3N)
p=$((p+19))
DIFF=$(echo  "($p)" / "($END - $START)"| bc | cut -c 1-6 )
echo -ne "\rInitializing [14 / $a] "$DIFF" Operations/s"

# get Latest Version of Fedora Spin KDE
FedoraKDE=$(lynx -listonly -nonumbers -dump https://spins.fedoraproject.org/kde/download/index.html | grep .iso)
FedoraKDEV=$( echo $FedoraKDE | cut -d / -f12)

END=$(date +%s.%3N)
p=$((p+19))
DIFF=$(echo  "($p)" / "($END - $START)"| bc | cut -c 1-6 )
echo -ne "\rInitializing [15 / $a] "$DIFF" Operations/s"

# get Latest Version of Fedora Spin XFCE
FedoraXFCE=$(lynx -listonly -nonumbers -dump https://spins.fedoraproject.org/xfce/download/index.html | grep .iso)
FedoraXFCEV=$( echo $FedoraXFCE | cut -d / -f12)

END=$(date +%s.%3N)
p=$((p+19))
DIFF=$(echo  "($p)" / "($END - $START)"| bc | cut -c 1-6 )
echo -ne "\rInitializing [16 / $a] "$DIFF" Operations/s"

# get Latest Version of Fedora Spin LXQT
FedoraLXQT=$(lynx -listonly -nonumbers -dump https://spins.fedoraproject.org/lxqt/download/index.html | grep .iso)
FedoraLXQTV=$( echo $FedoraLXQT | cut -d / -f12)

END=$(date +%s.%3N)
p=$((p+19))
DIFF=$(echo  "($p)" / "($END - $START)"| bc | cut -c 1-6 )
echo -ne "\rInitializing [17 / $a] "$DIFF" Operations/s"

# get Latest Version of Fedora Spin Mate-Compiz
FedoraMC=$(lynx -listonly -nonumbers -dump https://spins.fedoraproject.org/mate-compiz/download/index.html | grep .iso)
FedoraMCV=$( echo $FedoraMC | cut -d / -f12)

END=$(date +%s.%3N)
p=$((p+19))
DIFF=$(echo  "($p)" / "($END - $START)"| bc | cut -c 1-6 )
echo -ne "\rInitializing [18 / $a] "$DIFF" Operations/s"

# get Latest Version of Fedora Spin Cinnamon
FedoraCin=$(lynx -listonly -nonumbers -dump https://spins.fedoraproject.org/cinnamon/download/index.html | grep .iso)
FedoraCinV=$( echo $FedoraCin | cut -d / -f12)

END=$(date +%s.%3N)
p=$((p+19))
DIFF=$(echo  "($p)" / "($END - $START)"| bc | cut -c 1-6 )
echo -ne "\rInitializing [19 / $a] "$DIFF" Operations/s"

# get Latest Version of Fedora Spin LXDE
FedoraLXDE=$(lynx -listonly -nonumbers -dump https://spins.fedoraproject.org/lxde/download/index.html | grep .iso)
FedoraLXDEV=$( echo $FedoraLXDE | cut -d / -f12)

END=$(date +%s.%3N)
p=$((p+19))
DIFF=$(echo  "($p)" / "($END - $START)"| bc | cut -c 1-6 )
echo -ne "\rInitializing [20 / $a] "$DIFF" Operations/s"

# get Latest Version of Fedora Spin Soas
FedoraSOAS=$(lynx -listonly -nonumbers -dump https://spins.fedoraproject.org/soas/download/index.html | grep .iso)
FedoraSOASV=$( echo $FedoraSOAS | cut -d / -f12)

END=$(date +%s.%3N)
p=$((p+24))
DIFF=$(echo  "($p)" / "($END - $START)"| bc | cut -c 1-6 )
echo -ne "\rInitializing [21 / $a] "$DIFF" Operations/s"

# get Latest Version of Arch Linux
Arch=$(lynx -listonly -nonumbers -dump http://mirrors.kernel.org/archlinux/iso/latest/ | grep -v .sig | grep -v .torrent | grep 64.iso)
Arch1=$(lynx -listonly -nonumbers -dump http://mirrors.kernel.org/archlinux/iso/latest/ | grep sha1sums.txt )
Archk=$(lynx -dump $Arch1 | head -n1 | cut -d " " -f1)
ArchV=$( echo $Arch | cut -d / -f7)

END=$(date +%s.%3N)
p=$((p+17))
Time=$(echo "($END - $START)" | bc | cut -c 1-6 )
DIFF=$(echo  "($p)" / "($END - $START)"| bc | cut -c 1-6 )
echo -e "Initialization Finished in "$Time"s" "\nAverage Speed "$DIFF" Operations/s"

if test -f ~/OS/$LubuntuLTSV
then
  :
else
  Download+=($LubuntuLTS)
  Fname+=($LubuntuLTSV)
  Check+=($LubuntuLTSchk)
fi

if test -f ~/OS/$LubuntuLatV
then
  :
else
  Download+=($LubuntuLat)
  Fname+=($LubuntuLatV)
  Check+=($LubuntuLatchk)
fi

if test -f ~/OS/$XubuntuLTSV
then
  :
else
  Download+=($XubuntuLTS)
  Fname+=($XubuntuLTSV)
  Check+=($XubuntuLTSchk)
fi

if test -f ~/OS/$XubuntuLatV
then
  :
else
  Download+=($XubuntuLat)
  Fname+=($XubuntuLatV)
  Check+=($XubuntuLatchk)
fi

if test -f ~/OS/$KubuntuLTSV
then
  :
else
  Download+=($KubuntuLTS)
  Fname+=($KubuntuLTSV)
  Check+=($KubuntuLTSchk)
fi

if test -f ~/OS/$KubuntuLatV
then
  :
else
  Download+=($KubuntuLat)
  Fname+=($KubuntuLatV)
  Check+=($KubuntuLatchk)
fi

if test -f ~/OS/$UbuntuLTSV
then
  :
else
  Download+=($UbuntuLTS)
  Fname+=($UbuntuLTSV)
  Check+=($UbuntuLTSchk)
fi

if test -f ~/OS/$UbuntuLatV
then
  :
else
  Download+=($UbuntuLat)
  Fname+=($UbuntuLatV)
  Check+=($UbuntuLatchk)
fi

if test -f ~/OS/$UbuntuSLTSV
then
  :
else
  Download+=($UbuntuSLTS)
  Fname+=($UbuntuSLTSV)
  Check+=($UbuntuSLTSchk)
fi

if test -f ~/OS/$UbuntuSLatV
then
  :
else
  Download+=($UbuntuSLat)
  Fname+=($UbuntuSLatV)
  Check+=($UbuntuSLatchk)
fi

if test -f ~/OS/$MubuntuLTSV
then
  :
else
  Download+=($MubuntuLTS)
  Fname+=($MubuntuLTSV)
  Check+=($MubuntuLTSchk)
fi

if test -f ~/OS/$MubuntuLatV
then
  :
else
  Download+=($MubuntuLat)
  Fname+=($MubuntuLatV)
  Check+=($MubuntuLatchk)
fi


if test -f ~/OS/$FedoraWSV
then
  :
else
  Download0+=($FedoraWS)
fi

if test -f ~/OS/$FedoraSV
then
  :
else
  Download0+=($FedoraS)
fi

if test -f ~/OS/$FedoraKDEV
then
  :
else
  Download0+=($FedoraKDE)
fi

if test -f ~/OS/$FedoraXFCEV
then
  :
else
  Download0+=($FedoraXFCE)
fi

if test -f ~/OS/Fedora/$FedoraLXQTV
then
  :
else
  Download0+=($FedoraLXQT)
fi

if test -f ~/OS/$FedoraMCV
then
  :
else
  Download0+=($FedoraMC)
fi

if test -f ~/OS/$FedoraCinV
then
  :
else
  Download0+=($FedoraCin)
fi

if test -f ~/OS/$FedoraLXDEV
then
  :
else
  Download0+=($FedoraLXDE)
fi

if test -f ~/OS/$FedoraSOASV
then
  :
else
  Download0+=($FedoraSOAS)
fi

if test -f ~/OS/$ArchV
then
  :
else
  Download1+=($Arch)
  Fname+=($ArchV)
  Check1+=($Archk)
fi
#########################################################################################################

#arr=("${Download[@]}" "${Fname[@]}" "${Check[@]}")

cd ~/OS
#echo ${Download[@]}
#echo ${Check[@]}
#echo ${Fname[@]}
#echo ${Download1[@]}
aria2c -Z --stderr ${Download[@]} ${Download1[@]} ${Download0[@]}

for i in ${Download[@]}
do
  if [[ $(sha256sum -c $( echo ${Fname[i]})) = $( echo ${Check[i]}) ]]
  then
    out+=($(${Fname[i]} | tr "-" " " | sed 's/amd64.iso//' | awk '{for(i=1;i<=NF;i++){ $i=toupper(substr($i,1,1)) substr($i,2) }}1'))
  else
    retry+=(${Download[i]})
  fi
done

for i in ${Download1[@]}
do
  if [[ $(sha1sum -c ${Fname[i]}) = ${Check1[i]} ]]
  then
    out+=($(${Fname[i]} | sed 's/h/h /' | sed 's/-/ Version /' | awk '{for(i=1;i<=NF;i++){ $i=toupper(substr($i,1,1)) substr($i,2) }}1'))
  else
    retry1+=(${Download[i]})
  fi
done

# Make if then if add to download array into a function
# Make a while loop calling that function
# while retry array greater than 0 or z = 5
# In loop make increment z




for i in ${out[@]} do
  echo ${out[i]} " Downloaded Successfully!"
done
echo "All Operating Systems are up to date."
sleep 1
exit
