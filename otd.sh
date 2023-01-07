#!/bin/bash

#################################################
#						#
# 	       					#
#						#
# 	       Developed by Ali M		#
#						#
#	 His Email: gameali774@gmail.com	#
#						#
#	   He is too lazy to be true!		#
#						#
#						#
#						#
#################################################

echo "Please choose an option: " 
select option in show save exit
do
	case $option in
		save)
			echo "Enter your Embedded links: " && cat > otd.txt
			grep -Po "https://[^']+" otd.txt | cut -d"\"" -f1 | sed -i "s/embed/download/" | sed -i '/</d';;
		show)
			echo "Enter your Embedded links: " && cat > otd.txt
                        grep -Po "https://[^']+" otd.txt | cut -d"\"" -f1 | sed -e "s/embed/download/" | sed -e '/</d'
			rm -rf ./otd.txt;;
		send)	
			while [ "$(wc -l otd.txt)" != "0" ]
			do
				read -rp "Please enter your emmail within "": " MAIL
				echo "Subject: Your download links comin n HOT!!"
				msmtp "$MAIL" < otd.txt
			done;;
		exit)
           		break;;
	esac
done

