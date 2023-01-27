drum_top_loop = "/Users/k_ikemura/Music/sonic_pi/LCA_LIQUID_DNB/LCA_drum\ loops/LCA_top\ loops"
synth_loop = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/synth_loops"

use_bpm 80

live_loop :met do
  sleep 1
end

live_loop :kick, sync: :met do
  sample :bd_haus, amp: 2
  sleep 0.5
end

live_loop :splash, sync: :met do
  with_fx :reverb do
    sample :drum_splash_hard
  end
  sleep 16
end

live_loop :sample_drum_top_loop, sync: :met do
  sample drum_top_loop, 8,beat_stretch: 8 , amp: 1, start: 0, finish: [1, 0.75].ring.tick
  sleep 8
end

live_loop :sample1, sync: :met do
  ##| stop
  num = 7 #7 17
  sample synth_loop, num ,beat_stretch: 16, amp: 2 #, rate: 0.5
  sleep 16
end

live_loop :sample2, sync: :met do
  stop
  sleep 2
  num = 1 # 0 1
  sample synth_loop, num ,beat_stretch: 8, amp: 1, start: 0, finish: 0.25
  sleep 2
end

live_loop :sample3, sync: :met do
  stop
  ##| sleep 2
  num = 6 #5 6
  sample synth_loop, num ,beat_stretch: 16, amp: 1, start: 0, finish: 0.25
  sleep 4
end

base_note = (scale :c1, :minor_pentatonic, num_octaves: 1).shuffle
base_sleep = [0.25, 0.125]
base_amp = 1.2

live_loop :base, sync: :met do
  ##| stop
  use_random_seed 400000 # 400000 3200 3400
  8.times do
    sl = base_sleep.choose
    n = base_note.tick
    
    synth :fm, note: n, amp: base_amp, release: 0, sustain: 0.125
    synth :fm, note: n+12, amp: base_amp-0.3, release: 0, sustain: 0.125
    synth :dsaw, note: n+12, amp: base_amp, release: 0, sustain: 0.125 # :dsaw :subpulse :sine
    sleep sl
  end
end
