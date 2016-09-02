#!/bin/bash

#RefDir=$1

#InputFiles=$(file $RefDir/* | grep 'DivX 5' | cut -d: -f1 ) $(file $RefDir/*/* | grep 'DivX 5' | cut -d: -f1 )
#echo $InputFiles



for VideoFile in "$@"
do
  FileNamePrefix=${VideoFile%.*}
  SFilenamePrefix=$(basename $FileNamePrefix)
  mencoder $VideoFile -oac copy -ovc lavc -lavcopts vpass=1:turbo:threads=3:vcodec=mpeg4 -o ${SFileNamePrefix}.mp4
  mencoder $VideoFile -oac copy -ovc lavc -lavcopts vpass=2:threads=3:vcodec=mpeg4 -o ${SFileNamePrefix}.mp4
done
