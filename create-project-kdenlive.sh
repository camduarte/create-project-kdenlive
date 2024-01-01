#!/bin/bash

#######################################################################
# Creates a project's structure for kdenlive and copy resource files. # 
#######################################################################

if [ $# -eq 1 ]
  then
    echo "...Creating project"

    mkdir -p ${1}/Videos/Cam ${1}/Videos/Clips ${1}/Images ${1}/Images/Thumbnail ${1}/Audios/Effects ${1}/Audios/Music ${1}/Audios/Voice ${1}/Audios/Audacity ${1}/Screenplay ${1}/Project

    touch ${1}/Screenplay/screenplay
    cp ./resources/Videos/Clips/* ${1}/Videos/Clips/
    cp ./resources/Images/* ${1}/Images/
    cp ./resources/Audio/Music/* ${1}/Audios/Music/
    cp ./resources/Audio/Voice/* ${1}/Audios/Music/Voice/
    cp ./resources/Project/ejemplo.kdenlive ${1}/Project/${1}.kdenlive
    cp ./resources/Thumbnail/thumbnail.xcf ${1}/Images/Thumbnail/

    statuscode=${?}
    tree ${1}
    if [ ${statuscode} -eq 0 ]
      then
        echo "Everythings is OK!!!"
      else
	echo "Something was wrong, please try again."    
    fi
  else
    echo "Please enter project's name as parameter."
fi
echo "This script is subject to the terms of copyleft © 2023 Christian Ariel Modesto Duarte"
exit ${statuscode}
