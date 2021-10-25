#!/bin/bash

# ERP run on the port 8000
Port=8000
#echo "port voulu : |${Port}|"

# Find the ID of the container running on the port 8000
ID=$(\
	docker container ls --format="{{.ID}}\t{{.Ports}}" |\
	grep ":${Port}->" |\
	awk '{print $1}'\
	)
#echo "print l'id du container : |${ID}|"

# Stop the container with his ID
#if [${ID} != ""]; then
echo "Closing container ${ID}"
docker container stop ${ID}
#fi

# Start a new container
Time=$(date +%s)
Name="ERP-${Time}"
Image="server_web_test"

echo "Running new container"
docker container run -d -it -p ${Port}:80 --name=${Name} ${Image}

echo "Container ${Name} is now running on port ${Port}"
