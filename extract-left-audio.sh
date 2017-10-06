#!/bin/bash
FILENAME=$1
ffmpeg -i ${FILENAME} -map_channel 0.1.0 ${FILENAME}.left.wav
