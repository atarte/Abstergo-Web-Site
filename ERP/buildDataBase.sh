#!/bin/bash

# var
Time=$(date +%s)
Image="oraclelinux:8.4"
Volume="Abstergo-ERP-DB"
Name="Abstergo-ERP-DB-${Time}"

# Close the current container
ID=$(\
	docker container ls --format="{{.ID}}\t{{.Names}}" |\
	grep "Abstergo-ERP-DB-" |\
	awk '{print $1}'\
)

if [ ! -z ${ID} ]; then
	echo "Closing container ${ID}"
	docker container stop ${ID}
fi

# Init volume
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
    --mount source=${Volume},target=/app \
	--name=${Name} \
	${Image}

echo "Container ${Name} is now running on port ${Port}"
