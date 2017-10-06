#!/bin/bash
#ffmpeg -i domcode16-main-track-7-ancilla.MTS -map_channel 0.0.0 domcode16-main-track-7-ancilla-mono.MTS
ffmpeg -i domcode16-main-track-7-ancilla.MTS  -map_channel 0.1.0 -ac 1 -c:v copy domcode16-main-track-7-ancilla-mono.MTS
