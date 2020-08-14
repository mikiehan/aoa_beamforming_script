#!/bin/bash
fs=48000
for chirp_dur in 25 50 75 100
do
for trial in 1 2 # # 3
do
    for inch in 36 #72 #36 # #36 #12 48 60 72 84 96 108 120 132 144 
    do
	    for prefix in fmcw_10k_15k_${chirp_dur} # fmcw_16k_18k_30 fmcw_16k_20k_30
	    do
        	prefix2=${prefix}_${inch}inch_tegr0812_samedev_${trial}
        	for ch in 0 1 2 3 4 5 6 7
        	do 
            	    rawfile=${prefix2}_mic_${fs}_raw_s16le_channel_${ch}.raw
	    	    wavfile=./tegr0812_wav/${prefix2}_${fs}_channel_${ch}.wav
	    	    sox -r ${fs} -c 1 -e signed -b 16 ${rawfile} ${wavfile} 
                    
		    #git add ${wavfile}
	            
		    #git commit -m "adding wav file" ${wavfile}
                done
            done
    done
    done
done
#git push

