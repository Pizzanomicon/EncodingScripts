#!/bin/bash

#Script to Encode a friend's Artivive animation-  basic two-pass variable-bitrate tif sequence to MP4
#V1.0
#Confirmed working-  Written by Phil Warren 20200723
#JaggedLines@gmail.com for questions or if this opens a hellmouth

#input both x and y dimensions in one place, since it's a square piece
dimension=2160
bitrate="100M"
speed="slow"

#speed options:  Use the slowest you have patience for.
#ultrafast
#superfast
#veryfast
#faster
#fast
#medium – default preset
#slow
#slower
#veryslow

ffmpeg -r 30000/1001 -i 01_Kosha_Main_Comp_%05d.tif -c:v libx264 -preset ${speed} -vf "scale=${dimension}:-2:lanczos" -b:v ${bitrate} -pass 1 -f mp4 -f null /dev/null && \
ffmpeg -r 30000/1001 -i 01_Kosha_Main_Comp_%05d.tif -c:v libx264 -preset ${speed} -vf "scale=${dimension}:-2:lanczos" -b:v ${bitrate} -pass 2 Kosha_${dimension}x${dimension}_29.97fps_${bitrate}-${speed}.mp4

## TODO:
# we could possibly use an animation tuning, but I strongly suspect the pathological woman's eye will break that tuning.
