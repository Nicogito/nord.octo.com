#!/bin/bash

path_to_pictures="assets/images/people/"

function list_jpg_pictures() {
  ls $path_to_pictures*.jpg
}

function get_expected_webp_picture() {
    echo "${1//.jpg/.webp}"
}

function create_webp_picture(){
  cwebp -resize 1000 0 -q 75 "$1" -o "$2"
}

for picture in $( list_jpg_pictures )
do
  expected_webp_picture=$( get_expected_webp_picture "$picture")

  if [ ! -f "$expected_webp_picture" ]; then
      create_webp_picture "$picture" "$expected_webp_picture"
  fi
done
