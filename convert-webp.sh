INPUT_FILE=$1
cwebp "$INPUT_FILE" -near_lossless 60 -o "${INPUT_FILE%.*}.webp"

SIZES_PARAM=$2
echo "$SIZES_PARAM"
if [ -n "$SIZES_PARAM" ]; then
  IFS=',' set -f; set -- $SIZES_PARAM; sizes=("$@")
  for size in "${sizes[@]}"; do
    echo "Processing: $size"
    cwebp "$INPUT_FILE" -near_lossless 60 -o "${INPUT_FILE%.*}-$size.webp" -resize "$size" 0
  done
fi
