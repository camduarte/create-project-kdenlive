#!/bin/bash

#######################################################################
# Creates a project's structure for kdenlive and copy resource files. # 
#######################################################################

if [ $# -eq 1 ]
  then
    echo "...Creating project"

    mkdir -p ${1}/Video/Cam ${1}/Video/Clip ${1}/Video/Render ${1}/Image ${1}/Image/Thumbnail ${1}/Audio/Effects ${1}/Audio/Music ${1}/Audio/Voice ${1}/Audio/Audacity ${1}/Screenplay ${1}/Kdenlive-Project

    touch ${1}/Screenplay/screenplay
    cp -r ./resource/Video/Clip/* ${1}/Video/Clip/
    cp -r ./resource/Image/* ${1}/Image/
    cp -r ./resource/Audio/Music/* ${1}/Audio/Music/
    cp -r ./resource/Audio/Voice/* ${1}/Audio/Voice/
    cp ./resource/Kdenlive-Project/example.kdenlive ${1}/Kdenlive-Project/${1}.kdenlive
    cp ./resource/Thumbnail/thumbnail.xcf ${1}/Image/Thumbnail/

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
