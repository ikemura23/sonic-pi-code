# Original : Clat Inlie https://soundcloud.com/inlie/clat

claps = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/one\ shots/LCC_Claps"
hats = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/drum_loops/LCC_hat\ loops"

use_bpm 70

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

live_loop :hats_sample, sync: :met do
  ##| stop
  use_sample_defaults amp: 1.5
  
  with_fx :reverb do
    sample hats, 2, beat_stretch: 8
    sleep 8
  end
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

# Synth ########################

live_loop :synth_1, sync: :met do
  ##| stop
  
  default_release = 0.2
  default_cutoff = 90
  
  use_synth :dsaw
  use_synth_defaults release: default_release,
    cutoff: default_cutoff, amp: 1.2
  
  a_M7  = chord(:a3, :M7)
  ab_m7 = chord(:ab3, :m7)
  bb_m7 = chord(:bb3, :m7)
  fs_M7 = chord(:fs3, :M7)
  
  notes = [
    a_M7, 0,0,a_M7,
    0, 0, 0, 0,
    a_M7, 0,0,ab_m7,
    0, 0, 0, 0,
    bb_m7, 0, 0, 0,
    0, 0, bb_m7, 0,
    0, 0, 0, 0,
    fs_M7, 0, 0, 0,
  ]
  
  fx_echo_mix    = 0.0
  fx_reverb_mix  = 0.2
  fx_reverb_room = 0.5
  
  with_fx :echo, decay: 2, phase: 0.25, mix: fx_echo_mix do
    with_fx :reverb, mix: fx_reverb_mix,
    room: fx_reverb_room do
      
      notes.each do |note|
        play note if note != 0
        sleep 0.125
      end
      
    end
  end
end


# Bass ########################

live_loop :bass_loop, sync: :met do
  
  stop
  
  use_synth :dpulse
  use_synth_defaults release: 0.1, cutoff: 70, amp: 1.2, sustain: 0.1
  
  a  = :a1
  ab = :g1
  gb = :gb1
  db = :db1
  
  notes = [
    a, 0, 0, a,
    0, a, 0, a,
    0, a, 0, ab,
    0, 0, 0, 0,
    gb, 0, 0, 0,
    0, 0, gb, 0,
    0, 0, 0, 0,
    db, 0, 0, 0,
  ]
  
  with_fx :reverb, mix: 0.3 do
    p = notes.tick
    
    notes.each do |note|
      play note if note != 0
      sleep 0.125
    end
    
  end
end
