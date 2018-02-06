# Based on: https://stackoverflow.com/questions/17166739/how-to-display-image-for-particular-time-in-a-video-using-ffmpeg

TARGET=$@
SHELL=/bin/bash

.DEFAULT_GOAL: all

.PHONY: all
all: output/pre-roll/total.mp4

output/pre-roll/total.mp4: \
	output/pre-roll-slides/pre-roll.txt
	ffmpeg \
		-f concat \
		-i output/pre-roll-slides/pre-roll.txt \
		-codec copy $(TARGET)

output/pre-roll-slides/pre-roll.txt: \
	output/pre-roll-slides/1-intro.mp4 \
	output/pre-roll-slides/3-sponsors.mp4
	ls output/pre-roll-slides \
		| grep -v '.txt' \
		| awk '{print "file \x27"$$0"\x27"}' \
		> $(TARGET)

output/pre-roll-slides/1-intro.mp4: \
	input/pre-roll-slides/1-intro.png
	ffmpeg \
		-loop 1 \
		-f image2 \
		-i input/pre-roll-slides/1-intro.png \
		-c:v libx264 \
		-t 5 \
		$(TARGET)

output/pre-roll-slides/3-sponsors.mp4: \
	input/pre-roll-slides/3-sponsors.png
	ffmpeg \
		-loop 1 \
		-f image2 \
		-i input/pre-roll-slides/3-sponsors.png \
		-c:v libx264 \
		-t 5 \
		$(TARGET)
