#!/bin/bash

echo "Enter the IP address"; 
read adresse; 
echo "Enter the password"; 
read mdp; 
nom=$(timeout 3s curl --data passw=$mdp -L http://$adresse/callLog.asp | grep printSelectedNumCLForm | cut -d \> -f 5 | cut -d \< -f 1 > nom.txt); 
numero=$(timeout 3s curl --data passw=$mdp -L http://$adresse/callLog.asp | grep printSelectedNumCLForm | cut -d = -f 4 | cut -d \" -f 1 > numero.txt); 
date=$(timeout 3s curl --data passw=$mdp -L http://$adresse/callLog.asp | grep 180 | cut -d \> -f 3 | cut -d \< -f 1 > date.txt); 
duree=$(timeout 3s curl --data passw=$mdp -L http://$adresse/callLog.asp | grep \"80 | cut -d \> -f 3 | cut -d \< -f 1 > duree.txt); 
mode=$(timeout 3s curl --data passw=$mdp -L http://$adresse/callLog.asp | grep img | cut -d \" -f 4 | cut -d . -f 1 > mode.txt); 
tableau=$(paste nom.txt numero.txt date.txt duree.txt mode.txt > dump_journal_$adresse.txt);
