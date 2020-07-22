#!/bin/bash
fs=48000
for trial in 1 2 3
do
    for inch in 120 144 #24 48 72 96 #120 144
    do
        prefix=fmcw_11k_21k_30_${inch}inch_tgrh_$trial
        for ch in 0 1 2 3 4 5 6 7
        do 
            rawfile=${prefix}_mic_48000_raw_s16le_channel_${ch}.raw
	    wavfile=${prefix}_channel_${ch}.wav
	    sox -r ${fs} -c 1 -e signed -b 16 ${rawfile} ${wavfile} 
            git add ${wavfile}
	    git commit -m "adding wav file" ${wavfile}
    done
    done
done
git push

