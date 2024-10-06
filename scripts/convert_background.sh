#!/bin/sh

INPUT=$1
OUTPUT=$2
WIDTH=${WIDTH:-2256}
HEIGHT=${HEIGHT:-1504}

convert "$INPUT" -resize "x$HEIGHT" -gravity center \
	-crop "${WIDTH}x${HEIGHT}+0+0" +repage "$OUTPUT"