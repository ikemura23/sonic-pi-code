# output https://twitter.com/ikemura23/status/1449391414706458626

use_bpm 75
drum = "/Users/k_ikemura/Music/sonic_pi/LCA_drum loops"

live_loop :drum do
  sample drum, 0,beat_stretch:8 , amp: 1, lpf: 130, hpf: 50
  sleep 8
end

live_loop :base do
  ##| use_synth :fm #:sine
  play :f2, amp: 3, release: 0, sustain: 0.75
  sleep 0.75
  play :c2, amp: 3, release: 0.5, sustain: 0.75
  sleep 0.75
  sleep 2.5
  
end


live_loop :cd do
  use_synth :sine
  
  sleep 0.5
  play chord(:a3, :M7), release: 0, sustain: 0.25
  sleep 0.25
  sleep 0.5
  play chord(:a3+2, :M7), release: 0, sustain: 0.25
  sleep 0.25
  sleep 0.5
  
  ##| sleep 2
  
  sleep 0.5
  play chord(:a3+3, :M7), release: 0, sustain: 0.25
  sleep 0.25
  sleep 0.5
  play chord(:a3+5, :M7), release: 0, sustain: 0.25
  sleep 0.25
  sleep 0.5
end
