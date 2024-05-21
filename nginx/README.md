# Installation NGINX

```sh
sudo apt install nginx
```

Check if nginx web server run
```sh
curl localhost
```

or go to browser and access http://localhost

# Create configuration nginx

![alt text](image.png)

### 1. Creare configuration file in /etc/nginx/sites-available
/etc/nginx/sites-available/yourdomain.com : [file](./sites-available/yourdomain.com)


### 2. create a symbolic link to it in the /etc/nginx/sites-enabled/ directory.
``` bash
sudo ln -s /etc/nginx/sites-available/yourdomain.com /etc/nginx/sites-enabled/
```

### 3. Test the Nginx configuration for syntax errors:
``` bash
sudo nginx -t
```

### 4. If the test is successful, restart Nginx to apply the changes:
``` bash
sudo service nginx restart
```

### Result
![alt text](image-1.png)

# Api path for every service in microservice backend

```
    location /<path>/ {
        proxy_pass http://localhost:<port>/;

        # Recommended headers to include
        proxy_set_header Host $host;                      # Passes the original Host header
        proxy_set_header X-Real-IP $remote_addr;          # Passes the client IP address
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;  # Maintains a chain of client IPs
        proxy_set_header X-Forwarded-Proto $scheme;       # Indicates the original protocol (http/https)
    }
```

### example : [file](./sites-available/microservice.com)

# Setting SSL with Let's Encrypt using Certbot

### 1. Install Certbot and the Nginx Plugin

```sh
sudo apt update
sudo apt install certbot python3-certbot-nginx
```

### 2. Obtain an SSL Certificate

```sh
sudo certbot --nginx -d yourdomain.com
```

### 3. Test the Nginx configuration for syntax errors:
``` bash
sudo nginx -t
```

### 4. If the test is successful, restart Nginx to apply the changes:
``` bash
sudo service nginx restart
```

### 5. Automatic Renewal
Certbot sets up a cron job or systemd timer to automatically renew your certificates before they expire
``` bash
sudo certbot renew --dry-run
```

### Result
![alt text](image-2.png)


