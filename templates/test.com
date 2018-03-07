server {
    listen 80;
    listen [::]:80;

    server_name test.com www.test.com;

    root /var/www/test.com/html;
    index index.html index.htm index.nginx-debian.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
