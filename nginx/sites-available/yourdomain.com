server {
    listen 80;  # Listen for incoming HTTP connections on port 80 (default for HTTP).

    server_name yourdomain.com;  # Define the domain name for this server block.

    location / {
        # Forward all requests to the service running on localhost:3000.
        proxy_pass http://localhost:3000;  
        
        # Set the Host header to the host of the original request.
        proxy_set_header Host $host;
        
        # Set the X-Real-IP header to the IP address of the client.
        proxy_set_header X-Real-IP $remote_addr;
        
        # Set the X-Forwarded-For header to preserve the original client IP, even through proxy chains.
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        
        # Set the X-Forwarded-Proto header to the original protocol (HTTP or HTTPS).
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    # Define custom error pages for specific HTTP error codes.
    error_page 500 502 503 504 /50x.html;
    
    location = /50x.html {
        root /usr/share/nginx/html;  # Serve the custom error page from this directory.
    }
}
