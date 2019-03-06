#!/usr/bin/bash
sudo echo -e "${c1}Hello $USER"
echo -e "${c2}What Operating System would you like to put on a USB?${c1}"

mapfile -t my_array1 < <( find ~ -type f -name "*.iso"  | sed -E 's/^(\/.*\/)*(.*)\..*$/\2/' | tr "_" " " )
declare -a my_array1
mapfile -t my_array2 < <( find ~ -type f -name "*.iso")
declare -a my_array2

arr=("${my_array1[@]}" "${my_array2[@]}")

let go=$(( ${#my_array1[@]} + 1))

select n in "${my_array1[@]}" "Nevermind"; do
if [ "$REPLY" -eq "$go" ] 2>/dev/null; then
	echo -e "${c2}You chose to stop"
	sleep 1
	exit
elif [ "$REPLY" != "$go" ] 2>/dev/null; then
	if [ "$REPLY" -lt "$go" ] 2>/dev/null; then
    	echo
    	echo -e "${c2}Operating System\e[1m ${my_array1[$REPLY-1]}\e[0m${c2} selected."
    	invar=${my_array2[$REPLY-1]}
		break
	elif [ "$REPLY" -gt "$go" ] 2>/dev/null; then
		echo -e "${c2}This is not a valid selection"
	elif [ "$REPLY" != "$go" ]; then
		echo -e "${c2}This is not a number"
	fi
fi
done


echo
echo -e "${c1}What USB Drive would you like it to be installed on?"
echo 

mapfile -t my_array3 < <(lsblk -o NAME,SIZE,TYPE,VENDOR | grep -e disk | grep -v ATA)
declare -a my_array3
mapfile -t my_array4 < <(lsblk -o NAME,SIZE,TYPE,VENDOR | grep -e disk | grep -v ATA | awk '{print substr($0,0,3)}')
declare -a my_array4
mapfile -t my_array5 < <(lsblk -o TYPE,VENDOR | grep -e disk | grep -v ATA | cut -c 6-)
declare -a my_array5


arr2=("${my_array3[@]}" "${my_array4[@]}" "${my_array5[@]}")
header=$(lsblk -o NAME,SIZE,TYPE,VENDOR | grep -e NAME | grep -v ATA)

so=$(( ${#my_array3[@]} + 1))
echo -e "${c2}   $header${c1}"

select opt in "${my_array3[@]}" "Nevermind"; do
if [ "$REPLY" -eq "$so" ] 2>/dev/null; then
	echo -e "${c2}You chose to stop"
	sleep 1
	exit
elif [ "$REPLY" != "$so" ] 2>/dev/null; then
	if [ "$REPLY" -lt "$so" ] 2>/dev/null; then
    	echo -e "${c2}The \e[1m ${my_array5[@]}\e[0m${c2}USB drive has been selected.${c1}"
    	outvar=/dev/${my_array4[@]}
		break
	elif [ "$REPLY" -gt "$so" ] 2>/dev/null; then
		echo -e "${c2}This is not a valid selection"
    
	elif [ "$REPLY" != "$so" ]; then
		echo -e "${c2}This is not a number!"
	fi
fi
done

echo





###OPTIONS
#-----------------------CHOOSE ONLY ONE-----------------------------------#
#sudo dd if=$invar bs=4M of=$outvar status=progress oflag=sync
#pv $invar | sudo dd bs=4M of=$outvar status=none oflag=sync -- REQUIRES pv BE INSTALLED
#pv -treb $invar | sudo dd bs=4M of=$outvar status=none oflag=sync conv=notrunc
#pv -n $invar | sudo dd bs=4M of=$outvar status=none oflag=sync 
pv $invar | sudo dd bs=4M of=$outvar status=none oflag=sync


sleep 3
echo
echo -e "${c2}Process complete enjoy your new ""$n"" Live USB!"
sleep 1
speaker-test -p 10 -l 1 >/dev/null


sudo eject $outvar
echo
echo -e "${c1}Your new ""$n"" Live USB can safely be removed."
exit
