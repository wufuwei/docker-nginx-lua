docker build -t 192.168.50.245:5000/redteamobile/nginx-request-copy:1.13.1 .
docker push 192.168.50.245:5000/redteamobile/nginx-request-copy:1.13.1
docker rmi  192.168.50.245:5000/redteamobile/nginx-request-copy:1.13.1
