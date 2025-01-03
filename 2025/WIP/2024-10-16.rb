# Seren Deep - Reach Out (Monoloco - Re-Dub)

claps = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/one\ shots/LCC_Claps"

use_bpm 65

live_loop :met do
  sleep 0.5
end


# Drum ########################

live_loop :kick, sync: :met do
  ##| if drum_kick_play < 1 then stop end
  
  sample :bd_tek
  sleep 0.5
  
end

# Clap ########################

live_loop :clap, sync: :met do
  ##| if drum_clap_play < 1 then stop end
  ##| use_synth :sc808_clap
  ##| use_synth_defaults amp: 1.5
  
  sleep 0.5
  
  sample claps, 5
  
  sleep 0.5
end

# Synth ########################

live_loop :synth_1, sync: :met do
  ##| stop
  use_synth_defaults release: 2, attack: 0, amp: 1
  
  use_synth :saw
  
  with_fx :reverb do
    with_fx :lpf, cutoff: 70, mix: 1 do
      
      play chord(:g3, :M7)
      sleep 1.75
      
      play chord(:fs3, :m7)
      sleep 2
      
      play chord(:ab3, :m7)
      sleep 2
      
      play chord(:b3, :M)
      sleep 2
      sleep 0.25
    end
  end
end
