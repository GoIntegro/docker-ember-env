# !/bin/bash

app=$1

if [ "$app" == gosocial ]; then
	echo "Iniciando gosocial... "
	docker exec -u user -it dockeremberenv_front_1 bash -c "cd /home/user/workspace/go5-web-app/; source ~/.nvm/nvm.sh; ember s --port 4201"
elif [ "$app" == accounts ]; then
	echo "Iniciando accounts... "
	docker exec -u user -it dockeremberenv_front_1 bash -c "cd /home/user/workspace/go5-account-web/; source ~/.nvm/nvm.sh; ember s --port 4202"
elif [ "$app" == adminpanel ]; then
	echo "Iniciando adminpanel... "
	docker exec -u user -it dockeremberenv_front_1 bash -c "cd /home/user/workspace/go5-account-web/; source ~/.nvm/nvm.sh; ember s --port 4200"
elif [ "$app" == all ]; then
	echo "Iniciando todas las aplicaciones... "
	docker exec -u user dockeremberenv_front_1 bash start-environment.sh	
else
	echo "Opcion invalida: "
	echo "- all "
	echo "- gosocial "
	echo "- accounts "
	echo "- adminpanel "
fi
