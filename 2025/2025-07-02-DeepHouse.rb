# 2025-07-02 Deep House

# Shared on SNS
#   X (Twitter): https://x.com/ikemura23/status/1940649931481796849
#   Youtube: TBD

claps = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/one\ shots/LCC_Claps"
hats = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/drum_loops/LCC_hat\ loops"

use_bpm 60

live_loop :met do
  sleep 0.5
end

# Drum ########################

live_loop :kick, sync: :met do
  ##| if drum_kick_play < 1 then stop end
  
  28.times do
    sample :bd_tek, amp: 2
    sleep 0.5
  end
  
  sleep 2
end


# Hat ########################

live_loop :hats_sample, sync: :met do
  ##| stop
  with_fx :reverb do
    sample hats, 0, beat_stretch: 8, amp: 1.2
    sleep 8
  end
end

# Clap ########################

live_loop :clap, sync: :met do
  ##| stop
  sleep 0.5
  with_fx :reverb do
    sample claps, 5
  end
  
  
  sleep 0.5
end

# Synth ########################

live_loop :synth_1, sync: :met do
  ##| stop
  use_synth :saw
  use_synth_defaults release: 0.25, cutoff: 100, amp: 0.9
  sleep 0
  with_fx :echo, decay: 2, phase: 0.25, mix: 0.5 do
    play chord(:c4, :m7)
    sleep 0.375
    
    play chord(:c4, :m7)
    sleep 0.375
    play chord(:c4, :m7)
    sleep 0.375
    
    sleep 2 - 0.375*3
  end
end

live_loop :synth_2, sync: :met do
  ##| stop
  use_synth :tb303 # :chiplead :tb303
  
  sleep 1.25
  with_fx :wobble, phase: 0.9, invert_wave: 1 do
    play chord(:c4, :m7)
    
    sleep 0.75
  end
  sleep 0
  
end

live_loop :string, sync: :met do
  
  stop
  
  use_synth :hollow
  use_synth_defaults amp: 3, sustain: 4, cutoff: 80
  
  play :g5
  sleep 4
  
end

# Bass ----------------------


live_loop :bass_loop, sync: :met do
  ##| stop
  use_synth :dsaw
  use_synth_defaults release: 0.1, cutoff: 80, amp: 1.1, sustain: 0.1
  
  progression = [
    :c2,
    :f1,
  ]
  
  with_fx :reverb, mix: 0.5 do
    p = progression.tick
    ##| 2.times do
    play p
    sleep 0.125
    play p
    sleep 0.25
    play p
    sleep 0.25
    
    play p-2
    sleep 0.125
    play p-2
    sleep 0.125
    
    sleep 0.125
    ##| end
    
  end
end
