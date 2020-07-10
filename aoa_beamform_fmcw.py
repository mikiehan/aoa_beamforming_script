import os, sys

def call_aoa(aoa_duration, sampling_rate, prefix):
  aoa_cmd = './direction_of_arrival_demo_direct_music ' + str(aoa_duration) + ' --sampling_frequency ' + str(sampling_rate) + ' > ' + prefix + '.out'
  print(aoa_cmd)
  #os.system(aoa_cmd)
  return

def find_aoa(prefix):
  with open(prefix + '.out') as fp:
    lines = fp.readlines()[8:]
    map = dict()
    max_key = "0.0 0.0"
    max_count = 0
    for line in lines:
      a, p =  line.strip().split(" ")[0:2]
      #print(a + ' ' + p)
      key = str(a) + ' ' + str(p)
      if key in map:
        map[key] += 1
      else:
        map[key] = 1
      if max_count < map[key]:
        max_count = map[key]
        max_key = key
  azi, pol = max_key.split(" ")
  return float(azi), float(pol)

def play_fmcw(prefix):
  fmcw_cmd = 'aplay fmcw_' + prefix + '.wav &'
  os.system(fmcw_cmd) 

def beamform_raw_record(azi, pol, dist_mm, sampling_freq, dur, prefix, gain):
  beamform_cmd = './micarray_raw_recorder_direct --sampling_frequency ' + str(sampling_freq) + \
                 ' --duration ' + str(dur) + ' --gain ' + str(gain) + \
                 ' --azimutal_angle ' + str(azi) + \
                 ' --polar_angle ' + str(pol) + \
                 ' --distance ' + str(dist_mm) + \
                 ' --prefix ' + str(prefix)
  print(beamform_cmd)
  #os.system(beamform_cmd)

min_freq = 11
max_freq = 21
chirp_duration = 30
sampling_rate = 48000
distance_mm = sys.argv[1]
micarray_gain = -1 
duration = 120 # 2 min 

prefix = str(min_freq) + 'k_' + str(max_freq) + 'k_' + str(chirp_duration) + '_' + str(sampling_rate)  
#print(prefix)
voice_aoa_duration = 3
call_aoa(voice_aoa_duration, sampling_rate, prefix)
#azimutal_angle, polar_angle = find_aoa(prefix)
#print(azimutal_angle)
#play_fmcw(prefix)
#beamform_raw_record(azimutal_angle, polar_angle, distance_mm, sampling_rate, duration, prefix, micarray_gain)

