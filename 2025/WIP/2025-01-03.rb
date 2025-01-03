# last time - hous geek https://youtu.be/EUkrlXm_gFY?si=dLtPNAB9Xqzb1_wD

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
    sample :bd_tek
    sleep 0.5
  end
  
  sleep 2
end


# Hat ########################

live_loop :hats_sample, sync: :met do
  ##| stop
  with_fx :reverb do
    sample hats, 0, beat_stretch: 8
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
  use_synth_defaults release: 4, attack: 0, amp: 1
  
  use_synth :dsaw
  
  with_fx :reverb do
    with_fx :lpf, cutoff: 90, mix: 1 do
      with_fx :slicer, invert_wave: 1, mix: 0.2, phase: 0.5 do
        play chord(:e3, :M7)
        sleep 4
        
        play chord(:cs3, :m7)
        sleep 4
        
        play chord(:b3, :M7, invert: -2)
        sleep 4
        
        play chord(:eb3, :m7, invert: 0)
        sleep 4
      end
    end
  end
end

live_loop :synth_2, sync: :met do
  stop
  use_random_seed 60000 # 60000 166000
  use_synth_defaults release: 3, attack: 0, amp: 0.5
  
  use_synth :zawa # :bass_foundation
  
  with_fx :lpf, cutoff: 90 do
    with_fx :slicer, invert_wave: 1, mix: 0.2, phase: 0.5 do
      
      play chord(:e4, :M7).choose
      sleep 3
      
      3.times do
        play chord(:cs4, :m7).choose
        sleep 0.5
      end
      sleep 2.5
      
      3.times do
        play chord(:cs4, :m7).choose
        sleep 0.5
      end
      sleep 2.5
      
      sleep 0.5
      
      2.times do
        play chord(:b3, :M7).choose
        sleep 0.5
      end
      sleep 1.5
      
      2.times do
        play chord(:eb3, :m7).choose
        sleep 1
      end
      
    end
  end
end

# Bass ----------------------

progression = [
  :e1,
  :cs1,
  :b1,
  :eb1,
]

live_loop :bass_loop, sync: :met do
  stop
  use_synth :dsaw
  use_synth_defaults release: 0.1, cutoff: 60, amp: 1.5, sustain: 0.1
  
  p = progression.tick
  
  with_fx :reverb do
    2.times do
      play p
      sleep 0.25
      play p
      sleep 0.25
      sleep 0.25
      
      play p
      sleep 0.125
      play p
      sleep 0.25
      play p
      sleep 0.25
      play p
      sleep 0.125
      play p
      sleep 0.25
      play p
      sleep 0.25
    end
  end
end
