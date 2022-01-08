# Vue Docker Boilerplate

### Technologies Used

- Docker: DevOPS Technology used for setting up virtual environments for running containerized applications
- Nginx: Web-server application
- Vue: Front-end framework for building progressive web applications
- Bootstrap: Front-end CSS styling framework

# Docker for developer environment

### Install Docker

Visit https://docs.docker.com/get-docker for instructions.

### Install Docker Compose (linux only)

Visit https://docs.docker.com/compose/install for instructions.

### Switch to Linux containers (windows only)

Right-click on the Docker icon in Taskbar and choose "Switch to Linux containers..."

### Configure `docker-compose`

In Docker repo folder, copy `.env.example` to `.env` and edit it accordingly:

* `COMPOSE_CONVERT_WINDOWS_PATHS=1`  
  Uncomment this line on Windows OS. That will tell Docker to interconvert unix/win paths.
* `FRONTEND_DIR`  
  Absolute or relative path to the folder with cloned frontend repo.
* `LISTEN_IP`  
  IP address to listen incoming HTTP connections. If you already have `nginx` listening on `127.0.0.1:80` port then you
  can bind docker containers to listen on another IP (default `127.0.0.2`).  
  **Warning:** If already have `nginx` working on your host, make sure they are not bound to `0.0.0.0`, that will
  prevent `nginx` container from starting. Rebind your host `nginx` to `127.0.0.1` instead.  
  **macOS users:** By default macOS doesn't bind other 127.0.0.* to loopback adapter, so you have to do that yourself:  
  ```sudo ifconfig lo0 alias 127.0.0.2 up```

### Configure hosts

Docker container configured to work on `vue-docker.local` (vue-docker)
You have to add these records to your `/etc/hosts` (linux/macos) or `%WIN_DIR%\System32\drivers\etc\hosts` (win).

```
127.0.0.2 vue-docker.local
```

You'll need root/administrator privileges to edit this file.

### Build and run containers

Open terminal/console in the folder with cloned Docker repo and run:

```
docker-compose build
```

Building could take some time, because Docker will pull all needed images from Docker Hub.

When it's done you're ready to run containers:

```
docker-compose up -d
```

First run could take some time, because frontend/backend will install needed dependencies. WAIT 10 MINUTES after
executing docker-compose up -d for the first time.

To start/stop containers you can use `docker-compose stop` and `docker-compose start`.  
To remove containers you can use `docker-compose down`.  
To show containers status you can use `docker-compose ps`, it should show something like that:

```
   Name                  Command               State                  Ports               
------------------------------------------------------------------------------------------
vue-frontend   /entrypoint.sh yarn serve  ...   Up      8080/tcp                           
vue-nginx      /docker-entrypoint.sh ngin ...   Up      127.0.0.1:32782->80/tcp            
```

### Containers description

There are 2 containers:

* `vue-nginx`  
  Listens incoming web requests (HTTP) and dispatches them to **vue-frontend**.

* `vue-frontend`  
  **Frontend**. Served using `yarn serve` command, with Hot Code Reload enabled. Exposes port `8080`.

You can restart container using `docker-compose restart <container-name>`, for
example: `docker-compose restart vue-frontend`.  
If you'll omit container name, then all containers will be restarted.

---

*Happy coding, do something wonderful ;)*
