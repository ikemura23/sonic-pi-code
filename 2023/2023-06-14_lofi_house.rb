# Title: Do You Feel It Too? - 2023/06/14
# Output url: https://twitter.com/ikemura23/status/1668767028407312387
# Original: https://music.youtube.com/watch?v=fuvxwQGHYzo&feature=share
# Background Movie: https://youtu.be/ylAnbG3WN9k?t=1404

use_debug false
use_bpm 60

## flag ######################

bd_play = 1
hat_close_play = 1
##| hat_open_play = 0
snare_play = 1

synth1_play = 0
synth2_play = 1
synth3_play = 1

bass1_play = 1
bass2_play = 1


######################

live_loop :met do
  sleep 1
end

## drum ######################


with_fx :lpf, cutoff: 100 do
  with_fx :reverb, pre_mix: 0.7, room: 0.5 do
    
    live_loop :kick, sync: :met do
      if bd_play < 1 then stop end
      
      sample :bd_zome, cutoff: 80, amp: 2
      sleep 0.5
      
    end
    with_fx :distortion, distort: 0.7 do
      
      live_loop :hat1, sync: :met do
        if hat_close_play < 1 then stop end
        
        use_sample_defaults rate: 1.2, amp: 0.9
        
        with_fx :hpf, cutoff: 100 do
          with_fx :bitcrusher, cutoff: 130 do
            
            sleep 0.125
            sample :drum_cymbal_closed
            sleep 0.125
            sample :drum_cymbal_closed
            sleep 0.25
            sleep 0.25
            sample :drum_cymbal_closed
            sleep 0.5
            sample :drum_cymbal_closed
            sleep 0.5
            sample :drum_cymbal_closed
            sleep 0.125
            sample :drum_cymbal_closed
            sleep 0.125
            
          end
        end
      end
      
      live_loop :snare_loop, sync: :met do
        if snare_play < 1 then stop end
        
        co = 100
        at = 0.00
        r=4
        a=1
        
        sleep 0.5
        
        sample :sn_generic, rate: r+1, cutoff: co, amp: a, attack: at
        sample :sn_generic, rate: r, start: 0.02, cutoff: co, pan: 0.2, amp: a, attack: at
        
        sleep 0.5
      end
    end
  end
end

## bass ######################

live_loop :bass1_loop, sync: :met do
  ##| stop
  if bass1_play < 1 then stop end
  
  with_fx :reverb do
    use_synth :beep # :fm :beep
    use_synth_defaults release: 2, sustain: 0.2, amp: 1.3, attack_level: 1#, cutoff: 80
    
    keys = [
      :fs2,
      :f2,
      :eb2,
    ]
    
    play keys.tick
    sleep 2
    play keys.tick
    sleep 2
    play keys.tick, release: 4
    sleep 4
    
  end
end

live_loop :bass2_loop, sync: :met do
  ##| stop
  if bass2_play < 1 then stop end
  
  use_synth :dpulse # :fm
  
  with_fx :reverb do
    p
    use_synth_defaults release: 0.15, sustain: 0, amp: 3.5, attack_level: 3, cutoff: 75
    
    keys = [
      :fs1,
      :f1,
      :eb1,
      :eb1,
    ]
    
    for key in keys do
      sleep 0.5
      play key
      sleep 0.125
      play key
      sleep 0.25
      play key
      sleep 0.375
      play key
      sleep 2-0.5-0.125-0.25-0.375
    end
    
  end
end

## synth ######################

define :play_times do |chord, release=2|
  in_thread do
    play_pattern_timed chord, 0.08, amp: 0.5, release: release
  end
end

live_loop :synth1, sync: :met do
  if synth1_play < 1 then stop end
  
  s = 2
  a = 0.8
  sliser_mix = 0 # 0,5
  
  use_synth :saw
  use_synth_defaults release: s, sustain: 0.2, attack: 0, cutoff: 100
  
  chords = [
    chord(:fs3, '6'),
    chord(:f3,  :m7),
    chord(:eb3, :M7),
    
    chord(:fs3, :M7),
    chord(:bb3, :m7),
    chord(:eb3, :M7, invert: 2),
  ]
  
  with_fx :reverb, mix: 0.5, room: 0.7, amp: a do
    with_fx :slicer, phase: 0.5, mix: sliser_mix, invert_wave: 1, smooth: 0.5  do
      with_fx :distortion, distort: 0.2 do
        
        play_times chords.tick
        sleep s
        
        play_times chords.tick
        sleep s
        play_times chords.tick, s*1.5
        sleep s
        sleep s
      end
    end
  end
end

live_loop :synth2, sync: :met do
  if synth2_play < 1 then stop end
  
  s = 2
  a = 4
  
  use_synth :hollow
  use_synth_defaults release: s, sustain: 0.8, attack: 0.5#, cutoff: 80
  
  chords = [
    chord(:fs3, '6'),
    chord(:f3,  :m7),
    chord(:eb3, :M7),
  ]
  
  with_fx :reverb, mix: 0.5, room: 0.7, amp: a do
    with_fx :slicer, phase: 0.5, mix: 0, invert_wave: 1, smooth: 0.5  do
      with_fx :distortion, distort: 0.3 do
        
        play chords.tick
        sleep s
        
        play chords.tick
        sleep s
        play chords.tick, release: s*2
        sleep s
        sleep s
      end
    end
  end
  
end

live_loop :synth3, sync: :met do
  if synth3_play < 1 then stop end
  
  s = 2
  a = 0.6
  sliser_mix = 0.3  # 0,5
  
  use_synth :dsaw
  use_synth_defaults release: s, sustain: 0.2, attack: 0.2, cutoff: 90
  
  chords = [
    chord(:fs3, '6'),
    chord(:f3,  :m7),
    chord(:eb3, :M7),
    
    chord(:fs3, :M7),
    chord(:bb3, :m7),
    chord(:eb3, :M7, invert: 2),
  ]
  
  with_fx :reverb, mix: 0.5, room: 0.7, amp: a do
    ##| with_fx :slicer, phase: 0.5, mix: sliser_mix, invert_wave: 0, smooth: 0.5  do
      with_fx :distortion, distort: 0.3 do
        with_fx :compressor do
          play chords.tick
          sleep s
          
          play chords.tick
          sleep s
          play chords.tick, releease: s*1.5
          sleep s
          sleep s
        end
      end
    ##| end
  end
end
