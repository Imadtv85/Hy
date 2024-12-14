#!/bin/bash

# إعدادات البث
STREAM_KEY="FB-122129828138499805-0-Abzp5vQsScYXTO5h"
M3U8_URL="http://mo3ad.xyz/GpfGbMNfzW/XJFgkQnpXd/14"
OUTPUT_PATH="rtmps://live-api-s.facebook.com:443/rtmp/$STREAM_KEY"

# إعدادات FFmpeg لتحسين الجودة والأداء
ffmpeg -re \
    -i "$M3U8_URL" \
    -c:v libx264 \
    -preset veryfast \
    -crf 23 \
    -g 50 \
    -keyint_min 50 \
    -sc_threshold 0 \
    -b:v 2500k \
    -maxrate 2500k \
    -bufsize 5000k \
    -c:a aac \
    -b:a 128k \
    -ar 44100 \
    -ac 2 \
    -f flv "$OUTPUT_PATH"
