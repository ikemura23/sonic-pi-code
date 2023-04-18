
use_debug false
use_bpm 78

synth1_play = 1

bass_play = 1
elec_play = 0

voice_play = 1

live_loop :met do
  sleep 1
end

## drum ############################################

live_loop :sample_amen_full, sync: :met do
  
  with_fx :hpf, cutoff: 65, amp: 0.6 do
    
    sample :loop_amen_full, beat_stretch: 8
    sleep 8
    
    sample :loop_amen_full, beat_stretch: 8, start: 0, finish: 0.75
    sleep 6
  end
  sleep 2
end

live_loop :sample_voice, sync: :met do
  if voice_play < 1 then stop end
  with_fx :echo, phase: 0.25, decay: 2, pre_amp: 0.8  do
    sleep 2
    sample :loop_weirdo, start: 0.14, finish: 0.22
    sleep 0.75
    sample :loop_weirdo, start: 0.14, finish: 0.22
    sleep 6-0.75
  end
end


live_loop :drum_splash, sync: :met do
  sample :drum_splash_soft
  sleep 16
end

live_loop :misc_cineboom, sync: :met do
  sleep 16
  
  sleep 13.6
  sample :misc_cineboom, beat_stretch: 12, start: 0, finish: 0.2
  sleep 2.4
  
  sleep 16
  
  sleep 14
  play :b2 , sustain: 1.7, release: 0.3, note_slide: 2, amp: 1.7 do |s|
    control s, note: :b1
  end
  sleep 2
end

live_loop :elec_blp_loop, sync: :met do
  if elec_play < 1 then stop end
  
  sleep 0.5
  ##| play_elec_blp
  sleep 1.25
  play_elec_blp
  sleep 0.25
  
  sleep 0.5
  sleep 0.25
  3.times do
    play_elec_blp
    sleep 0.25
  end
  sleep 0.25
  sleep 0.25
end

define :play_elec_blp do
  sample :elec_blip, cutoff: 100, rate: 0.9, amp: 1 #:elec_beep  :elec_blip
end


## bass ############################################

live_loop :bass_loop, sync: :met do
  if bass_play < 1 then stop end
  with_fx :reverb do
    tick_reset
    use_synth :beep # :fm :beep
    
    default_cutoff = 130
    default_amp = 1.1
    use_synth_defaults release: 0.1, sustain: 0.5, amp: default_amp, attack_level: 0, cutoff: default_cutoff
    
    keys = [:b1, :b1, :b1, :b1-2].ring
    
    4.times do
      key = keys.tick
      play key
      sleep 0.75
      play key+7
      sleep 0.5
      play key
      sleep 0.5
      play key+7, sustain: 0.25
      sleep 0.25
    end
    
    3.times do
      key = keys.tick
      play key
      sleep 0.75
      play key+7
      sleep 0.5
      play key
      sleep 0.5
      play key+7, sustain: 0.25
      sleep 0.25
    end
    sleep 2
  end
end

## synth ############################################

live_loop :synth1, sync: :met do
  if synth1_play < 1 then stop end
  use_synth_defaults release: 0, sustain: 2, amp: 1, attack: 0.12
  
  key = :b3
  
  with_fx :bpf, centre: 80, mix: 0.9 do
    ##| with_fx :wobble, invert_wave: 1, phase: 8, wave: 0, mix: 0.2 do
    
    synth :dsaw, note: chord(key, :M7, invert: 0), release: 0, sustain: 4
    sleep 4
    
    synth :dsaw, note: chord(key+3, :M7)
    sleep 2
    
    synth :dsaw, note: chord(key-2, :M7, invert: 0)
    sleep 2
  end
  ##| end
  
end
