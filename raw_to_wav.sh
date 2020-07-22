#!/bin/bash
fs=48000
for trial in 1 2
do
  for dist in 36 54 72 90 108 126 144 162 180 216 
  do
      for ch in 0 1 2 3 4 5 6 7
      do
        prefix=fmcw_11k_21k_30_${dist}inch_box_${trial}_mic_${fs}
        echo "sox -r ${fs} -c 1 -e signed -c 1 -e signed -b 16 ${prefix}_raw_s16le_channel_${ch}.raw ${prefix}_channel_${ch}.wav"
        sox -r ${fs} -c 1 -e signed -c 1 -e signed -b 16 ${prefix}_raw_s16le_channel_${ch}.raw ${prefix}_channel_${ch}.wav
      done
  done
done


