# Title: Alone With You - 2023-06-01
# Original Song: https://music.youtube.com/watch?v=uqi1ORDmsXs&feature=share
# Output Url: https://twitter.com/ikemura23/status/1664088343796408320
# Background Movie: https://youtu.be/ylAnbG3WN9k

use_debug false
use_bpm 58

## flag ######################

bd_play = 0
hat_close_play = 0
hat_open_play = 0

snare_play = 1

synth1_play = 0
synth2_play = 0
synth3_play = 1

bass1_play = 0
bass2_play = 0

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

live_loop :bass1_loop, sync: :met do
  ##| stop
  if bass1_play < 1 then stop end
  
  with_fx :reverb do
    use_synth :dpulse # :fm :beep
    use_synth_defaults release: 0.25, sustain: 0.1, amp: 1.3, attack_level: 1, cutoff: 80
    
    keys = [
      :e1,
      :g1,
      :a1,
      :d2,
      :e1,
      :g1,
      :c1,
      :d1,
    ]
    
    for key in keys do
      ##| play key, release: 1.5
      ##| sleep 2
      
      sleep 0.125
      play key
      sleep 0.75
      play key
      sleep 0.375
      
      play key
      sleep 0.375
      play key
      sleep 0.375
    end
end end

live_loop :bass2_loop, sync: :met do
  ##| stop
  if bass2_play < 1 then stop end
  
  with_fx :reverb do
    use_synth :dpulse # :fm :beep
    use_synth_defaults release: 0.125, sustain: 0.1, amp: 1.3, attack_level: 1, cutoff: 80
    
    keys = [
      :e1,
      :e1,
      :e1,
      :e1,
      :e1,
      :e1,
      :g1,
      :g1,
    ]
    
    for key in keys do
      ##| play key, release: 1.5
      ##| sleep 2
      
      sleep 0.125
      play key
      sleep 0.75
      play key
      sleep 0.375
      
      play key
      sleep 0.375
      play key
      sleep 0.375
    end
  end
end

## synth ######################

define :play_times do |chord|
  in_thread do
    play_pattern_timed chord, 0.07, amp: 0.5
  end
end

live_loop :synth1, sync: :met do
  if synth1_play < 1 then stop end
  
  use_synth :saw
  use_synth_defaults release: 3, sustain: 1, amp: 0.9, attack: 0, cutoff: 80
  
  s = 2
  a = 0.6
  chords = [
    chord(:e3, :M7),
    chord(:e3, :M7),
    chord(:e3, :M7),
    chord(:g3, :M7),
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

live_loop :synth2, sync: :met do
  if synth2_play < 1 then stop end
  
  use_synth :saw
  use_synth_defaults release: 2, sustain: 0, amp: 1, cutoff: 80
  s = 2
  a = 1.2
  chords = [
    chord(:e3, :M7),
    chord(:g3, :M7),
    chord(:a3, :m7),
    chord(:d3, :M7),
    chord(:e3, :M7),
    chord(:g3, :M7),
    chord(:c3, :M7),
    chord(:d3, :M7),
  ]
  
  with_fx :hpf, mix: 0.2, amp: a do
    with_fx :reverb, mix: 0.7, room: 0.7 do
      with_fx :distortion, distort: 0.3 do
        
        for chord in chords do
          play_times chord
          sleep s
        end
        
      end
    end
  end
end

live_loop :synth3, sync: :met do
  if synth3_play < 1 then stop end
  use_synth :dsaw
  use_synth_defaults release: 2.5, attack: 0.2, cutoff: 90
  a = 0.7
  
  with_fx :hpf, mix: 0.2, amp: a do
    with_fx :reverb, mix: 0.7, room: 0.7 do
      with_fx :distortion, distort: 0.3 do
        
        3.times do
          play_times chord(:e3, :M7)
          sleep 4
        end
        play_times chord(:e3+3, :M7)
        sleep 4
      end
    end
  end
end
