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

if [ ${ID} != "" ]; then
	echo "Closing container ${ID}"
	docker container stop ${ID}
fi

# Deleting the last image / Creating a new image
Repository=$(\
	docker image ls --format="{{.Repository}}" |\
	grep ${Image} |\
	awk '{print $1}'\
)

if [ ${Repository} != "" ]; then
	echo "Removing image ${Image}"
	docker image rm ${Image}
fi

echo "Creating a new image ${Image}"
docker image build -t ${Image} .

# Creating a new volume
VolumeName=$(\
	docker volume ls --format="{{.Name}}" |\
	grep ${Volume} |\
	awk '{print $1}'\
)

if [ ${VolumeName} != "" ]; then
	echo "Creation a new volume ${Image}"
	docker volume create ${Volume}
fi

# Start a new container
echo "Running new container ${Name}"
docker container run -d -it \
	-p ${Port}:80 \
	--name=${Name} \
	--mount source="$(pwd)",target=/var/www/html/ \
	${Image}

echo "Container ${Name} is now running on port ${Port}"
