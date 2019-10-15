#!/bin/sh

# generate output directories
OUTPUT_DIR=output
TUTORIALS_DIR=tutorials
if [ ! -d "$TUTORIALS_DIR" ]
then
  echo "ERROR: Missing tutorials directory '$TUTORIALS_DIR'"
  exit 1
fi

if [ ! -d "$OUTPUT_DIR" ]
then
  echo "Creating output directory '$OUTPUT_DIR'"
  mkdir "$OUTPUT_DIR"
else
  echo "Output directory '$OUTPUT_DIR' already exists."
fi

for TUT in `ls tutorials`
do
  NAME=`echo $TUT | sed 's/\.md//g'`
  echo -n "Compiling tutorial: $NAME..."
  pandoc -t s5 --css=pandoc.css --toc --self-contained -s -f markdown -t html "$TUTORIALS_DIR/$TUT" -o "$OUTPUT_DIR/$NAME.html"
  echo "DONE"
done
