#!/bin/bash

# Author: Christopher Hunter

# This create web-optimized resized images in the current directory.
# This requires the 'sips' command-line tool which is native on MacOS.

# If you re-run the tool make sure and run 'rm *thumb.jpg; rm *med.jpg'
# to clear out the resized files. Otherwise you will end up with a huge
# mess of files. I chose not to enable this by default, as it carries
# some risk of losing files.

# Uncomment this to remove resized images every time:
# rm *thumb.jpg; rm *med.jpg

# set width for thumbs and medium images. These are good for landscape.
# for portrait-oriented images, use 200 for thumbs and 1000 for med, or
# the images will be a little too blurry.
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
