# Original : https://www.youtube.com/watch?v=svAExyQpAAg

claps = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/one\ shots/LCC_Claps"
hats = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/drum_loops/LCC_hat\ loops"

use_bpm 64

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
  
  default_release = 1.2
  default_cutoff = 110
  
  use_synth :dpulse
  use_synth_defaults release: default_release,
    cutoff: default_cutoff, amp: 1.0,  attack: 0.04
  
  cs = chord(:cs3, :m7)
  eb = chord(:eb3, :m7)
  fs = chord(:fs3, :m7)
  f  = chord(:f3,  :m7)
  bb = chord(:bb2, :m7)
  ab = chord(:ab2, :m7)
  
  notes = [
    cs, 0, 0, eb,
    0, 0, fs, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    cs, 0, 0, 0,
    0, 0, 0, eb,
    0, f, 0, 0,
    0, 0, 0, 0,
    
    cs, 0, 0, 0,
    0, 0, 0, ab,
    0, 0, 0, 0,
    0, 0, 0, bb,
    0, 0, 0, 0,
    0, 0, 0, bb,
    0, 0, 0, 0,
    0, 0, 0, 0,
  ]
  
  fx_echo_mix    = 0.2
  fx_reverb_mix  = 0.5
  fx_reverb_room = 0.3
  
  with_fx :echo, decay: 2, phase: 0.25, mix: fx_echo_mix do
    with_fx :reverb, mix: fx_reverb_mix,
    room: fx_reverb_room do
      
      notes.each do |note|
        play note if note != 0
        sleep 0.25
      end
      
    end
  end
end


# Bass ########################

live_loop :bass_loop, sync: :met do
  
  ##| stop
  
  use_synth :fm
  use_synth_defaults release: 0.125, cutoff: 50, amp: 1.5, sustain: 0.1
  
  g = :gs2
  g12 = g+12
  g7 = g+7
  
  notes = [
    g, g12, g, g,
    g12, g7, g, g12,
    g, g12, g, g,
    g, g12, g7, g12,
  ]
  
  with_fx :reverb, mix: 0.3 do
    with_fx  :lpf, cutoff: 100, mix: 0 do
      p = notes.tick
      
      notes.each do |note|
        play note if note != 0
        sleep 0.25
      end
    end
  end
end
