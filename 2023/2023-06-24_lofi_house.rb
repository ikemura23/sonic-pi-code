# Title: Reveiller
# Original Song: https://music.youtube.com/watch?v=7A6f4YFHA2I&feature=share
# Output Url: https://twitter.com/ikemura23/status/1672843990973173765
# Background: https://youtu.be/uuRY0_kXksU?t=761

use_debug false
use_bpm 62

hat_loops = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/drum_loops/LCC_hat loops"
clap_sample = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/one shots/LCC_Claps"

## flag ######################

kick_play = 0
hat_play = 0
clap_play = 0

synth1_play = 0
synth2_play = 1
synth3_play = 1

bass1_play = 0
bass2_play = 0

######################

live_loop :met do
  sleep 1
end

## drum ######################

##| with_fx :lpf, cutoff: 100 do

live_loop :kick_sample, sync: :met do
  if kick_play < 1 then stop end
  use_sample_defaults amp: 1.4
  3.times do
    sample :bd_tek
    sleep 0.375
  end
  
  sleep 2-0.375*3-0.25
  
  sample :bd_tek, amp: [0,1.4].tick("bd")
  sleep 0.25
end


live_loop :clap, sync: :met do
  if clap_play < 1 then stop end
  
  with_fx :reverb do
    use_sample_defaults rate: 1.2
    ## Pattern 1
    
    ##| sleep 0.5
    ##| sample clap_sample, 0
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




## bass ############################################

live_loop :bass1_loop, sync: :met do
  ##| stop
  if bass1_play < 1 then stop end
  
  with_fx :reverb do
    use_synth :dpulse
    use_synth_defaults release: 0.15, sustain: 0, amp: 1.3, cutoff: 80
    
    sleep 0.5
    sleep 0.5
    sleep 0.25
    
    play :d2, amp: 0.5, release: 0.15/2
    sleep 0.125
    play :d2
    sleep 0.125
    
    play :e2, amp: 0.5, release: 0.15/2
    sleep 0.125
    play :e2
    sleep 0.125
    
    play :a1, amp: 0.5, release: 0.15/2
    sleep 0.125
    play :a1
    sleep 0.125
    
    sleep 2
end end


live_loop :bass2_loop, sync: :met do
  if bass2_play < 1 then stop end
  key = :d2
  
  with_fx :reverb do
    use_synth :beep
    
    play key, sustain: 0, release: 4, amp: 1.5, note_slide: 4 do |s|
      control s, note: key-17
    end
    sleep 4
  end
end

## synth ############################################

define :play_times do |chord|
  in_thread do
    play_pattern_timed chord, 0.04, amp: 0.5
  end
end

live_loop :synth1, sync: :met do
  if synth1_play < 1 then stop end
  
  use_synth :dsaw
  use_synth_defaults release: 1.5, sustain: 0, amp: 0.9, attack: 0, cutoff: 80
  
  s = 1
  a = 0.6
  chords = [
    chord(:fs3, :m7),
    chord(:fs3, :m7),
    chord(:fs3, :m7),
    chord(:ab3, :m7),
  ]
  
  with_fx :reverb, mix: 0.5, room: 0.7, amp: a do
    with_fx :distortion, distort: 0.3 do
      for chord in chords do
        play_times chord
        sleep 2
      end
    end
  end
end

live_loop :synth2, sync: :met do
  if synth2_play < 1 then stop end
  
  use_synth :dtri
  use_synth_defaults release: 1.8, sustain: 0, amp: 1, attack: 0.2,
    cutoff: 75
  s = 2
  a = 1.2
  chords = [
    chord(:fs3, :m7),
    chord(:cs3, :m7),
    chord(:b2, :m7),
    chord(:b2, :m7),
  ]
  
  with_fx :hpf, mix: 0.2, amp: a do
    with_fx :reverb, mix: 0.7, room: 0.7 do
      with_fx :distortion, distort: 0.3 do
        
        for chord in chords do
          play chord
          sleep s
        end
        
      end
    end
  end
end

live_loop :synth3, sync: :met do
  if synth3_play < 1 then stop end
  use_synth :hollow
  use_synth_defaults release: 2, sustain: 0, amp: 3, attack: 0.2#, cutoff: 80
  s = 2
  a = 1.2
  chords = [
    chord(:fs4, :m7),
    chord(:cs4, :m7),
    chord(:b3, :m7),
    chord(:b3, :m7),
  ]
  
  with_fx :hpf, mix: 0.2, amp: a do
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
