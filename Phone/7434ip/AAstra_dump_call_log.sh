#!/bin/bash

echo "Enter the IP address"; 
read add; 
echo "Enter the password"; 
read passw; 
$(timeout 3s curl --data passw=$passw -L http://$add/callLog.asp | grep printSelectedNumCLForm | cut -d \> -f 5 | cut -d \< -f 1 > nom.txt); 
$(timeout 3s curl --data passw=$passw -L http://$add/callLog.asp | grep printSelectedNumCLForm | cut -d = -f 4 | cut -d \" -f 1 > numero.txt); 
$(timeout 3s curl --data passw=$passw -L http://$add/callLog.asp | grep 180 | cut -d \> -f 3 | cut -d \< -f 1 > date.txt); 
$(timeout 3s curl --data passw=$passw -L http://$add/callLog.asp | grep \"80 | cut -d \> -f 3 | cut -d \< -f 1 > duree.txt); 
$(timeout 3s curl --data passw=$ -L http://$add/callLog.asp | grep img | cut -d \" -f 4 | cut -d . -f 1 > mode.txt); 
$(paste nom.txt numero.txt date.txt duree.txt mode.txt > dump_call_log_$add.txt);
