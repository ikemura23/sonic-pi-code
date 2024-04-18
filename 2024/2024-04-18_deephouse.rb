# Deep House
# Background movie: https://www.youtube.com/watch?v=Sx8D7_bBB14

# Output
#  twitter: https://twitter.com/ikemura23/status/1780958001798787101

clap = "/Users/k_ikemura/Music/sonic_pi/LCKK_SUNNY_HOUSE/LCKK_one\ shots/LCKK_claps"

live_loop :met do
  sleep 0.5
end

with_fx :distortion, amp: 1 do
  
  live_loop :kick, sync: :met do
    ##| stop
    
    sample :bd_fat, # :bd_tek :bd_gas bd_fat
      amp: 1, lpf: 110
    sleep 0.5
  end
  
  
  live_loop :hat, sync: :met do
    ##| stop
    use_sample_defaults cutoff: 100, amp: 1.2
    
    3.times do
      sleep 0.25
      sample :hat_raw
      sleep 0.25
    end
    
    sleep 0.25
    sample :hat_raw
    sleep 0.125
    
    sample :hat_raw
    sleep 0.125
  end
  
  live_loop :hat2, sync: :met do
    stop
    use_sample_defaults cutoff: 100, amp: 0.8
    
    sleep 1
    sample :hat_star
    sleep 1
  end
  
end

live_loop :clap, sync: :met do
  ##| stop
  with_fx :reverb do
    sleep 0.5
    
    sample clap, 3, cutoff: 110
    
    sleep 0.5
  end
end

with_fx :slicer, invert_wave: 1, phase: 0.5, mix: 0.3 do
  
  live_loop :synth1, sync: :met do
    ##| stop
    use_synth_defaults release: 1, sustain: 3.5, sustain_level: 0.8, attack: 1, amp: 4
    use_synth :hollow
    with_fx :reverb do
      
      play chord(:bb4, :M7)
      sleep 4
      
      play chord(:bb4, :M7)
      sleep 4
      
      play chord(:f4, :M7)
      sleep 4
      
      play  chord(:f4, :M7)
      sleep 4
      ##| end
    end
  end
  
  live_loop :synth2, sync: :met do
    ##| stop
    use_synth_defaults release: 1, sustain: 3.5,sustain_level: 0.8, attack: 1, amp: 0.7, cutoff: 60
    use_synth :saw #:sine
    
    with_fx :reverb do
      with_fx :distortion, amp: 1 do
        play chord(:bb3, :M7, invert: -2)
        sleep 4
        
        play chord(:bb3, :M7, invert: -1)
        sleep 4
        
        play chord(:f3, :M7, invert: -2)
        sleep 4
        
        play chord(:f3, :M7, invert: -1)
        sleep 4
      end
    end
  end
  
  live_loop :synth3, sync: :met do
    stop
    use_random_seed 1000
    use_synth_defaults release: 3, amp: 0.8, cutoff: 40
    use_synth :dsaw
    
    ##| tick_reset
    
    with_fx :reverb do
      with_fx :echo do
        with_fx :bitcrusher, mix: 0.2 do
          
          cd = chord(:f5, :M7, invert: [-1,0,1].choose).shuffle.ring
          sleep 3
          3.times do
            play cd.tick
            sleep 0.5
          end
          sleep 4-0.5*3
          sleep 1
          
          2.times do
            play cd.tick
            sleep 1
          end
          sleep 2
        end
        
      end
    end
  end
  
  live_loop :bass1, sync: :met do
    ##| stop
    use_synth_defaults release: 5, amp: 1.5 #1.5
    use_synth :beep
    
    play :bb1
    sleep 4
    
    play :c2
    sleep 4
    
    play :f2
    sleep 4
    
    play [:d2,:f2].tick
    sleep 4
    
  end
end

live_loop :bass2, sync: :met do
  ##| stop
  use_synth_defaults release: 0.15, amp: 3, cutoff: 80
  use_synth :pulse
  
  keys = [:bb1,:c2, :f1, :f1]
  
  4.times do
    key = keys.tick
    4.times do
      sleep 0.125
      play key
      sleep 0.25
      play key
      sleep 0.375
      play key
      sleep 0.25
    end
  end
end
