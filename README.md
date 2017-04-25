## Entorno docker para apps ember en front

### Instalación:
1 - **Instalar docker y docker-compose**

https://www.docker.com/

https://docs.docker.com/compose/install/

2 - **Levantar entorno docker:**

En el root de la repo ejecutar:

```bash
docker-compose up -d
```

(el build de la imagen de front tarda varios minutos)

3 - **Crear la carpeta workspace y descargar los repositorios dentro:**

```bash
mkdir workspace
cd workspace
git clone git@github.com:GoIntegro/go5-mobile-app.git
git clone git@github.com:GoIntegro/go5-account-web.git
git clone git@github.com:GoIntegro/go5-web-app.git
git clone git@github.com:GoIntegro/go5-admin-panel.git
```
4 - **Levantar apps:**
```bash
docker exec -u user dockeremberenv_front_1 bash start-environment.sh
```
*Obs: Cambiar __**dockeremberenv_front_1**__ por el nombre del container.
Para obtenerlo ver la columna Name en:*

```bash
docker ps

CONTAINER ID        IMAGE                  COMMAND                  CREATED             STATUS              PORTS                                                                                                             NAMES
7535bc11e8b6        nginx                  "nginx-debug -g 'd..."   47 minutes ago      Up 47 minutes       80/tcp, 443/tcp, 0.0.0.0:8080->8080/tcp                                                                           dockeremberenv_nginx_1
f1912927d2e3        dockeremberenv_front   "/usr/bin/supervisord"   48 minutes ago      Up 47 minutes       0.0.0.0:49153-49155->49153-49155/tcp, 0.0.0.0:32791->4200/tcp, 0.0.0.0:32790->4201/tcp, 0.0.0.0:32789->4202/tcp   dockeremberenv_front_1

```
Instalar las dependencias con bower install y npm install

5 - **Abrir el browser en (por ejemplo) http://localhost:8080/gosocial/**

6 - **Logging:**
- Go Social:
```bash
docker exec -u user  dockeremberenv_front_1 tail -f go-social.log
```
- Accounts:
```bash
docker exec -u user  dockeremberenv_front_1 tail -f go-accounts.log
```
- Admin panel:
```bash
docker exec -u user  dockeremberenv_front_1 tail -f admin-panel.log
```


--------------------------------------------------------------------------

### Levantar apps por separado (si no se quiere usar start-environment.sh):
Si se necesita o prefiere levantar las apps a mano dentro del container de front, hacer:

1 - Ingresar al container: 
```bash
docker exec -it dockeremberenv_front_1 bash
```
2 - Ir al directorio:
```bash
cd workspace/go5-web-app/
ember s --port 4201
```
3 - Repetir para las aplicaciones que se desee, respetando los siguientes puertos:

__**admin panel**__
- path: **/adminpanel/**
- levantar en puerto: **4200**
  
__**gosocial**__
- path: **/gosocial/**
- levantar en puerto: **4201**

__**accounts**__
- path: **/**
- levantar en puerto: **4202**

