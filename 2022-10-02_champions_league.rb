# https://twitter.com/ikemura23/status/1586512403382276098
# https://twitter.com/ikemura23/status/1586847162083774464

use_debug false
use_bpm 63

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"
hat = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_hats"
percussion = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_drum\ loops/LCKK_percussion\ loops"


mero_flag = 1
mero3_flag = 0

base_flag = 1


kick_hat_frag = 1
cymbal_open_flag = 0
splash2_flag = 1

percussion_flag = 0

live_loop :met do
  sleep 1
end

# drum -------------------

define :pattern do |pattern|
  return pattern.ring.tick == "x"
end

live_loop :percussion, sync: :met do
  if percussion_flag < 1 then stop end
  sample percussion, 4, amp: 0.7, beat_stretch: 8 #, start: 0, finish: 0.5 #7 2, 3 4 6
  sleep 4
end

live_loop :percussion2, sync: :met do
  if percussion_flag < 1 then stop end
  sample percussion, 6, amp: 0.7, beat_stretch: 6 #, start: 0, finish: 0.5 #7 2, 3 4 6
  sleep 3
end

live_loop :percussion3, sync: :met do
  if percussion_flag < 1 then stop end
  sample percussion, 4, amp: 0.4, beat_stretch: 4 #, start: 0, finish: 0.5 #7 2, 3 4 6
  sleep 2
end

live_loop :kick, sync: :met do
  if kick_hat_frag < 1 then stop end
  a = 1.8
  
  28.times do
    sample :bd_tek, rate: 0.9, amp: a, cutoff: 130
    sleep 0.5
  end
  sleep 2
end

live_loop :splash, sync: :met do
  sample :drum_splash_hard, rate: 0.9,cutoff: 130
  sleep 8
  ##| sample :drum_splash_soft ,amp: 1.5, cutoff: 100
  sleep 8
end

live_loop :splash2, sync: :met do
  if splash2_flag < 1 then stop end
  sleep 30 # 30
  a = 1
  16.times do
    sample :drum_splash_hard, amp: a, rate: 0.5, beat_stretch: 1 if pattern "--x-x-x-xxxxxxxx"
    sleep 0.125
  end
end

with_fx :echo, mix: 0.1 do
  with_fx :reverb, mix: 0.5, room: 0.5 do
    
    live_loop :clap, sync: :met do
      ##| stop
      14.times do
        sleep 0.5
        sample clap, 5, amp: 0.8, lpf: 120
        sleep 0.5
      end
      sleep 2
    end
  end
  
  with_fx :panslicer, mix: 0.2 do
    live_loop :hhc1, sync: :met do
      if kick_hat_frag < 1 then stop end
      ##| p = [-0.3, 0.3].choose
      sample hat, 9, amp: 0.5, rate: 1.5 if pattern "-x-x"
      sleep 0.25
    end
  end
end

with_fx :hpf, cutoff: 100 do
  live_loop :hh2, sync: :met do
    if cymbal_open_flag < 1 then stop end
    a = 0.8
    at = 0
    sleep 0.25
    sample :drum_cymbal_open, cutoff: 110, rate: 1, start: 0.01, finish: 0.2, amp: a, attack: at
    sleep 0.25
  end
end

# base -----------------

live_loop :base, sync: :met do
  if base_flag < 1 then stop end
  
  base :f2
  
end

define :base do |c|
  with_fx :reverb, mix: 0.3, room: 0.5 do
    
    use_synth :fm
    a = 1.5
    with_fx :lpf, cutoff: 120 do
      
      play c, sustain: 0.2, release: 0.1, amp: a
      sleep 0.25
      play c-1, sustain: 0.2, release: 0.1, amp: a
      sleep 0.25
      play c, sustain: 0.125, release: 0.1, amp: a
      sleep 0.125
      play c+12, sustain: 0.25, release: 0.125, amp: a
      sleep 0.25
      
      play c, sustain: 0.125, release: 0.1, amp: a
      sleep 0.125
      
      play c, sustain: 0.125, release: 0, amp: a
      sleep 0.125
      play c, sustain: 0.125, release: 0, amp: a
      sleep 0.125
      play c+9, sustain: 0.125, release: 0, amp: a
      sleep 0.125
      play c+8, sustain: 0.125, release: 0, amp: a
      sleep 0.125
      
      play c, sustain: 0.125, release: 0, amp: a
      sleep 0.125
      play c, sustain: 0.125, release: 0, amp: a
      sleep 0.125
      play c+9, sustain: 0.125, release: 0, amp: a
      sleep 0.125
      play c+5, sustain: 0.125, release: 0, amp: a
      sleep 0.125
    end
  end
end

with_fx :reverb, mix: 0.5, room: 0.5 do
  live_loop :mero, sync: :met do
    if mero_flag < 1 then stop end
    c = chord(:f3+4, :a)
    use_synth :dsaw
    a = 1.5
    at = 0.02
    
    with_fx :bpf do
      ##| with_fx :wobble, phase: 0.375 do
      
      3.times do
        play c, sustain: 0.1, release: 0.2, amp: a, attack: at
        sleep 0.375
      end
      sleep 4-0.375*3
    end
    ##| end
  end
  
  live_loop :mero3 , sync: :met do
    if mero3_flag < 1 then stop end
    
    a = 0.6
    use_synth :supersaw
    
    c = chord(:f3, :a, invert: 0)
    with_fx :echo, mix: 0.2 do
      
      play :fs4, sustain: 3, release: 0.5,note_slide: 0.1, amp: a do |s|
        sleep 1
        control s, note: :fs4+6
        sleep 1
        control s, note: :fs4+3
        sleep 1
      end
      sleep 3
      play :fs4-2, release: 0.3, attack: 0.05
      sleep 0.375
      play :fs4-2, release: 0.3, attack: 0.05
      sleep 0.375
      play :fs4-2, release: 0.3, attack: 0.05
      sleep 1-0.375*2
    end
  end
  
end

