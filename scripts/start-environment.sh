# !/bin/bash
source /home/user/.nvm/nvm.sh

if [ -d "/home/user/workspace/go5-web-app/" ]; then    
    cd /home/user/workspace/go5-web-app/
    echo "Starting go5-web-app... "
    bower install&> /home/user/go-social.log
    npm install&> /home/user/go-social.log
	ember s --port 4201 --live-reload-port 49154 &> /home/user/go-social.log &
else
	echo "No existe el proyecto go5-web-app en el workspace..."
fi

sleep 3

if [ -d "/home/user/workspace/go5-account-web/" ]; then
	cd /home/user/workspace/go5-account-web/
	echo "Starting go5-account-web... "
	bower install&> /home/user/go-accounts.log
    npm install&> /home/user/go-accounts.log
	ember s --port 4202 --live-reload-port 49155 &> /home/user/go-accounts.log &
else
	echo "No existe el proyecto go5-account-web en el workspace..."
fi

sleep 3

if [ -d "/home/user/workspace/go5-admin-panel/" ]; then
	cd /home/user/workspace/go5-admin-panel/
	echo "Starting go5-admin-panel... "
	bower install&> /home/user/admin-panel.log
    npm install&> /home/user/admin-panel.log
	ember s --port 4200 --live-reload-port 49153&> /home/user/admin-panel.log &
else
	echo "No existe el proyecto go5-admin-panel en el workspace..."
fi

sleep 3

if [ -d "/home/user/workspace/go5-mobile-app/" ]; then
	cd /home/user/workspace/go5-mobile-app/
	echo "Starting go5-mobile-app... "
	bower install&> /home/user/go-mobile.log
    npm install&> /home/user/go-mobile.log
	ember s --port 4203 --live-reload-port 49156&> /home/user/go-mobile.log &
else
	echo "No existe el proyecto go5-mobile-app en el workspace..."
fi
