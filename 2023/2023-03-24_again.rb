#output https://twitter.com/ikemura23/status/1639853321535246336
#background movie https://www.youtube.com/watch?v=hRdjb2zmWzY

use_debug false
use_bpm 65

bd_play = 1
hat_play = 1

synth_play = 0
bass_play = 1
elec_play = 1

snare_play = 1
snare_fill_play = 0

live_loop :met do
  sleep 1
end

live_loop :bd, sync: :met do
  if bd_play < 1 then stop end
  
  sample :bd_tek, cutoff: 100, amp: 1.2
  sleep 0.5
end

with_fx :lpf, cutoff: 110, mix: 0 do
  live_loop :hhc1, sync: :met do
    if hat_play < 1 then stop end
    with_fx :hpf, cutoff: 100, amp: 0.8 do
      sample :drum_cymbal_closed, amp: 0.2, rate: 1
      sleep 0.125
      ##| sample :drum_cymbal_closed, amp: 0.5, rate: 1.5
      sleep 0.125
      sample :drum_cymbal_closed, amp: 1.2, rate: 1
      sleep 0.125
      ##| sample :drum_cymbal_closed, amp: 1.2, rate: 1.7
      sleep 0.125
    end
  end
  
  live_loop :hhc2, sync: :met do
    if hat_play < 1 then stop end
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
  
  
  live_loop :snare_loop, sync: :met do
    if snare_play < 1 then stop end
    
    sleep 0.5
    with_fx :reverb, mix: 0.4, room: 0.3 do
      snare
    end
    sleep 0.5
  end
  
  live_loop :snare_fill, sync: :met do
    if snare_fill_play < 1 then stop end
    a = 0.5
    
    4.times do
      snare 4, a
      sleep 0.25
    end
    
    4.times do
      
      snare 4, a
      sleep 0.125
    end
    
    sleep 0.5
  end
  
  live_loop :elec_blp_loop, sync: :met do
    if elec_play < 1 then stop end
    sleep 0.25
    play_elec_blp
    sleep 0.75
    play_elec_blp
    sleep 1
    
    play_elec_blp
    sleep 0.25
    
    sleep 0.5
    
    3.times do
      play_elec_blp
      sleep 0.25
    end
    sleep 0.25
    
    sleep 0.25
  end
  
  
  define :snare do |r=3, a=0.85|
    
    co = 100
    at=0.00
    
    sample :sn_generic, rate: r+1, cutoff: co, amp: a, attack: at
    sample :sn_generic, rate: r, start: 0.02, cutoff: co, pan: 0.2, amp: a, attack: at
  end
  
  define :play_elec_blp do
    sample :elec_blip, cutoff: 100, rate: 0.9, amp: 1 #:elec_beep  :elec_blip
  end
  
end

## bass ##
live_loop :bass_loop, sync: :met do
  if bass_play < 1 then stop end
  bass1 :f1
end

define :bass1 do | note, ef=0|
  with_fx :reverb do
    use_synth :dpulse # :fm :beep
    use_synth_defaults release: 0.1, sustain: 0.2, amp: 1.2, attack_level: 0, cutoff: 60
    
    play note
    sleep 0.375
    play note
    sleep 0.375
    play note+7
    sleep 0.375
    play note+5
    sleep 0.375
    
    play note+5
    sleep 0.25
    play note+7
    sleep 0.25
  end
end

## synth

live_loop :synth1, sync: :met do
  if synth_play < 1 then stop end
  
  rel = 1
  sus = 6
  sl = 5
  
  key = :f4
  
  with_fx :reverb, mix: 0.7, room: 0.7 do
    
    with_fx :bpf, centre: 50, amp: 1.5 do
      
      with_fx :wobble, wave: 0, invert_wave: 1, phase: 6, mix: 0.3 do
        with_fx :slicer, phase: 0.4, mix: 0.3, invert_wave: 1 do
          synth :dsaw, note: chord(key+7, :m7, invert: [-2,1,0,2,0].choose), sustain: sus,release: rel, attack: 0.2, cutoff: 80
        end
        
        with_fx :slicer, phase: 0.4, mix: 0.3, invert_wave: 1 do
          synth :dtri, note: chord(key-5, :m7, invert: [-2,1,0,2,0].choose), sustain: sus,release: rel, attack: 0.2, cutoff: 80
        end
      end
      with_fx :wobble, wave: 0, invert_wave: 1, phase: 8, mix: 0.3 do
        with_fx :slicer, phase: 0.7, mix: 0.25, invert_wave: 0 do
          synth :dsaw, note: chord(key, :m7, invert: [0,-1,1,0].choose), sustain: sus, release: rel, attack: 0.2
        end
        
        sleep sl
      end
    end
  end
  ##| end
end
