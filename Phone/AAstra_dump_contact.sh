echo "Enter the IP add"; 
read add; 
echo "Enter the password"; 
read pass; 
name=$(timeout 3s curl --data passw=$pass -L http://$add/phonebook.asp | grep printSelectedNumForm | cut -d ' ' -f 5 | cut -d ' ' -f 6 > contact_name.txt);
number=$(timeout 3s curl --data passw=$pass -L http://$add/phonebook.asp | grep printSelectedNumForm | cut -d = -f 4 | cut -d \" -f 1 > contact_number.txt);
tab=$(paste contact_name.txt contact_number.txt > dump_contact_$add.txt);
