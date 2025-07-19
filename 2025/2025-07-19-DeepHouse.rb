# Original : The Twilight Track https://music.youtube.com/watch?v=VZtWp9PxzO8&si=XHrvQKsH3b9nqB51

claps = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/one\ shots/LCC_Claps"
hats = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/drum_loops/LCC_hat\ loops"

use_bpm 60

live_loop :met do
  sleep 0.5
end

# Drum ########################

live_loop :kick, sync: :met do
  
  ##| stop
  
  28.times do
    sample :bd_tek, amp: 2
    sleep 0.5
  end
  
  sleep 2
end

# Hat ########################

live_loop :hats_sample_1, sync: :met do
  ##| stop
  use_sample_defaults amp: 1.1
  
  with_fx :reverb do
    sample hats, 0, beat_stretch: 8
    sleep 8
  end
end


live_loop :hats_sample_2, sync: :met do
  ##| stop
  use_sample_defaults amp: 0.6
  
  sleep 0.25
  sample :hat_yosh
  sleep 0.25
end



# Clap ########################

live_loop :clap, sync: :met do
  ##| stop
  use_sample_defaults amp: 1.5
  sleep 0.5
  with_fx :reverb, mix: 0.1 do
    sample claps, 0
  end
  
  sleep 0.5
end

# safari
live_loop :safari, sync: :met do
  ##| stop
  use_sample_defaults amp: 2
  sample :loop_safari, beat_stretch: 8
  sleep 8
end



# Synth ########################

live_loop :synth_1, sync: :met do
  ##| stop
  
  default_release = 1.7
  default_cutoff = 80
  
  use_synth :saw
  use_synth_defaults release: default_release,
    cutoff: default_cutoff, amp: 1.0,  attack: 0.05
  
  f = chord(:f3, :M7)
  d = chord(:d3, :M7)
  
  notes = [
    f, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, d,
    0, 0, 0, 0,
  ]
  
  fx_reverb_mix  = 0.5
  fx_reverb_room = 0.3
  
  with_fx :reverb, mix: fx_reverb_mix, room: fx_reverb_room do
    with_fx :slicer, mix: 0.2, phase: 0.375 do
      notes.each do |note|
        play note if note != 0
        sleep 0.25
      end
    end
  end
end

live_loop :synth_2, sync: :met do
  ##| stop
  
  use_synth :sine
  use_synth_defaults release: 2.25, amp: 0.8
  
  f = chord(:f4, :M7, invert: -1)
  ##| d = chord(:d4, :M7, invert: 0)
  
  notes = [
    f, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
  ]
  
  with_fx :slicer, mix: 0.2, phase: 0.375 do
    notes.each do |note|
      play note if note != 0
      sleep 0.25
    end
  end
end

live_loop :synth_3, sync: :met do
  ##| stop
  
  default_release = 0.25
  default_cutoff = 90
  
  use_synth :pluck
  use_synth_defaults release: default_release, cutoff: default_cutoff, amp: 1.3,  attack: 0.015
  
  g = :g5
  a = :a5
  
  notes = [
    0, a, 0, g,
    0, 0, g, 0,
    0, g, 0, 0,
    g, 0, 0, 0,
    
    ##| 0, g, 0, a,
    ##| 0, 0, a, 0,
    ##| 0, a, 0, 0,
    ##| a, 0, 0, 0,
    
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    
  ]
  
  fx_echo_mix    = 0.2
  fx_reverb_mix  = 0.5
  fx_reverb_room = 0.3
  
  
  with_fx :reverb, mix: fx_reverb_mix, room: fx_reverb_room do
    
    notes.each do |note|
      play note if note != 0
      sleep 0.125
    end
    
  end
  
end

live_loop :synth_4, sync: :met do
  stop
  
  default_release = 0.3
  default_cutoff = 80
  
  use_synth :pulse
  use_synth_defaults release: default_release, cutoff: default_cutoff, amp: 0.3,  attack: 0.025
  
  d = :d5
  f = :f5
  
  notes = [
    0, d, 0, d,
    0, 0, 0, 0,
    0, f, 0, d,
    0, 0, 0, 0,
  ]
  
  fx_reverb_mix  = 0.2
  fx_reverb_room = 0.1
  
  with_fx :reverb, mix: fx_reverb_mix, room: fx_reverb_room do
    
    notes.each do |note|
      play note if note != 0
      sleep 0.125
    end
    
  end
  
end


# Bass ########################

live_loop :bass_loop, sync: :met do
  
  ##| stop
  
  use_synth :dpulse
  use_synth_defaults release: 0.125, cutoff: 75, amp: 1.2, sustain: 0.1
  
  c = :c2
  d = :d2
  f = :f2
  
  notes = [
    c, 0, 0, 0,
    c, 0, 0, d,
    0, 0, d, 0,
    0, d, 0, 0,
    
    c, 0, c, 0,
    c, 0, 0, d,
    0, 0, d, 0,
    0, d, 0, 0,
    
    c, 0, 0, 0,
    c, 0, 0, d,
    0, 0, d, 0,
    0, d, 0, 0,
    
    c, 0, f, 0,
    c, 0, 0, d,
    0, 0, d, 0,
    0, d, 0, 0,
  ]
  
  with_fx :reverb, mix: 0.3 do
    with_fx  :lpf, cutoff: 100, mix: 0 do
      p = notes.tick
      
      notes.each do |note|
        play note if note != 0
        sleep 0.125
      end
    end
  end
end
