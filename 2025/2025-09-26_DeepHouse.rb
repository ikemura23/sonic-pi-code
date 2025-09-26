# https://youtu.be/J5qhfr-Eoe4?si=P_8ouMSimjeNSLEI&t=2332

claps = "/Users/k_ikemura/Music/sonic_pi/LCC_CHELL_HOUSE/one\ shots/LCC_Claps"

live_loop :met do
  sleep 0.5
end

# Drum #############################
with_fx :reverb, mix: 0.4 do
  
  live_loop :kick, sync: :met do
    sample :bd_tek, amp: 1, lpf: 120
    sleep 0.5
  end
end

# Hat #############################
with_fx :reverb, mix: 0.5 do
  
  live_loop :hat1, sync: :met do
    ##| stop
    sample :hat_raw, lpf: 100 # :hat_cats :hat_psych
    sleep 0.25
    sample :hat_psych, lpf: 130 # :hat_cats :hat_psych
    sleep 0.25
    
  end
end

# Clap ########################

live_loop :clap, sync: :met do
  ##| stop
  use_sample_defaults amp: 1.5
  
  sleep 0.5
  with_fx :reverb, mix: 0.1 do
    sample claps, 0
    sleep 0.5
  end
end


# Synth #############################

live_loop :synth_1, sync: :met do
  ##| stop
  use_synth_defaults release: 0.1, sustain: 0.5
  use_synth :dsaw
  
  key = :e3
  cd = chord(:eb3, :M7)
  
  key_prog = [
    # Pattern 1
    key, key+1
  ]
  
  
  with_fx :reverb do
    with_fx :lpf, cutoff: 100, mix: 1 do
      
      synth :dsaw, note: chord(key, :m7)
      synth :sine, note: chord(key, :m7, invert: 2)
      sleep 0.5
      sleep 0.25
      
      synth :dsaw, note: chord(key+1, :m7)
      synth :sine, note: chord(key+1, :m7, invert: 2)
      sleep 0.5
      
      sleep 2-0.5*2-0.25
    end
  end
end

live_loop :synth_2, sync: :met do
  stop
  use_synth_defaults release: 0.1, sustain: 0.5
  use_synth :sine
  
  key = :e3
  inv = 2
  
  with_fx :reverb do
    with_fx :lpf, cutoff: 90, mix: 1 do
      
      play chord(key, :m7, invert: inv)
      sleep 0.5
      sleep 0.25
      
      play chord(key+1, :m7, invert: inv)
      sleep 0.5
      
      sleep 2-0.5*2-0.25
    end
  end
end

# Bass #############################

live_loop :bass_1, sync: :met do
  ##| stop
  use_synth_defaults amp: 2, release: 0.2
  use_synth :fm
  with_fx :lpf, cutoff: 90 do
    
    ##| key = [:f2, :d2, :fs2, :g2].tick
    key = :e2
    ##| 2.times do
    
    play key
    sleep 0.375
    play key
    play key
    sleep 0.375
    play key
    
    sleep 1-0.375*2
    
    play key+6
    sleep 0.25
    play key+6
    sleep 0.25
    play key+6
    sleep 0.25
    
    sleep 0.25
    ##| end
  end
end

live_loop :bass_2, sync: :met do
  ##| stop
  use_synth_defaults amp: 2, release: 0.2
  use_synth :winwood_lead
  with_fx :lpf, cutoff: 90 do
    
    ##| key = [:f2, :d2, :fs2, :g2].tick
    key = :e3
    ##| 2.times do
    
    ##| play key
    sleep 0.375
    play key
    sleep 0.375
    play key
    
    sleep 1-0.375*2
    
    play key+6
    sleep 0.25
    play key+6
    sleep 0.25
    play key+6
    sleep 0.25
    
    sleep 0.25
    ##| end
  end
  
end

# Other Sounds #############################

live_loop :glitchy, sync: :met do
  use_sample_defaults amp: 0.6
  
  sleep 3
  sample :glitch_robot1, beat_stretch: 1.2
  sleep 1
  
end
