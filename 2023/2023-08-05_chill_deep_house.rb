# original: https://soundcloud.com/tomvmusic2/when-we-love
# Output: 
# Background movie: https://youtu.be/YjUkT-Ufrv8

use_debug false
use_bpm 60

hat_loops = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/drum_loops/LCC_hat loops"
clap_sample = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/one shots/LCC_Claps"
stream = "/Users/k_ikemura/Music/sonic_pi/Nature"

# hat & clap sample download: https://drive.google.com/drive/folders/1q-jWGbVLQDNEw_-ecZyKIehe7vLWVgD-?usp=drive_link
# stream sound download https://drive.google.com/drive/folders/1THJ5Vi4c9xTRrXcfx6WZmVvF4E55I5CY?usp=drive_link

## flag ######################

kick_play = 1
hat_play = 1
cymbal_open_play = 0
clap_play = 1

synth1_play = 1
synth2_play = 1

bass1_play = 0
bass2_play = 1

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
  
  sample :bd_tek, amp: a, lpf: 110
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
  
  with_fx :reverb, room: 0.6 do
    use_sample_defaults  amp: 1.2, rate: 1.2, finish: 0.5
    
    sleep 0.5
    sample :drum_snare_soft
    sleep 0.5
    sleep 0.375
    sample :drum_snare_soft
    sleep 2-0.5*2-0.375
    
    sleep 0.5
    sample :drum_snare_soft
    sleep 0.5
    sleep 0.375
    sample :drum_snare_soft
    sleep 0.375
    sample :drum_snare_soft
    sleep 2-0.5*2-0.375*2
    
  end
end
##| end

live_loop :sample_hat_loops, sync: :met do
  if hat_play < 1 then stop end
  
  no=2 #0, 2
  
  sample hat_loops, no, beat_stretch: 8, start: 0, finish: 0.25, amp: 0.9
  sleep 2
end

live_loop :drum_splash, sync: :met do
  ##| sample :drum_splash_soft, lpf: 110
  sleep 32
end

## nature sound

live_loop :stream, sync: :met do
  if nature_stream_sound_play < 1 then stop end
  
  sample stream, 2, amp: 1
  sleep sample_duration(stream, 2)
end



## bass ############################################

live_loop :bass1_loop, sync: :met do
  ##| stop
  if bass1_play < 1 then stop end
  use_synth :fm
  key = :d2
  a = 0.7
  
  with_fx :reverb do
    
    sleep 0.25
    play key, amp: a, release: 0.2, sustain: 0
    sleep 0.25
    
  end
  
end


live_loop :bass2_loop, sync: :met do
  if bass2_play < 1 then stop end
  
  key = :d2
  a = 0.7
  
  with_fx :reverb do
    use_synth :beep
    ##| for k in keys do
    sleep 0.25
    play key, amp: a, release: 0, sustain: 0.25
    sleep 0.25
    ##| end
  end
end

## synth ############################################

live_loop :synth1, sync: :met do
  if synth1_play < 1 then stop end
  
  use_synth :saw
  use_synth_defaults release: 3, sustain: 0, amp: 1.5, attack: 0, cutoff: 65
  
  key = :d3
  s = 1
  a = 1
  
  with_fx :reverb, mix: 0.7, room: 0.7, amp: a do
    with_fx :distortion, mix: 0.3 do
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
end

live_loop :synth2, sync: :met do
  if synth2_play < 1 then stop end
  use_synth :hollow
  use_synth_defaults release: 2, amp: 2, attack: 0.1
  ##| s = 4
  key = :d4
  
  with_fx :hpf, mix: 0.5 do
    with_fx :slicer, invert_wave: 1, phase: 0.5, mix: 0.2 do
      play chord(:d4, :sus4, invert: 3), sustain: 8+1.75, attack: 0.05
      sleep 8+1.75
      
      play chord(:g4, :M7, invert: 1), sustain: 8-1.75, attack: 0.05
      sleep 8-1.75
    end
  end
end

###########

##| live_loop :melody, sync: :met do


##| end
