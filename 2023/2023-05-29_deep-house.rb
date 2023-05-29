# Title: Deep House Jam - 2023-05-29
# Output url: https://twitter.com/ikemura23/status/1663182987624853504
# Background Movie: https://www.youtube.com/watch?v=311Ts_OJvDw

use_debug false
use_bpm 67

## flag ######################

bd_play = 1
hat_close_play = 1
hat_open_play = 0

synth1_play = 1
synth2_play = 0
bass_play = 1

snare_play = 1

voice_play = 0

######################

live_loop :met do
  sleep 1
end

## drum ######################

live_loop :kick, sync: :met do
  if bd_play < 1 then stop end
  
  sample :bd_tek, cutoff: 100, amp: 1.2
  sleep 0.5
end

with_fx :lpf, cutoff: 120 do
  live_loop :hat1, sync: :met do
    if hat_close_play < 1 then stop end
    
    sleep 0.125
    ##| sample :drum_cymbal_closed, amp: 0.5, rate: 1.5
    sleep 0.125
    sample :drum_cymbal_closed, amp: 1.2, rate: 1
    sleep 0.125
    ##| sample :drum_cymbal_closed, amp: 1.2, rate: 1.7
    sleep 0.125
  end
  
  live_loop :hat2, sync: :met do
    if hat_close_play < 1 then stop end
    sleep 0.5
    
    sleep 0.125
    sample :drum_cymbal_closed, amp: 0.5, rate: 1.5
    sleep 0.125
    sample :drum_cymbal_closed, amp: 0.5, rate: 1.5
    sleep 0.125
    sleep 0.125
    
    sample :drum_cymbal_closed, amp: 0.5, rate: 1.5
    sleep 0.125
    sample :drum_cymbal_closed, amp: 0.5, rate: 1.5
    sleep 0.125
    ##| sample :drum_cymbal_closed, amp: 1.2, rate: 1
    sleep 0.125
    sample :drum_cymbal_closed, amp: 0.5, rate: 1.5
    sleep 0.125
    
    sleep 2.5
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
  
  live_loop :sample_voice, sync: :met do
    if voice_play < 1 then stop end
    
    use_sample_defaults amp: 1#, rate: -1
    sleep 2
    with_fx :hpf, cutoff: 80 do
      with_fx :echo, phase: 0.25, decay: 3 do
        sample :loop_weirdo, start: 0.14, finish: 0.22
        sleep 0.75
        sample :loop_weirdo, start: 0.14, finish: 0.22
        sleep 8-0.75-2
      end
    end
  end
end

## bass ######################
live_loop :bass_loop, sync: :met do
  ##| stop
  if bass_play < 1 then stop end
  
  with_fx :reverb do
    use_synth :fm # :fm :beep
    use_synth_defaults release: 0.15, sustain: 0.1, amp: 1.2, attack_level: 1, cutoff: 100
    
    note = :f2
    
    play note
    sleep 0.25
    play note
    sleep 0.25
    play note, sustain: 0.25
    sleep 0.25
    
    sleep 0.125
    
    play note
    sleep 0.125
    play note+2
    sleep 0.25
    play note+2
    sleep 0.25
    
    play note
    sleep 0.25
    play note
    sleep 0.25
    
  end
end

## synth ######################

live_loop :synth1, sync: :met do
  if synth1_play < 1 then stop end
  
  s = 8
  use_synth :dsaw
  use_synth_defaults release: 0, sustain: s, amp: 0.8#, cutoff: 100
  
  key = :ab3
  
  with_fx :hpf, mix: 0 do
    
    with_fx :reverb, mix: 0.8, room: 0.8 do
      with_fx :slicer, phase: 0.5, mix: 0.6, invert_wave: 1 do
        with_fx :wobble, wave: 2, invert_wave: 1, phase: 8, mix: 1 do
          
          play chord(key, :M7)
          sleep s
          
          play chord(key+2, :M7)
          sleep s
          
          ##| play chord(key-2, :M7), release: s
          ##| sleep s*2
          
          ##| play chord(key+7, :M7, invert: -2),sustain: 4
          ##| sleep 4
        end
      end
    end
  end
end


live_loop :synth2, sync: :met do
  if synth2_play < 1 then stop end
  
  use_synth :sine
  use_synth_defaults release: 2.5, sustain: 0, amp: 1.3#, cutoff: 100
  
  key = :ab3
  
  with_fx :hpf, mix: 0 do
    
    with_fx :reverb, mix: 0.7, room: 0.7 do
      ##| with_fx :slicer, phase: 0.5, mix: 0.6, invert_wave: 1 do
      ##| with_fx :wobble, wave: 2, invert_wave: 1, phase: 8, mix: 1 do
      
      play chord(key, :M7)
      sleep 2
      
      play chord(key+2, :M7)
      sleep 2
      
      play chord(key-2, :M7), release: 4
      sleep 4
      
      ##| play chord(key+7, :M7, invert: -2),sustain: 4
      ##| sleep 4
      ##| end
      ##| end
    end
  end
end

live_loop :synth3, sync: :met do
  stop
  use_random_seed 12
  
  use_synth :dpulse
  use_synth_defaults release: 0.125, amp: 0.8#, cutoff: 100
  
  key = :ab4
  cd = chord(key, :M7)
  
  4.times do
    play cd.choose
    sleep [0.125,0.25].choose
  end
  
end