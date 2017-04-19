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

Entrar la container de front (aplicacones ember) y levantar las aplicaciones en los puertos de cada una (listados mas abajo):
```bash
 docker exec -it dockeremberenv_front_1 bash
 su user
```
*Obs: Cambiar dockeremberenv_front_1 por el nombre del container. Para obtenerlo ejecutar:*
```bash
docker ps
```
Instalar las dependencias con bower install y npm install

Ir a los directorios:
``` cd workspace/go5-web-app/
  ember s --port 4201
```
5 - **Abrir el browser en (por ejemplo) http://localhost:8080/gosocial/**

### Puertos del nginx:
    
__**admin panel**__
- path: **/adminpanel/**
- levantar en puerto: **4200**
  
__**gosocial**__
- path: **/gosocial/**
- levantar en puerto: **4201**

__**accounts**__
- path: **/**
- levantar en puerto: **4202**
	

