use_bpm 70

live_loop :met do
  sleep 0.5
end

# Drum #############################
with_fx :reverb, mix: 0.4 do
  
  live_loop :kick, sync: :met do
    sample :bd_tek, amp: 1, lpf: 110
    sleep 0.5
  end
end

# Hat #############################
with_fx :reverb, mix: 0.8 do
  live_loop :hat1, sync: :met do
    ##| stop
    
    sleep 0.25
    sample :hat_psych, lpf: 130 # :hat_cats :hat_psych
    sleep 0.25
    
  end
  
  live_loop :hat2, sync: :met do
    ##| stop
    
    sleep 0.125
    sample :hat_raw, lpf: 100 # :hat_cats :hat_psych
    
  end
end

# Synth #############################

live_loop :synth_1, sync: :met do
  ##| stop
  use_synth_defaults release: 1
  use_synth :dsaw
  
  with_fx :reverb do
    
    play chord(:f3, :m7)
    sleep 2
    
    play chord(:d3, :m7)
    sleep 2
    
    play chord(:fs3, :m7)
    sleep 2
    
    play chord(:g3, :m7)
    sleep 2
  end
end

# Bass #############################

live_loop :bass, sync: :met do
  ##| stop
  use_synth_defaults amp: 1.5, release: 0.2
  use_synth :pulse
  with_fx :lpf, cutoff: 80 do
    
    4.times do
      key = [:f2, :d2, :fs2, :g2].tick
      2.times do
        sleep 0.125
        play key-5
        sleep 0.125
        play key
        sleep 0.125
        play key-5
        sleep 0.125
        
        sleep 0.125
        play key-2
        sleep 0.125
        sleep 0.125
        play key
        sleep 0.125
      end
    end
  end
  
end
