server {
    listen 80;
    server_name your_domain.com;

    location /service1/ {
        proxy_pass http://localhost:8001/;

        # Recommended headers to include
        proxy_set_header Host $host;                      # Passes the original Host header
        proxy_set_header X-Real-IP $remote_addr;          # Passes the client IP address
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;  # Maintains a chain of client IPs
        proxy_set_header X-Forwarded-Proto $scheme;       # Indicates the original protocol (http/https)
    }

    location /service2/ {
        proxy_pass http://localhost:8002/;
    }

    location /service3/ {
        proxy_pass http://localhost:8003/;
    }

    # Add more services as needed
}