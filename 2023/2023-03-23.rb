use_debug false
use_bpm 67

bd_play = 1
hat_play = 1

synth_play = 1
bass_play = 1
elec_play = 0

snare_play = 1
snare_fill_play = 0

live_loop :met do
  sleep 1
end

live_loop :bd, sync: :met do
  if bd_play < 1 then stop end
  sleep 0.5
  sample :bd_tek, cutoff: 100, amp: 1.2
end

with_fx :lpf, cutoff: 110 do
  live_loop :hhc1, sync: :met do
    if hat_play < 1 then stop end
    
    sleep 0.125
    ##| sample :drum_cymbal_closed, amp: 0.5, rate: 1.5
    sleep 0.125
    sample :drum_cymbal_closed, amp: 1.2, rate: 1
    sleep 0.125
    ##| sample :drum_cymbal_closed, amp: 1.2, rate: 1.7
    sleep 0.125
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
    snare
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
live_loop :bass_loop, sync: :bd do
  if bass_play < 1 then stop end
  bass1 :f2
end

define :bass1 do | note, ef=0|
  with_fx :reverb do
    use_synth :fm # :fm :beep
    use_synth_defaults release: 0.1, sustain: 0.2, amp: 1, attack_level: 1, cutoff: 100
    
    play note
    sleep 0.5
    play note
    sleep 0.375
    play note+8
    sleep 1-0.5-0.375
    
    sleep 0.25
    play note+5
    sleep 0.25
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
  sus = 5
  sl = 4
  
  key = :f4
  
  with_fx :reverb, mix: 0.8, room: 0.7 do
    
    with_fx :bpf, centre: 50, amp: 2 do
      with_fx :wobble, wave: 0, invert_wave: 1, phase: 6, mix: 0.3 do
        with_fx :slicer, phase: 0.4, mix: 0.3, invert_wave: 1 do
          synth :dsaw, note: chord(key+7, :m, invert: [-2,1,0,2,0].choose), sustain: sus,release: rel, attack: 0.2, cutoff: 80
        end
        
        with_fx :slicer, phase: 0.7, mix: 0.25, invert_wave: 0 do
          synth :sine, note: chord(key, :m, invert: [0,-1,1,0].choose), sustain: sus, release: rel, attack: 0.2
        end
        
        sleep sl
      end
    end
  end
  ##| end
end
