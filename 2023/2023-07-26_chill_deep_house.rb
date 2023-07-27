# Title: Chill Deep House - JAM 2023-07-28
# Background movie: https://youtu.be/RTWo_0Ilf-U
# Output: 

use_debug false
use_bpm 62

hat_loops = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/drum_loops/LCC_hat loops"
clap_sample = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/one shots/LCC_Claps"

nature_stream_sound = "/Users/k_ikemura/Music/sonic_pi/Nature"

## flag ######################

kick_play = 1
hat_play = 0
cymbal_open_play = 0
clap_play = 0

synth1_play = 1
synth2_play = 1
synth3_play = 0

bass1_play = 1

nature_stream_sound_play = 1

######################

live_loop :met do
  sleep 1
end

## drum ######################

##| with_fx :lpf, cutoff: 100 do

live_loop :kick, sync: :met do
  if kick_play < 1 then stop end
  a = 1
  
  sample :bd_tek, rate: 1, amp: a, lpf: 100
  sleep 0.5
end

live_loop :cymbal_open, sync: :met do
  if cymbal_open_play < 1 then stop end
  sleep 0.25
  with_fx :distortion do
    sample :drum_cymbal_open, amp: 0.15, beat_stretch: 1, finish: 0.5, lpf: 110#, rate: 0.5
  end
  sleep 0.25
end


live_loop :clap, sync: :met do
  if clap_play < 1 then stop end
  use_sample_defaults rate: 1, amp: 0.3
  
  with_fx :reverb do
    
    sleep 0.5
    sample clap_sample, 4
    sleep 0.5
    sleep 0.375
    sample clap_sample, 4 if [false, true, false, false].tick('clap1')
    sleep 0.125
    sample clap_sample, 4
    sleep 0.5
  end
end

live_loop :sample_hat_loops, sync: :met do
  if hat_play < 1 then stop end
  
  sample hat_loops, 0, beat_stretch: 8, start: 0, finish: 0.5
  sleep 4
end

## nature ############################################

live_loop :stream, sync: :met do
  if nature_stream_sound_play < 1 then stop end
  sample nature_stream_sound, 0, beat_stretch:10, amp: 2
  sleep 10
end


## bass ############################################

live_loop :bass1_loop, sync: :met do
  ##| stop
  if bass1_play < 1 then stop end
  
  with_fx :reverb do
    use_synth :beep # :beep
    use_synth_defaults release: 0.4, amp: 1
    
    key = :e2-5
    
    ##| with_fx :reverb, mix: 0.7, room: 0.7 do
    with_fx :echo, phase: 0.25, mix: 0 do
      
      play key
      sleep 0.375
      
      play key-2
      sleep 0.375
      play key
      sleep 0.25
      
      sleep 2-0.375*2-0.25
    end
    ##| end
  end
  
end



## synth ############################################


live_loop :synth1, sync: :met do
  if synth1_play < 1 then stop end
  
  use_synth :sine #:sine #:dsaw
  use_synth_defaults release: 0, sustain: 4, amp: 1, cutoff: 80
  # attack: 0.2,
  
  a = 0.8
  key = :f3
  
  chords = [
    chord(:f3, :M7, invert: 0),
    chord(:e3, :m7, invert: 0),
    ##| chord(:f3, :M7, invert: 0),
  ]
  
  with_fx :hpf, mix: 0.2, amp: a do
    with_fx :reverb, mix: 0.7, room: 0.7 do
      with_fx :slicer, phase: 0.5, invert_wave: 1 , mix: 0.3 do
        ##| with_fx :distortion, distort: 0.1 do
        
        for chord in chords do
          play chord
          sleep 4
        end
        ##| play chord(:e3, :m7, invert: 0), sustain: 2
        ##| sleep 2
        ##| play chord(:a3, :m, invert: -2), sustain: 2
        ##| sleep 2
      end
    end
  end
end

live_loop :synth2, sync: :met do
  if synth2_play < 1 then stop end
  use_synth :hollow
  use_synth_defaults release: 0, sustain: 4, amp: 2
  s = 4
  
  chords = [
    chord(:f3, :M7, invert: 0),
    chord(:e3, :m7, invert: 0),
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

live_loop :synth3, sync: :met do
  if synth3_play < 1 then stop end
  
  ##| use_random_seed 8890 #8890 5890
  
  use_synth :dpulse
  use_synth_defaults release: 3, sustain: 0, amp: 0.1
  s = 4
  
  keys = [
    :c5,
    :b4,
    :g4,
    :e4,
    :d4,
  ]
  
  with_fx :hpf, mix: 0.2 do
    ##| with_fx :reverb, mix: 0.7, room: 0.7 do
    ##| with_fx :distortion, distort: 0.3 do
    
    for key in keys do
      play key, attack: 0.5
      sleep 1
    end
    sleep 8-keys.size*1
    ##| end
    ##| end
  end
end
