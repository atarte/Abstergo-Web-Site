#!/bin/bash

# var
Port=8000
Time=$(date +%s)
Image="abstergo-erp"
Volume="Abstergo-ERP"
Name="Abstergo-ERP-${Time}"

# Close the current container
ID=$(\
	docker container ls --format="{{.ID}}\t{{.Ports}}" |\
	grep ":${Port}->" |\
	awk '{print $1}'\
)

if [ ! -z œ${ID} ]; then
	echo "Closing container ${ID}"
	docker container stop ${ID}
fi

# Deleting the last image / Creating a new image
Repository=$(\
	docker image ls --format="{{.Repository}}" |\
	grep ${Image} |\
	awk '{print $1}'\
)

if [ ! -z ${Repository} ]; then
	echo "Removing image ${Image}"
	docker image rm ${Image}
fi

echo "Creating a new image ${Image}"
docker image build -t ${Image} .

# Start a new container
echo "Running new container ${Name}"
docker container run -d -it \
	-p ${Port}:80 \
	-v $(pwd):/var/www/html/ \
	--name=${Name} \
	${Image}

echo "Container ${Name} is now running on port ${Port}"
