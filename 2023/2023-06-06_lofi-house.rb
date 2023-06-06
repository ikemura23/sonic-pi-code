# Title: Lo-fi House JAM 2023/06/06
# Output url: https://twitter.com/ikemura23/status/1665895515568111616
# Background Movie: https://youtu.be/WvUfsHwsiQ8

use_debug false
use_bpm 50

## flag ######################

bd_play = 1
hat_close_play = 1
hat_open_play = 0

snare_play = 1
 
synth1_play = 1

bass_play = 1

random_merody_play = 0

######################

live_loop :met do
  sleep 1
end

## drum ######################


with_fx :lpf, cutoff: 100 do
  with_fx :distortion, distort: 0.7 do
    
    live_loop :kick, sync: :met do
      if bd_play < 1 then stop end
      
      sample :bd_haus, cutoff: 90, amp: 1
      sleep 0.5
      
    end
    
    live_loop :hat1, sync: :met do
      if hat_close_play < 1 then stop end
      
      use_sample_defaults rate: 1.1
      
      with_fx :hpf, cutoff: 100 do
        with_fx :bitcrusher, cutoff: 130 do
          
          sample :drum_cymbal_closed, amp: 0.3
          sleep 0.125
          sample :drum_cymbal_closed, amp: 0.6
          sleep 0.125
          sample :drum_cymbal_closed, amp: 1.2
          sleep 0.5
          sample :drum_cymbal_closed, amp: 1.2
          sleep 0.25
        end
      end
    end
    
    live_loop :hat_open, sync: :met do
      if hat_open_play < 1 then stop end
      sleep 0.25
      sample :drum_cymbal_open, amp: 0.25, beat_stretch: 1.8, finish: 0.125, hpf: 90, rate: 1.1
      sleep 0.25
    end
    
    live_loop :snare_loop, sync: :met do
      if snare_play < 1 then stop end
      
      co = 100
      at = 0.00
      r=3
      a=1
      
      sleep 0.5
      
      sample :sn_generic, rate: r+1, cutoff: co, amp: a, attack: at
      sample :sn_generic, rate: r, start: 0.02, cutoff: co, pan: 0.2, amp: a, attack: at
      
      sleep 0.5
    end
  end
end

## bass ######################

live_loop :bass_loop, sync: :met do
  ##| stop
  if bass_play < 1 then stop end
  
  with_fx :reverb do
    use_synth :dsaw # :fm :beep
    use_synth_defaults release: 0.125, sustain: 0.1, amp: 1.3, attack_level: 1, cutoff: 80
    
    keys = [
      :as1,
      :as1,
      :ds2, # or g1
      :ds2, # or g1
      :gb1,
      :gb1,
      :f1,
      :f1,
    ]
    
    for key in keys do
      ##| play key, release: 1.5
      ##| sleep 2
      
      sleep 0.125
      ##| play key
      sleep 0.75
      play key
      sleep 0.375
      
      play key
      sleep 0.5
      play key+[0,7,0,-5,0,-5,0,5].tick
      sleep 0.25
    end
  end
end

## synth ######################

define :play_times do |chord|
  in_thread do
    play_pattern_timed chord, 0.08, amp: 0.5
  end
end

live_loop :synth1, sync: :met do
  if synth1_play < 1 then stop end
  
  use_synth :saw
  use_synth_defaults release: 3, sustain: 1, amp: 0.9, attack: 0, cutoff: 80
  
  s = 2
  a = 0.6
  chords = [
    chord(:f3, :m7),
    chord(:g3, :m7),
    chord(:eb3,:m7),
    chord(:f3, :m7),
  ]
  
  with_fx :reverb, mix: 0.5, room: 0.7, amp: a do
    with_fx :slicer, phase: 0.5, mix: 0.5, invert_wave: 1, smooth: 0.5  do
      with_fx :distortion, distort: 0.3 do
        for chord in chords do
          play_times chord
          sleep 4
        end
      end
    end
  end
end

live_loop :random_merody, sync: :met do
  if (random_merody_play < 1) then stop end
  use_random_seed 60405 #909
  use_synth :dpulse
  tick_reset
  
  sl = [
    0.5, 0.5,
    0.5, 0.5,
    #0.375, 0.125,
    0.25, 0.25,
    0.25, 0.25,
  ]
  
  with_fx :reverb, mix: 0.7, room: 0.9 do
    with_fx :lpf, cutoff: 100 do
      sl.size.times do
        play (scale :f4,:minor_pentatonic, num_octaves: 2).shuffle.tick('key1'), release: 0.125, amp: rrand(0.7, 1)
        sleep sl.shuffle.tick('sl1')
      end
      sleep 4-sl.sum
      
      use_random_seed 543
      tick_reset
      
      sleep 0.25
      sl = sl.shuffle
      sl.size.times do
        play (scale :f4-5, :minor_pentatonic, num_octaves: 2).choose, release: 0.125, amp: rrand(0.7, 1)
        sleep sl.tick
      end
      sleep 4-sl.sum-0.25
    end
  end
end