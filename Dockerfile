FROM 192.168.50.245:5000/redteamobile/nginx-request-copy:1.13.1 

MAINTAINER Emanuele Mazzotta <hello@mazzotta.me>

RUN useradd -s /sbin/nologin -M nginx 
ADD nginx.conf /etc/nginx/nginx.conf
ADD lua        /etc/nginx/lua
ADD html       /etc/nginx/html
EXPOSE 8099 8088

CMD ["nginx", "-g", "daemon off;"]
