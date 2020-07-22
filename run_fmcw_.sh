#!/bin/bash
for trial in 1 2 3
do
    echo "aplay fmcw_11k_21k_30_48000_30.wav & ./micarray_raw_recorder_direct_org --sampling_frequency 48000 --duration 30 --gain -1 --prefix fmcw_11k_21k_30_$1inch_tgrh_$trial"
    aplay fmcw_11k_21k_30_48000_30.wav & ./micarray_raw_recorder_direct_org --sampling_frequency 48000 --duration 30 --gain -1 --prefix fmcw_11k_21k_30_$1inch_tgrh_$trial
done


