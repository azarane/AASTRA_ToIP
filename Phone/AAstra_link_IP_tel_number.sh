#!/bin/bash
echo "Donner la plage d'IP :";
read ip; 
fin=$(echo $ip | cut -d . -f 4); 
taille_fin=$(echo ${#fin}); 
taille_ip=$(echo ${#ip}); 
addresse_deb=$(echo ${ip:0:($taille_ip-$taille_fin)});
 
i=0; 
while [ $i -le 255 ]; 
	do curl_commande=$(timeout 3s curl http://$addresse_deb$i/m_bar.asp | grep Num | cut -d : -f 2 | cut -d \< -f 1) ; 
	echo "$addresse_deb$i - $curl_commande" ; 
	let i++ ; 
done > resultat_IP_numero_tel.txt
