#!/bin/bash

echo "Entrer l'adresse IP"; 
read adresse; 
echo "Entrer le mot de passe"; 
read mdp; 
echo "Entrer un nom d'utilisteur"; 
read nom_tel; 
echo "Entrer un numero de telephone"; 
read number_tel;$(timeout 3s curl -d passw=Welcome -L http://$adresse/checkpasswd.asp);
$(timeout 3s curl d Pname=nom_tel -d Pnumber=$number_tel -d PringType=255 -L http://$adresse/addToPhoneBook.asp);
$(timeout 3s curl -L http://$adresse/goform/callForm?number=$number_tel&backPage=0);$(sleep 1);
$(timeout 3s curl -d Call_phb=deco -L http://$adresse/goform/callForm?number=$number_tel&backPage=0);
$(timeout 3s curl -L http://$adresse/goform/deleteForm?number=$number_tel);
$(timeout 3s curl -L http://$adresse/clearcallogcont.asp);
