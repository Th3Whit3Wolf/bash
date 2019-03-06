#!/bin/bash

usage(){
	echo 'Usage: compare [options] "test 1" "test 2"'
	echo "Description: Runs executable x number of times and gets the average to specified precision."
	echo "Default value for number of test: 100"
	echo "Default value for precision 3"
	echo
	echo "Options"
	echo "-1                           allows for testing of a single executable"
	echo "-2                           allows for testing of two shell commands"
	echo "-c                           just a simple comparison of two shell commands"
	echo "-h, --help, -?               prints this information"
	echo "-s                           allows for a single shell commands to be taken as input in"
		return 1
	}

case $1 in
	./*)
		echo "./ is not needed"
	;;

	-1)
		if [[ -x "$PWD$1" ]]; then
				if [[ -z $2 ]]; then
					var=100
				else
					var=$2
				fi
				if [ -z $3 ]; then
					prec=3
				else
					prec=$3
				fi
				START=$(date +%s.%6N)
				for (( i = 1; i <= $var; i++ )); do ./$1 &>/dev/null; done
				END=$(date +%s.%6N)
				DIFF=$(echo "scale=$prec; ($END - $START)/$var*1000"| bc -l )

				echo
				echo "---------------------------------------"
				echo
				echo "The average time of $1 was" $DIFF"ms"
				echo
				echo "---------------------------------------"
				echo
		else
			echo "$2 is not executable!"
		fi
		;;
	-2)
		if [[ -z $2 ]] || [[ -z $3 ]]; then
			echo "Need two commands in quotes"
		else
			if [ -z $4 ]; then
				var=100
			else
				var=$4
			fi
			if [ -z $5 ]; then
				prec=3
			else
				prec=$5
			fi

			clear
			echo "Initiating first test..."
			echo

			START=$(date +%s.%6N)
			for (( i = 1; i <= $var; i++ )); do $2 &>/dev/null; done
			END=$(date +%s.%6N)
			DIFF=$(echo "scale=$prec; ($END - $START)/$var*1000"| bc -l )

			echo
			echo "---------------------------------------"
			echo
			echo "The average time of $2 was" $DIFF"ms"
			echo
			echo "---------------------------------------"
			echo
			echo
			echo "Initiating second test..."
			echo

			START2=$(date +%s.%6N)
			for (( i = 1; i <= $var; i++ )); do $3 &>/dev/null; done
			END2=$(date +%s.%6N)
			DIFF2=$(echo "scale=$prec; ($END2 - $START2)/$var*1000"| bc -l )

			echo
			echo "---------------------------------------"
			echo
			echo "The average time of $3 was" $DIFF2"ms"
			echo
			echo "---------------------------------------"
			echo

		fi
		;;

	-c )
	if [[ -z $2 ]] || [[ -z $3 ]]; then
		echo "Need two commands in quotes"
	else
		if [ -z $4 ]; then
			prec=3
		else
			prec=$4
		fi

		clear
		echo "Initiating first test..."
		echo
		echo "$2"
		echo

		START=$(date +%s.%6N)
		for (( i = 1; i <= 1; i++ )); do $2; done
		END=$(date +%s.%6N)
		DIFF=$(echo "scale=$prec; ($END - $START)/1*1000"| bc -l )

		echo
		echo "---------------------------------------"
		echo
		echo "The average time of $2 was" $DIFF"ms"
		echo
		echo "---------------------------------------"
		echo
		echo
		echo "Initiating second test..."
		echo
		echo "$3"
		echo

		START2=$(date +%s.%6N)
		for (( i = 1; i <= 1; i++ )); do $3; done
		END2=$(date +%s.%6N)
		DIFF2=$(echo "scale=$prec; ($END2 - $START2)/1*1000"| bc -l )

		echo
		echo "---------------------------------------"
		echo
		echo "The average time of $3 was" $DIFF2"ms"
		echo
		echo "---------------------------------------"
		echo

		echo
		echo "First command output.."
		echo
		$2

		echo
		echo "Second command output.."
		echo
		$3
		echo
	fi
		;;

	-b | --build )
		clear
		cargo clean
		sleep 1
		clear
		echo "Initiating debug build..."

		START=$(date +%s.%6N)
		for (( i = 1; i <= 1; i++ )); do cargo build -qZ config-profile; done
		END=$(date +%s.%6N)
		DIFF=$(echo "scale=3; ($END - $START)"| bc -l )

		echo "---------------------------------------"
		echo
		echo "Debug build time was" $DIFF" seconds"
		echo
		echo "---------------------------------------"
		echo
		echo "Initiating release build..."

		START2=$(date +%s.%6N)
		for (( i = 1; i <= 1; i++ )); do cargo build --release -qZ config-profile; done
		END2=$(date +%s.%6N)
		DIFF2=$(echo "scale=3; ($END2 - $START2)"| bc -l )

		echo "---------------------------------------"
		echo
		echo "Release build time was" $DIFF2" seconds"
		echo
		echo "---------------------------------------"
		echo

		echo "Initiating debug build..."

		START=$(date +%s.%6N)
		for (( i = 1; i <= 1; i++ )); do cargo test -qZ config-profile; done
		END=$(date +%s.%6N)
		DIFF=$(echo "scale=3; ($END - $START)"| bc -l )

		echo "---------------------------------------"
		echo
		echo "Debug test build time was" $DIFF" seconds"
		echo
		echo "---------------------------------------"
		echo
		echo "Initiating release build..."

		START2=$(date +%s.%6N)
		for (( i = 1; i <= 1; i++ )); do cargo test --release -qZ config-profile; done
		END2=$(date +%s.%6N)
		DIFF2=$(echo "scale=3; ($END2 - $START2)"| bc -l )

		echo "---------------------------------------"
		echo
		echo "Release test build time was" $DIFF2" seconds"
		echo
		echo "---------------------------------------"

		;;

	-h | --help | -? )
		usage
		;;

	* )
		usage
		;;
	esac
