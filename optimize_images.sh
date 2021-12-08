#!/bin/bash

# create web-optimized resized images in the current directory.

# set width for thumbs and medium images
THUMB_WIDTH="140"
MED_WIDTH="850"

# create copies of original images
for file in `ls *.jpg`; do
    thumb=$(echo "${file}" | sed -e 's/.jpg/_thumb.jpg/');
    cp "${file}" "${thumb}";

    med=$(echo "${file}" | sed -e 's/.jpg/_med.jpg/');
    cp "${file}" "${med}";
done;

# resize thumbnails
sips -Z ${THUMB_WIDTH} ./*thumb.jpg

# resize medium images
sips -Z ${MED_WIDTH} ./*med.jpg
