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

PS3="Please choose an option: " 
OPT=("Save them"  "show them" "Send them" "Quit" "Help")
select OPTION in "${OPT[@]}"
do
	case $OPTION in
		"Save them")
			echo "Enter your Embedded links: " && cat > otd.txt
			grep -Po "https://[^']+" otd.txt | cut -d"\"" -f1 | sed "s/embed/download/" >> otd.txt
			if sed -i '/</d' otd.txt "0"
			then 
				echo "The Links have been successfully made!"
			else 
				echo "Due to the error the links couldn'd be made!"
			fi;;
		"show them")
			echo "Enter your Embedded links: " && cat > otd.txt
			echo "Here are your links: "
                        grep -Po "https://[^']+" otd.txt | cut -d"\"" -f1 | sed "s/embed/download/" | sed -e '/</d'
			rm -rf ./otd.txt;;
		"Send them")	
			while [ "$(wc -l otd.txt)" != "0" ]
			do
				read -rp "Please enter your email within \"\": " MAIL
				echo "Subject: Your download links comin n HOT!!" >> otd.txt
				if msmtp "$MAIL" < otd.txt "0"
				then 
					echo "The links have been sent!"
				else 
					echo "Due to the error the links couldn'd be sent!"
				fi
			done;;
		"Quit")
           		break;;
		"Help")
			echo "This bash will turn the link of your files in One Drive to a direct link so that you can directly download them in whatever downloader you want!

To get it to work you're going to have to go to your onedrive and select your desired file. Then click on embed button. It will ask you to generate the HTML code, just generate it! At last, copy the piece of code and run the bash. After choosing one of the options, you will be asked for your embedded links, just paste them there! 

Remember to paste only one link to each line. Also by hitting enter button you will go to next line. When you are done entering them just hold the control button with D button at the same time. There you have it! Now just paste the link in your preferred downloader!

To use send to email option first  you need to install and configure msmtp.

In save them as a file option, links will be saved in a file in the current directory named otd.txt.";;
	esac
done

