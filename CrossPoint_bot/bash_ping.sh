# This code is open source to CCS 2024 submission only (now). 
# After publication of corresponding thesis, the code will be free to use, modify, and distribute.
# Copyright (c) [Anonymous authors] [2023], which will be public atfer the publication.
# Licensed under the MIT License, Version 2.0.
# We kindly hope that this code should only be used for acedemic pespectives, 
# Please do not abuse this code to launch any attacks. 

# This code is used for observing congestion. 
# Run it with sudo. 
# e.g., $ sudo ./bash_ping -t 127.0.0.1
# The process will last forever unless you cancel it. 
# You should have tmux, and ping in your computer.
# Input: Dst IP addresses.
# Output: 24 hours observation of congestion, saved as CSV files . 
# You should run this code in the bot, and send the CSV files to the CrossPoint controller.

# CrossPoint attacks workflow:
# 1. Run the bot_config in each bot, generating attack_flow JSON files. 
# 2. Send these JSON files to the controller. 
# 3. In the controller, run controller_CrossPoint to output the suspisous attack flow set.
# 4. In the controller, find the control group and the attack flow set.
# 5. Run bash_ping in control group bots and suspicious attack flow bots. (This file)
# 6. run conrtoller_CrossPoint to find profitable links.

# The experiment can be done with simulations and experiments. 
# The only differences is in the step 2: The method how you transfer JSON bot config files. 


#if [[ $1 == "-h" ]]
#then 
#	echo " "
#	echo "Ping measurement: get timestamp,seq,and delay to csv."
#	echo "      -t [IP_ADDR]"
#	echo "      -o [file_name]"
#	echo " "
#	exit 0  
#fi

ping_addr=192.168.5.254

time=$(date "+%Y-%m-%d-%H-%M")

file_name=pinglog_${ping_addr}_${time}.csv

while getopts "t:o:h" opt
do
	case $opt in
		o)
		file_name=$OPTARG
		#echo "ouptu filename get"
		echo o is only used for debug, donot use in test.
		;;
		t)
		ping_addr=$OPTARG
		#echo "pingaddr get"
		;;
		h)
		echo " "
        	echo "Ping measurement: get timestamp,seq,and delay to csv."
       	 	echo "      -t [IP_ADDR]"
        	echo "      -o [file_name]"
        	echo " "
        	exit 0
		;;
	esac
done

echo output file name is $file_name

echo ping addr is $ping_addr

while true
do
	time=$(date "+%Y-%m-%d-%H-%M")

	file_name=pinglog_${ping_addr}_${time}.csv
	
	sudo ping ${ping_addr} -D -i 0.1 -c 864000 | awk 'BEGIN{print "id,time,seq,delay";OFS=",";/[:digit:]/}{ if($2 == "64") {sub("[[]","",$1);sub("[]]","",$1);gsub("[[:alpha:]]","",$6);gsub("[[:alpha:]+]","",$8);gsub("_=","",$6);gsub("=","",$8);print NR-1,$1,$6,$8} }' > ${file_name}

	echo Finish a whole day ping log. ${time}

done
