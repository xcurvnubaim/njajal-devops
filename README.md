# Installation NGINX

```sh
sudo apt install nginx
```

Check if nginx web server run
```sh
curl localhost
```

or go to browser and access http://localhost

# Installation docker on ubuntu 
https://docs.docker.com/engine/install/ubuntu/


Run the following command to uninstall all conflicting packages:

```sh
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
```

1. Set up Docker's apt repository.

```sh
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

2. Install the Docker packages.

```sh
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

3. Verify that the Docker Engine installation is successful by running the hello-world image.

```sh
sudo docker run hello-world
```

## Linux post-installation steps for Docker Engine
([link](https://docs.docker.com/engine/install/linux-postinstall/))
Manage Docker as a non-root user 

1. Create the docker group.
```sh
sudo groupadd docker
```

2. Add your user to the docker group.
```sh
sudo usermod -aG docker $USER
```

3. run the following command to activate the changes to groups:
```sh
newgrp docker
```

