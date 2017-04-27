# !/bin/bash

app=$1

if [ "$app" == gosocial ]; then	
	docker exec -u user dockeremberenv_front_1 tail -f go-social.log
elif [ "$app" == accounts ]; then	
	docker exec -u user dockeremberenv_front_1 tail -f go-accounts.log
elif [ "$app" == adminpanel ]; then
	docker exec -u user dockeremberenv_front_1 tail -f admin-panel.log
else
	echo "Opcion invalida: "
	echo "- gosocial "
	echo "- accounts "
	echo "- adminpanel "
fi




