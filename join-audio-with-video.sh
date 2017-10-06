#!/bin/bash
# extract files?
#find . -type f -iname '*.VIDEOEXTENSION' -exec ffmpeg -i {} -vn -acodec copy {}.AUDIOEXTENSION \;

ffmpeg \
    -i domcode16-main-track-7-ancilla.MTS \
    -i domcode16-main-track-7-ancilla.MTS.left.wav \
    -c:v copy \
    -map 0:v:0 \
    -map 1:a:0 \
    -vn \
    domcode16-main-track-7-ancilla-audio-fixed.MTS



