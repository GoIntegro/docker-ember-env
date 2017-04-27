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

(el build de la imagen de front tarda algunos minutos)

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
./start_all.sh
```
*Obs: Si se renombra el directorio del entorno, cambiar __**dockeremberenv_front_1**__ por el nombre del container dentro del script.
Para obtenerlo ver la columna Name en:*

```bash
docker ps

CONTAINER ID        IMAGE                  COMMAND                  CREATED             STATUS              PORTS                                                                                                             NAMES
7535bc11e8b6        nginx                  "nginx-debug -g 'd..."   47 minutes ago      Up 47 minutes       80/tcp, 443/tcp, 0.0.0.0:8080->8080/tcp                                                                           dockeremberenv_nginx_1
f1912927d2e3        dockeremberenv_front   "/usr/bin/supervisord"   48 minutes ago      Up 47 minutes       0.0.0.0:49153-49155->49153-49155/tcp, 0.0.0.0:32791->4200/tcp, 0.0.0.0:32790->4201/tcp, 0.0.0.0:32789->4202/tcp   dockeremberenv_front_1

```
La primera vez se deben instalar las dependencias con bower install y npm install. (Si hay dependencias con credenciales estas se pueden montar dentro del docker, o hacer npm y bower install desde afuera del container).

5 - **Abrir el browser en (por ejemplo) http://localhost:8080/gosocial/**

--------------------------------------------------------------------------

**Logging:**
Para ver el log de cada aplicacion corriendo:

- Go Social:
```bash
docker exec -u user dockeremberenv_front_1 tail -f go-social.log
```
- Accounts:
```bash
docker exec -u user dockeremberenv_front_1 tail -f go-accounts.log
```
- Admin panel:
```bash
docker exec -u user dockeremberenv_front_1 tail -f admin-panel.log
```

--------------------------------------------------------------------------

Al finalizar apagar los containers:
```bash
docker-compose stop
```

Una vez creados los containers solamente hay que apagarlos y prenderlos (sin recrearlos):
```bash
docker-compose start
```
```bash
docker-compose stop
```

--------------------------------------------------------------------------

### Levantar apps por separado (si no se quiere usar start_all.sh):
Si se necesita o prefiere levantar las apps por separado hacer:

```bash
# levantar gosocial
./start_gosocial.sh

# levantar accounts
./start_accounts.sh

# levantar admin panel
./start_admin_panel.sh

```
