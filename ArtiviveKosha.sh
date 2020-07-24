#!/bin/bash

#Script to Encode Sawyer's Artivive animation
#V1.0
#Untested-  Written by Phil Warren 20200723
#JaggedLines@gmail.com for questions or if this opens a hellmouth

#input both x and y dimensions in one place, since it's a square piece
dimension=2160
bitrate=12.5
speed="slow"
#I can't remember if this string variable works like this.  Remove quotation marks if dumb.
#Maybe even add quotation marks to the bitrate.

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

#Code.  There's like a 76% percent chance I did this right.  Cs get degrees, right?  

ffmpeg -r 30000/1001 -i 01_Kosha_Main_Comp_%05d.tif -c:v libx264 -preset %{speed} -vf "scale=${dimension}:-2:lanczos" -vb %{bitrate}M -pass 1 -f mp4 -f null /dev/null && \
ffmpeg -r 30000/1001 -i 01_Kosha_Main_Comp_%05d.tif -c:v libx264 -preset %{speed} -vf "scale=${dimension}:-2:lanczos" -vb ${bitrate}M -pass 2 Kosha_${dimension}x${dimension}_29.97fps_${bitrate}-${slow}.mp4


## TODO:
# we could possibly use an animation tuning, but I strongly suspect the pathological woman's eye will break that tuning.
