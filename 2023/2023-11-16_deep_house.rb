# inspier https://music.youtube.com/watch?v=AHmHJKuN1Wc&si=szT8dPFPnHrIbKuo
# Twitter output: https://twitter.com/ikemura23/status/1724972789818700187

use_bpm 64

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

drum_play = 1
splash_play = 1

melody_play = 1
bass_play = 1
hollow_play = 0

live_loop :met do
  sleep 0.5
end

# Drum --------------------

live_loop :kick, sync: :met do
  if drum_play < 1 then stop end
  use_sample_defaults amp: 1, lpf: 130
  sample :bd_tek # :bd_haus :bd_tek :bd_ada
  sleep 0.5
end

live_loop :hhc1, sync: :met do
  if drum_play < 1 then stop end
  with_fx :hpf, cutoff: 100, amp: 0.8 do
    sample :hat_psych, amp: 0.5, rate: 1
    sleep 0.25
  end
end

live_loop :cymbal_open, sync: :met do
  if drum_play < 1 then stop end
  sleep 0.25
  with_fx :distortion do
    sample :hat_cats, lpf: 100, amp: 1.1
  end
  ##| sample :drum_cymbal_open, amp: 0.25, beat_stretch: 1.8, finish: 0.125, hpf: 90#, rate: 1.1
  sleep 0.25
end

# clap
live_loop :clap, sync: :met do
  if drum_play < 1 then stop end
  sleep 0.5
  with_fx :reverb, mix: 0.3 do
    sample clap, 0, amp: 1, lpf: 120, rate: 0.9
  end
  sleep 0.5
end


# splash
live_loop :splash, sync: :met do
  if splash_play < 1 then stop end
  sample :drum_splash_hard, amp: 0.5
  sleep 16
end


live_loop :misc_cineboom, sync: :met do
  if splash_play < 1 then stop end
  sleep 14
  with_fx :hpf, cutoff: 100 do
    sample :misc_cineboom, beat_stretch: 10, finish: 0.2, amp: 2
  end
  sleep 2
end



# Random Melody ------------------

##| live_loop :chord1, sync: :met do
##|   stop
##|   if melody_play < 1 then stop end
##|   use_synth :dsaw
##|   use_synth_defaults release: 2, cutoff: 80

##|   4.times do |i|
##|     ##| ef = 0
##|     ef = if i == 3 then 3 else 0 end
##|     sleep 0.75
##|     with_fx :slicer, mix: 0.15, phase: 0.375 do
##|       with_fx :wobble, phase: 3, invert_wave: 0, mix: 0.2, wave: 2 do
##|         play chord(:g3+ef, :M7), attack: 0.03
##|         sleep 2-0.75
##|       end
##|     end
##|   end
##| end

live_loop :chord2, sync: :met do
  ##| if melody_play < 1 then stop end
  use_synth :dsaw # :rodeo
  use_synth_defaults release: 0.2, cutoff: 70, attack: 0.07, amp: 2
  
  ##| sleep 0.75
  with_fx :hpf, cutoff: 70 do
    with_fx :slicer, mix: 0.15, phase: 0.375 do
      ##| with_fx :wobble, phase: 3, invert_wave: 0, mix: 0.2, wave: 2 do
      
      play chord(:f3, :M7), sustain: 1.75
      sleep 1.75
      
      play chord(:f3-5, :M7), sustain: 2.25
      sleep 2.25
      
      play chord(:f3-10, :M7), sustain: 1.75
      sleep 1.75
      
      play chord(:f3-8, :M7), sustain: 2.25
      sleep 2.25
      ##| end
    end
  end
end


# Hollow --------------------

live_loop :strings_sound, sync: :met do
  if hollow_play < 1 then stop end
  use_synth :hollow # :rodeo
  use_synth_defaults  release: 0,  amp: 2, release: 0.25
  
  ##| sleep 0.75
  with_fx :hpf, cutoff: 50 do
    ##| with_fx :slicer, mix: 0.15, phase: 0.375 do
    ##| with_fx :wobble, phase: 3, invert_wave: 0, mix: 0.2, wave: 2 do
    _invert = 2
    play chord(:f5, :M7, invert: _invert), sustain: 1.75
    sleep 1.75
    
    play chord(:f5-5, :M7, invert: _invert), sustain: 2.25
    sleep 2.25
    
    play chord(:f5-10, :M7, invert: _invert), sustain: 1.75
    sleep 1.75
    
    play chord(:f5-8, :M7, invert: _invert), sustain: 2.25
    sleep 2.25
  end
  ##| end
  ##| end
end


##| live_loop :mero2, sync: :met do
##|   if hollow_play < 1 then stop end
##|   with_fx :slicer, phase: 3, mix: 0.2 do
##|     synth :hollow, note: chord(:g3, :M7, invert: 2), release: 0, sustain: 8, amp: 2.5
##|   end
##|   sleep 8
##| end


# Bass ----------------------

live_loop :bass_loop, sync: :met do
  if bass_play < 1 then stop end
  use_synth :dsaw
  use_synth_defaults release: 0, cutoff: 40, amp: 1.2
  
  play :g2, sustain: 0.125
  sleep 0.25
  play :g2, sustain: 0.37
  sleep 0.375
  play :g2, sustain: 0.25
  sleep 0.375
  
  play :g1, sustain: 0.25
  sleep 0.25
  play :g1, sustain: 0.25
  sleep 0.25
  play :a1, sustain: 0.5
  sleep 0.5
end
