#!/bin/sh
inch=60
for chirp_dur in 75 100 #12.5 25 50 75 100
do
for run in 1 2
do
  aplay fmcw_10_5000_${chirp_dur}_0_20sec.wav & ../micarray_raw_recorder_direct_org --sampling_frequency 48000 --duration 20 --gain -1 --prefix fmcw_10k_15k_${chirp_dur}_${inch}inch_tegr0812_samedev_$run
  #echo "aplay fmcw_15_5000_${chirp_dur}_0_20sec.wav & ../micarray_raw_recorder_direct_org --sampling_frequency 48000 --duration 20 --gain -1 --prefix fmcw_15k_20k_${chirp_dur}_${inch}inch_tegr0812_samedev_$run"
  echo "sleeping"
  sleep 2
done
done
