
use_debug false
use_bpm 66

bd_play = 1
hat_play = 1
cymbal_open_flag = 1

snare_play = 1

synth_play = 0
synth2_play = 1
synth3_play = 0

bass_play = 1
elec_play = 0

snare_fill_play = 0

live_loop :met do
  sleep 1
end

live_loop :bd, sync: :met do
  if bd_play < 1 then stop end
  
  sample :bd_tek, cutoff: 100, amp: 1.2 #:bd_tek :bd_ada
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
    use_synth :dtri # :fm :beep
    default_cutoff = 130
    default_amp = 1.5
    use_synth_defaults release: 0.1, sustain: 0.125,release: 0.12, amp: default_amp, attack_level: 3, cutoff: default_cutoff
    
    use_random_seed 6543 # 88 6542 6543
    key = :as1
    
    cd = (scale key, :minor_pentatonic, num_octaves: 2)
    
    sleep 0.125
    play key
    sleep 0.125
    sleep 0.125
    play cd.choose
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

## synth ######################

live_loop :synth1, sync: :met do
  if synth_play < 1 then stop end
  
  key = :as6+2
  
  with_fx :reverb, mix: 0.7, room: 0.3 do
    
    with_fx :bpf, centre: 90 do
      synth :supersaw, note: key, sustain: 8,release: 0, attack: 0.2, cutoff: 55, amp: 3
      sleep 8
    end
  end
end

live_loop :synth2, sync: :met do
  if synth2_play < 1 then stop end
  
  _cutoff = 90
  _amp = 0.7
  use_synth_defaults release: 0.1, sustain: 0.2,release: 0, amp: _amp, attack_level: 0, attack: 0, cutoff: _cutoff
  cd = chord(:as3+7, :M7, invert: 0)
  with_fx :reverb, mix: 0.5, room: 0.3 do
    
    synth :saw, note: chord(:fs3, :M7, invert: 0)
    sleep 0.375
    synth :saw, note: chord(:fs3, :M7, invert: 0)
    sleep 0.25
    sleep 4-0.375-0.5
    synth :saw, note: chord(:fs3, :M, invert: [2,-2].tick), amp: _amp-0.2, sustain: 0.2
    sleep 0.25
    
  end
  
end

live_loop :synth3, sync: :met do
  if synth3_play < 1 then stop end
  use_synth_defaults release: 0, sustain: 2, attack_level: 0, attack: 0
  
  cd = chord(:fs3+2, :sus4, invert: 1)
  
  with_fx :bpf, centre: 70 do
    with_fx :wobble, invert_wave: 1, phase: 2, wave: 2 do
      synth :dsaw, note: cd#, cutoff: 60
      sleep 2
    end
  end
  
end
