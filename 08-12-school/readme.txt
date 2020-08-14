0) Build my_matrix_hal/demo 
by doing 
cd ${my_matrix_hal_dir}/build
cmake ..
make -j4 && sudo make install
# should be able to find ${my_matrix_hal_dir}/build/demos/micarray_raw_recorder_direct_org

1) cd ${aoa_beamforming_script_dir}/08-12-school
2) create symbolic link by doing below 
ln -s ${my_matrix_hal_dir}/build/demos/micarray_raw_recorder_direct_org . 

3) sh run.sh (change the parameters accordingly before runnning. run.sh will run command something like below )  
aplay fmcw_15_5000_25_0_20sec.wav & ./micarray_raw_recorder_direct_org --sampling_frequency 48000 --duration 20 --gain -1 --prefix fmcw_15k_20k_25_36inch_tegr0812_samedev_1

4) sh git_checkin.sh (convert raw to wav and check in to github) 

