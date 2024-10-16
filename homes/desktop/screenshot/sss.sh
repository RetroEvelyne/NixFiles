#!/usr/bin/env sh

# Configuration variables
SST_PIC_DIR="$HOME/Pictures/Screenshots"

while getopts "sctd:" options; do
	case $options in
		s)
			echo "sswm: save mode"
      name=$(date --iso-8601=seconds)
			maim -s -u -f png > $SST_PIC_DIR/$name.png
			echo "sswm: imaged saved as $SST_PIC_DIR/$name.png"
			;;
		c)
			echo "sswm: copy mode"
			maim -s -u -f png | xclip -selection clipboard -t image/png
			echo "sswm: image copied to clipboard"
			;;
		t)
			echo "sswm: text mode"
			maim -s -u -f png "$IMAGE"
			[ $? -ne 0 ] && exit 1

			tesseract "$IMAGE" "${TEXT//\.txt/}" 2> /dev/null
			sed -i 's/\x0c//' "$TEXT"

			if [ $(wc -l < $TEXT) -eq 0 ]; then
				echo "sswm: no text detected"
			else
				truncate -s -1 $TEXT
				xclip -selection clipboard < "$TEXT"
				echo "sswm: text copied to clipboard"
			fi
			;;
		d)
			echo "sswm: delay "$OPTARG"s..."
			sleep $OPTARG
			;;
	esac
done
