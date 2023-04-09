#!/usr/bin/env sh

echo "Name:" && read name
echo "URL:" && read url

yt-dlp -x --no-playlist --embed-thumbnail --no-embed-metadata --audio-quality 0 --audio-format flac -o "$name" "$url"
