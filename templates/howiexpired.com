server {
    listen 80;
    listen [::]:80;

    server_name howiexpired.com www.howiexpired.com;

    if ($host = www.howiexpired.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot

    if ($host = howiexpired.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot

    return 404; # managed by Certbot
}


server {
    listen 443 ssl; # managed by Certbot
    listen [::]:443 ssl ipv6only=on; # managed by Certbot

    server_name howiexpired.com www.howiexpired.com;

    include /etc/nginx/snippets/letsencrypt.conf;

    access_log           /var/log/nginx/jenkins.access.log;
    error_log            /var/log/nginx/jenkins.error.log;

    root /var/www/howiexpired.com/html;
    index index.html index.htm index.nginx-debian.html;

    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/howiexpired.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/howiexpired.com/privkey.pem; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

    location / {
        include /etc/nginx/proxy_params;
        proxy_pass          http://localhost:8080;
        proxy_read_timeout  90s;
        # Fix potential "It appears that your reverse proxy set up is broken" error.
        proxy_redirect      http://localhost:8080 https://www.howiexpired.com;
    }     
}
