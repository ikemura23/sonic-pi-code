# original: https://soundcloud.com/tomvmusic2/when-we-love
# Output:
# Background movie:

use_debug false
use_bpm 62

hat_loops = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/drum_loops/LCC_hat loops"
clap_sample = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/one shots/LCC_Claps"
stream = "/Users/k_ikemura/Music/sonic_pi/Nature"

## flag ######################

kick_play = 1
hat_play = 1
cymbal_open_play = 0
clap_play = 0

synth1_play = 1

synth2_play = 0
synth3_play = 0

bass1_play = 0

bass2_play = 0

nature_stream_sound_play = 0

######################

live_loop :met do
  sleep 1
end

## drum ######################

##| with_fx :lpf, cutoff: 100 do

live_loop :kick, sync: :met do
  if kick_play < 1 then stop end
  a = 1.2
  
  sample :bd_tek, rate: 1, amp: a
  sleep 0.5
end

live_loop :cymbal_open, sync: :met do
  if cymbal_open_play < 1 then stop end
  sleep 0.25
  sample :drum_cymbal_open, amp: 0.17, beat_stretch: 1.7, finish: 0.125, hpf: 80#, rate: 1.1
  sleep 0.25
end

live_loop :clap, sync: :met do
  if clap_play < 1 then stop end
  
  with_fx :reverb do
    use_sample_defaults rate: 1.2
    ## Pattern 1
    
    ##| sleep 0.5
    ##| sample clap_sample, 1, rate: 0.8, amp: 0.7
    ##| sleep 0.5
    
    ## Pattern 2
    
    sleep 3.5
    sample clap_sample, 0
    sleep 0.25
    sample clap_sample, 0, amp: [1,0,1,1].tick('clap1')
    sleep 0.125
    sample clap_sample, 0, amp: [1,0,1,0].tick('clap2')
    sleep 0.125
  end
end
##| end

live_loop :sample_hat_loops, sync: :met do
  if hat_play < 1 then stop end
  in_thread do
    ##| sample hat_loops, 7, beat_stretch: 8, start: 0, finish: 0.5
  end
  
  in_thread do
    sample hat_loops, 0, beat_stretch: 8, start: 0, finish: 0.5
  end
  sleep 4
end

## nature

live_loop :stream, sync: :met do
  if nature_stream_sound_play < 1 then stop end
  sample stream, 0, beat_stretch: 14, amp: 1.2
  sleep 14
end



## bass ############################################

live_loop :bass1_loop, sync: :met do
  ##| stop
  if bass1_play < 1 then stop end
  
  with_fx :reverb do
    use_synth :dsaw
    a = 0.7
    use_synth_defaults release: 0.15, sustain: 0, amp: a, cutoff: 80
    
    key = :f3
    
    chords = [
      chord(key, :M7),
      chord(key-5, :M7),
    ]
    
    with_fx :reverb, mix: 0.7, room: 0.7 do
      with_fx :echo, phase: 0.25, mix: 0.3 do
        for c in chords do
          4.times do |i|
          
          sleep 0.25
          
          play c, amp: 1.2
          sleep 0.375
          
          play c
          sleep 0.375
          
          play c, amp: 1.2
          sleep 0.375
          
          play c
          sleep 0.375
          if i==3 then c=chord(key, :M7) end
          play c
          sleep 0.25
        end
      end
    end
  end
  
end end


live_loop :bass2_loop, sync: :met do
  if bass2_play < 1 then stop end
  
  key = :f2
  a = 0.5
  
  keys = [
    key,
    key-5,
  ]
  
  with_fx :reverb do
    use_synth :beep
    for k in keys do
      play k, sustain: 8, amp: a
      sleep 8
    end
  end
end

## synth ############################################

define :play_times do |chord|
  in_thread do
    play_pattern_timed chord, 0.125, amp: 0.5
  end
end

live_loop :synth1, sync: :met do
  if synth1_play < 1 then stop end
  
  use_synth :saw
  use_synth_defaults release: 3, sustain: 0, amp: 0.9, attack: 0, cutoff: 60
  
  key = :d3
  s = 1
  a = 1
  chords = [
    chord(key-3, :m7),
    chord(key, :m7),
  ]
  
  with_fx :reverb, mix: 0.7, room: 0.7, amp: a do
    with_fx :compressor do
      
      play chord(key, :m7, invert: -1)
      sleep 1.75
      
      play chord(key, :m7, invert: [0,1,2].choose), release: 4
      sleep 8-1.75
      
      play chord(key, :m7, invert: -1)
      sleep 1.75
      
      play chord(key+2, :m7, invert: [0,1,2].choose), release: 4
      
      sleep 8-1.75
    end
  end
end

live_loop :synth2, sync: :met do
  if synth2_play < 1 then stop end
  
  use_synth :sine
  use_synth_defaults release: 0, sustain: 8, amp: 1, cutoff: 75
  # attack: 0.2,
  
  
  a = 0.8
  key = :d4
  
  chords = [
    chord(key, :m7),
    ##| chord(key-5, :M7),
  ]
  
  with_fx :hpf, mix: 0.2, amp: a do
    with_fx :reverb, mix: 0.7, room: 0.7 do
      with_fx :slicer, phase: 0.5, invert_wave: 1 , mix: 0.3 do
        ##| with_fx :distortion, distort: 0.1 do
        
        for chord in chords do
          play chord
          sleep 8
        end
        
      end
    end
  end
end

live_loop :synth3, sync: :met do
  if synth3_play < 1 then stop end
  use_synth :hollow
  use_synth_defaults release: 0, sustain: 8, amp: 2
  s = 8
  key = :d3
  
  chords = [
    chord(key, :m7),
    ##| chord(key-5, :m7),
  ]
  
  with_fx :hpf, mix: 0.2 do
    ##| with_fx :reverb, mix: 0.7, room: 0.7 do
    ##| with_fx :distortion, distort: 0.3 do
    
    for chord in chords do
      play chord
      sleep s
    end
    
    ##| end
    ##| end
  end
end

live_loop :synth4, sync: :met do
  if synth2_play < 1 then stop end
  
  use_synth :dsaw
  use_synth_defaults release: 0, sustain: 8, amp: 1, cutoff: 50, attack_level: 0.5
  
  
  a = 0.8
  key = :d3
  
  chords = [
    chord(key, :m7),
    ##| chord(key-5, :M7),
  ]
  
  with_fx :hpf, mix: 0.2, amp: a do
    with_fx :reverb, mix: 0.7, room: 0.7 do
      with_fx :slicer, phase: 0.5, invert_wave: 1 , mix: 0.3 do
        ##| with_fx :distortion, distort: 0.1 do
        
        for chord in chords do
          play chord, attack_level: 0.5
          sleep 8
        end
        
      end
    end
  end
  
end