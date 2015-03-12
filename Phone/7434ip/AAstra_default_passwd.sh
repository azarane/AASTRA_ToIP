echo "Donner la plage d'IP :";
read ip; 
fin=$(echo $ip | cut -d . -f 4); taille_fin=$(echo ${#fin}); 
taille_ip=$(echo ${#ip}); 
addresse_deb=$(echo ${ip:0:($taille_ip-$taille_fin)}); 
i=0; 
while [ $i -le 255 ]; 
	do if [$(timeout 3s curl --data passw=Welcome -L http://$addresse_deb$i/checkpasswd.asp | grep body) -z ]; 
		then echo "$addresse_deb$i - IP non attribuee"; 
	else curl_logout=$(timeout 3s curl http://10.92.38.$i/jpass_user.asp | grep logout); 
		if ["$curl_logout" -z]; 
			then echo "$addresse_deb$i - Secure" ; 
		else echo "$addresse_deb$i - Welcome" ; 
		fi ; 
	fi ;  
	let i++ ; 
done > resultat_mdp_default.txt
