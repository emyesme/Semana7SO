#!/bin/bash

# ps ax me muestra todos los procesos que corren en mi sistema

#numero de procesos
numProcesos=$(ps ax | tail -n +2 | wc -l)
echo ${numProcesos}

#memoria libre
cantMemoria=$(free | grep Memoria: | awk '{print ($4/$2)*100}')
echo ${cantMemoria}

#disco libre
discoLibre=$(df | grep root | awk '{print (($4-$3)/$4)*100.0}')
echo ${discoLibre}

#crontab -e tareas que se van a correr y su periodicidad

#instruccion para subir la informacion
curl --silent --request POST --header "X-THINGSPEAKAPIKEY: 2IX0C4A24J3V7NRO" --data "field1=${numProcesos}&field2=${cantMemoria}&field3=${discoLibre}" http://api.thingspeak.com/update

