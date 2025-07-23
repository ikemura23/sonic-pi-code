# Original : https://music.youtube.com/watch?v=TR3BtpPhMl0&si=m21QiMu_vGx9JZgF It's All About That Feeling HATT.D • GLBDOM Therapy 2

claps = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/one\ shots/LCC_Claps"
hats = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/drum_loops/LCC_hat\ loops"

use_bpm 60

live_loop :met do
  sleep 0.5
end

# Drum ########################

live_loop :kick, sync: :met do
  
  stop
  
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
    sample hats, 1, beat_stretch: 8, finish: 0.25
    sleep 2
  end
end


live_loop :hats_sample_2, sync: :met do
  ##| stop
  use_sample_defaults amp: 0.6
  
  sleep 0.25
  sample :hat_yosh
  sleep 0.25
end

live_loop :name, sync: :met do
  
  sample :drum_splash_hard
  sleep 8
  
end


# Clap ########################

live_loop :clap, sync: :met do
  ##| stop
  use_sample_defaults amp: 1.1
  sleep 0.5
  with_fx :reverb, mix: 0.1 do
    sample claps, 1
  end
  
  sleep 0.5
end


# Synth ########################

live_loop :synth_1, sync: :met do
  ##| stop
  
  default_release = 4
  default_cutoff = 80
  
  use_synth :dsaw
  use_synth_defaults release: default_release,
    cutoff: default_cutoff, amp: 1.2,  attack: 0.2
  
  fx_mix  = 0.2
  
  with_fx :wobble, phase: 4, mix: fx_mix, wave: 0 do
    with_fx :slicer, mix: 0.3, phase: 0.25 do
      with_fx :hpf,cutoff: 70 do
        play chord(:bb3, :M7)
        sleep 4
        
        play chord(:a3, :m7)
        sleep 4
      end
    end
  end
end

live_loop :synth_2, sync: :met do
  stop
  
  use_synth :tech_saws # :dtri or :tech_saws
  use_synth_defaults release: 0.25, amp: 1.5
  
  f = chord(:f5, :M7, invert: 0)
  ##| d = chord(:d4, :M7, invert: 0)
  
  notes = [
    f, 0, 0, f,
    0, 0, f, 0,
    0, f, 0, 0,
    f, 0, f, 0,
    
    f, 0, 0, f,
    0, 0, f, 0,
    0, f, 0, 0,
    f, 0, 0, 0,
  ]
  
  fx_phase = 2
  fx_mix = 0.25
  
  with_fx :wobble, phase: fx_phase, mix: fx_mix do
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
  use_synth_defaults release: 0.1, cutoff: 90, amp: 1.2, sustain: 0.1
  
  
  f = :f1
  g = :g1
  a = :a1
  c = :c2
  d = :d2
  
  notes = [
    f, 0, 0, f,
    0, 0, g, 0,
    0, g, 0, 0,
    a, 0, c, 0,
    
    f, 0, 0, f,
    0, 0, g, 0,
    0, g, 0, g,
    a, 0, c, 0,
    
    f, 0, 0, f,
    0, 0, g, 0,
    0, g, 0, 0,
    a, 0, c, 0,
    
    f, 0, 0, f,
    0, 0, g, 0,
    g, 0, a, 0,
    d, 0, c, 0,
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
