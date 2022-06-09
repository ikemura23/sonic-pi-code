# https://twitter.com/ikemura23/status/1533440156694302720

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"
hatLoop="/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_hat\ loops"
##| use_random_seed 3000
use_debug false
use_bpm 65

live_loop :bd do
  sleep 0.5
  sample :bd_tek, cutoff: 130, amp: 1.2
end

live_loop :hatLoop, sync: :bd do
  sample hatLoop, 5, beat_stretch: 4, amp: 1, lpf: 110 # 4
  sleep 4
end

live_loop :clap do
  
  sleep 0.5
  sleep 0.375
  num = 7
  
  sample clap,num, amp: 1
  
  sleep 0.375
  sample clap,num, amp: 1
  
  sleep 1-0.5-0.75
end

live_loop :cymbal , sync: :bd do
  sleep 0.25
  sample :drum_cymbal_closed, amp: [1, 0.5].tick, cutoff: 120
end

live_loop :cymbal_open, sync: :bd do
  sleep 0.25
  sample :drum_cymbal_open, amp: 0.4, beat_stretch: 2, finish: 0.1, hpf: 100
  sleep 0.25
end

live_loop :base, sync: :bd do
  use_synth :tech_saws
  
  cd = chord_invert(chord(:a2, :minor),-2)
  ef = [0, 0, 1, 3].ring
  with_fx :reverb, amp: 1 do
    ##| with_fx :lpf, cutoff: 90 do
    sleep 1.25
    
    3.times do
      play cd.tick, release: 0.2
      sleep 0.125
    end
    play :a3+ef.tick, release: 0.3
    sleep 0.75-0.125*3
  end
  ##| end
end

live_loop :cd, sync: :bd do
  use_synth :supersaw
  amp = 0.7
  
  effect=[0, 0, 1, 3].ring
  name = [:madd4, :madd4, :m7, :m7]
  
  4.times do |i|
    with_fx :reverb do
      cd = chord(:a3+7+effect[i], name[i])
      play cd, sustain: 1.5, release: 0, amp: amp, cutoff: 100
      ##| play cd, sustain: 1.5, release: 0, amp: amp
      sleep 2
    end
  end
end

