# !/bin/bash

app=$1

if [ "$app" == gosocial ]; then
	echo "Iniciando gosocial... "
	docker exec -u user -it dockeremberenv_front_1 bash -c "cd /home/user/workspace/go5-web-app/; source ~/.nvm/nvm.sh; bower install; rm -f package-lock.json; npm install; ember  s --port 4201 --live-reload-port 49154"
elif [ "$app" == accounts ]; then
	echo "Iniciando accounts... "
	docker exec -u user -it dockeremberenv_front_1 bash -c "cd /home/user/workspace/go5-account-web/; source ~/.nvm/nvm.sh; bower install; rm -f package-lock.json; npm install; ember s --port 4202 --live-reload-port 49155"
elif [ "$app" == adminpanel ]; then
	echo "Iniciando adminpanel... "
	docker exec -u user -it dockeremberenv_front_1 bash -c "cd /home/user/workspace/go5-admin-panel/; source ~/.nvm/nvm.sh; bower install; rm -f package-lock.json; npm install; ember s --port 4200 --live-reload-port 49153"
elif [ "$app" == mobile ]; then
	echo "Iniciando mobile... "
	docker exec -u user -it dockeremberenv_front_1 bash -c "cd /home/user/workspace/go5-mobile-app/; source ~/.nvm/nvm.sh; bower install; rm -f package-lock.json; npm install; ember s --port 4203 --live-reload-port 49156"
elif [ "$app" == all ]; then
	echo "Iniciando todas las aplicaciones... "
	docker exec -u user dockeremberenv_front_1 bash start-environment.sh
else
	echo "Opcion invalida: "
	echo "- all "
	echo "- gosocial "
	echo "- accounts "
	echo "- adminpanel "
	echo "- mobile "
fi
