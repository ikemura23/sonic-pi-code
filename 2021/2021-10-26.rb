use_bpm 75
drum = "/Users/k_ikemura/Music/sonic_pi/LCA_drum loops"

# Welcome to Sonic Pi

live_loop :drum do
  sample drum, 9,beat_stretch:8 , amp: 1, lpf: 120, hpf: 50
  sleep 8
end

live_loop :base do
  
  play :c2, amp: 3, release: 0, sustain: 0.75
  sleep 0.75
  play :f2, amp: 3, release: 0, sustain: 0.75
  sleep 0.75
  play :f2+4, amp: 3, release: 0, sustain: 0.75
  sleep 0.75
  sleep 1.75
  
end

live_loop :cd do
  
  use_synth :sine
  
  sleep 0.5
  play chord(:d4+rrand(7,12), :M7), release: 0, sustain: 0.25
  sleep 0.75
  play chord(:d4+rrand(7,12), :M7), release: 0, sustain: 0.25
  sleep 0.5
  play chord(:d4+rrand(7,12), :M7), release: 0, sustain: 0.25
  sleep 0.25
  
end

# output https://twitter.com/ikemura23/status/1452809605323505665
