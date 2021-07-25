#!/bin/sh
echo "Preparing..."
service nginx stop 
service mysql stop
echo "Set environment vars" 
source srcs/.env 
echo "Changing the hosts file" 
echo '127.0.0.1 ycordell.42.fr' >> /etc/hosts 
echo '127.0.0.1 www.ycordell.42.fr' >> /etc/hosts  
docker-compose down
docker system prune 
echo "Removing temp folder used as volume..." 
if [ -d "~/data/" ]; then
  rm -rf ~/data/
fi
echo "Restart Docker service" 
service docker restart
