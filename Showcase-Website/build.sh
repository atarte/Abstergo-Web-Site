#!/bin/bash

# var
Port=80
Time=$(date +%s)
Image="httpd"
Name="Abstergo-WWW-${Time}"

# Close the current container
ID=$(\
	docker container ls --format="{{.ID}}\t{{.Ports}}" |\
	grep ":${Port}->" |\
	awk '{print $1}'\
)

if [ ! -z ${ID} ]; then
	echo "Closing container ${ID}"
	docker container stop ${ID}
fi

# Start a new container
echo "Running new container ${Name}"
docker container run -d -it \
	-p ${Port}:80 \
	-v $(pwd):/usr/local/apache2/htdocs/ \
	--name=${Name} \
	${Image}

echo "Container ${Name} is now running on port ${Port}"
