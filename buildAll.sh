#!/bin/bash

# Starting ERP
echo "lancement de l'ERP"
bash ./ERP/buildWebPage.sh
bash ./ERP/buildDataBase.sh

# Starting Showcase Website
echo "lancement du Site Vitrine"
bash ./Showcase-Website/build.sh

# Starting Wiki
echo "lancement du Wiki"
bash ./Wiki/build.sh
