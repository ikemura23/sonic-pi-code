# output twitter https://twitter.com/ikemura23/status/1644896300037718018
# background movie https://www.youtube.com/watch?v=wViaZrGMzoI

use_debug false
use_bpm 66

bd_play = 0
hat_play = 1
cymbal_open_flag = 0

snare_play = 1

synth_play = 0
synth2_play = 0
synth3_play = 0

bass_play = 1
elec_play = 1

snare_fill_play = 0

live_loop :met do
  sleep 1
end

live_loop :bd, sync: :met do
  if bd_play < 1 then stop end
  
  sample :bd_ada, cutoff: 100, amp: 1.2 #:bd_tek :bd_ada
  sleep 0.5
end

with_fx :lpf, cutoff: 110, mix: 0 do
  live_loop :hhc1, sync: :met do
    if hat_play < 1 then stop end
    with_fx :hpf, cutoff: 100, amp: 0.8 do
      sample :drum_cymbal_closed, amp: 0.2, rate: 1
      sleep 0.125
      sleep 0.125
      sample :drum_cymbal_closed, amp: 1.2, rate: 1
      sleep 0.125
      sleep 0.125
    end
  end
  
  live_loop :hhc2, sync: :met do
    if hat_play < 1 then stop end
    
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
    sleep 0.125
    sample :drum_cymbal_closed, amp: 0.5, rate: 1.5
    sleep 0.125
    
  end
  
  ##| live_loop :sample_loop_tabla, sync: :met do
  ##|   sample :loop_tabla, beat_stretch: 8#, lpf: 100
  ##|   sleep 8
  ##| end
  
  live_loop :cymbal_open, sync: :met do
    if cymbal_open_flag < 1 then stop end
    sleep 0.25
    sample :drum_cymbal_open, amp: 0.25, beat_stretch: 1.8, finish: 0.125, hpf: 90#, rate: 1.1
    sleep 0.25
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
    ##| play_elec_blp
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

## bass ######################

live_loop :bass_loop, sync: :met do
  if bass_play < 1 then stop end
  bass1 chord(:f1, :m).choose
end

define :bass1 do | note, ef=0|
  with_fx :reverb do
    use_synth :dpulse # :fm :beep
    default_cutoff = 60
    default_amp = 1
    use_synth_defaults release: 0.1, sustain: 0.125,release: 0.12, amp: default_amp, attack_level: 2, attack: 0, cutoff: default_cutoff
    
    use_random_seed 88 # 88 318 346 322 189 187 88
    key = :as1
    
    cd = (scale key, :minor_pentatonic, num_octaves: 2)
    
    sleep 0.125
    play key
    sleep 0.125
    sleep 0.125
    sleep 0.125
    
    3.times do
      play cd.choose
      sleep 0.125
    end
    sleep 0.125
    
    sleep 0.125
    play cd.choose
    sleep 0.125
    play cd.choose
    sleep 0.125
    sleep 0.125
    
    sleep 0.125
    3.times do
      play cd.choose
      sleep 0.125
    end
    
  end
end

## synth

live_loop :synth1, sync: :met do
  if synth_play < 1 then stop end
  
  rel = 1
  sus = 6
  sl = 5
  
  key = :as4
  
  with_fx :reverb, mix: 0.7, room: 0.7 do
    
    with_fx :bpf, centre: 50, amp: 1 do
      
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

live_loop :synth2, sync: :met do
  if synth2_play < 1 then stop end
  
  _cutoff = 80
  _amp = 0.5
  use_synth_defaults release: 0.1, sustain: 0.25,release: 0, amp: _amp, attack_level: 0, attack: 0, cutoff: _cutoff
  cd = chord(:fs3, :M7, invert: 2)
  with_fx :reverb, mix: 0.5, room: 0.3 do
    
    sleep 0.25
    synth :saw, note: cd
    sleep 4-0.5
    synth :saw, note: cd
    sleep 0.25
    
  end
  
end

live_loop :synth3, sync: :met do
  if synth3_play < 1 then stop end
  use_synth_defaults release: 0.05, sustain: 0.125, attack_level: 0, attack: 0, cutoff: 100
  
  with_fx :reverb, mix: 0.7, room: 0.7 do
    
    key = :fs3+2
    cd = chord(key, :sus4)
    sleep 2
    with_fx :echo, decay: 4, phase: 0.375 do
      synth :saw, note: chord(key, :sus4, invert: [0,2,-1,1].choose)
      ##| sleep 0.5
      
    end
    sleep 2
    
    ##| synth :dsaw, note: cd
    ##| sleep 0.5
    ##| synth :dsaw, note: cd
    ##| sleep 0.375
    ##| synth :dsaw, note: cd
    ##| sleep 0.375
    
    ##| synth :dsaw, note: cd
    ##| sleep 0.375
    ##| synth :dsaw, note: cd
    ##| sleep 0.375
  end
end
