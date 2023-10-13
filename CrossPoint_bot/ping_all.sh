# This code is open source to USENIX Security submission only (now). 
# After the publication of the corresponding thesis, the code will be free to use, modify, and distribute.
# Copyright (c) [Anonymous authors] [2023], which will be public after the publication.
# Licensed under the MIT License, Version 2.0.
# We kindly hope that this code should only be used for academic perspectives, 
# Please do not abuse this code to launch any attacks. 

# This code is used for observing congestion. 
# Run it with sudo. 
# e.g., $ sudo ./bash_ping -t 127.0.0.1
# The process will last forever unless you cancel it. 
# You should have tmux, and ping in your computer.
# Input: Dst IP addresses, write your own @ip_list.
# Output: 24-hour observation of congestion, saved as CSV files. 
# You should run this code in the bot, and send the CSV files to the CrossPoint controller.

# CrossPoint attacks workflow:
# 1. Run the bot_config in each bot, generating attack_flow JSON files. 
# 2. Send these JSON files to the controller. 
# 3. In the controller, run controller_CrossPoint to output the suspicious attack flow set.
# 4. In the controller, find the control group and the attack flow set.
# 5. Run bash_ping (or start_ping) in control group bots and suspicious attack flow bots. (This file)
# 6. Run conrtoller_CrossPoint to find profitable links.

# The experiment can be done with simulations and experiments. 
# The only difference is in step 2: The method of how you transfer JSON bot config files. 

# Using this you can run the bash_ping command on a bot to get the csv ping files.
# You should add your destination address in the @ip_list variable.
# This shell is used for debugging, to check whether you can ping the dest.

ip_list=(192.168.0.1 )
for i in ${ip_list[@]}
do 
    ping $i -c 1 >> /dev/null
    if [ $? -eq 0 ]; then
        echo ping $i success.
    else
        echo [ERROR] unable to ping $i
    fi
done

