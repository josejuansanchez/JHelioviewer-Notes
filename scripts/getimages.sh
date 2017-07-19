#!/bin/bash

set -x

# Iterate over the months
for (( m=1; m<=7; m++ ))
do
	month=`printf "%02d" $m`
	echo "Month: $month"

	# Iterate over the days
	for (( d=1; d<=31; d++ ))
	do
		day=`printf "%02d" $d`
		echo "Day: $day"

		echo "Creating directory for the images"
		IMAGES_DIRECTORY=$month/$day/
		mkdir -p $IMAGES_DIRECTORY

		# Set the source
		URL=http://193.190.230.51/jp2/AIA171/2017/$month/$day/

		# Get the list of images
		lns=$(curl -s ${URL} | sed 's/.*href="\([^"]*\)".*/\1/' | grep ".jp2" | tail -n +4)
		total=$(echo ${lns} | wc -w)

		# Convert the list into an array
		arr=($lns)

		# Download the images
		for (( i=1; i<=total; i++ ))
		do
	  		echo "Downloading $i/$total..."
	  		wget ${URL}${arr[((i-1))]}
	  		mv ${arr[((i-1))]} ${IMAGES_DIRECTORY}
		done
	done

done