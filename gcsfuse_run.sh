#!/usr/bin/env bash
set -eo pipefail

echo "Mounting GCS Fuse."
gcsfuse --debug_gcs --debug_fuse $BUCKET $MNT_DIR 
echo "Mounting completed: $BUCKET to $MNT_DIR"

# Instead of moving the files afterward, it might make sense to have a site folder that I build from
quarto render index.qmd
cp index.qmd $MNT_DIR/output/index.qmd
cp index.html $MNT_DIR/output/index.html
cp -r index_files $MNT_DIR/output/index_files